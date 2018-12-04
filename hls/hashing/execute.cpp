#include "execute.h"
#include <assert.h>
#include <iostream>
#include <stdio.h>
#include <memory.h>
// #include <ap_int.h>


//http://www.azillionmonkeys.com/qed/hash.html
unsigned terrible_hash_fn(int key, int salt) {
	return ((unsigned int)(key + salt) % HASH_TABLE_SIZE);
}

unsigned hash_picker_fn(int key) {
	return key % NUM_HASH_TABLES;
}

// Request

Request Request::mSearch(Key k) {
	Request r;
	r.tag = OP_TYPE_SEARCH;
	r.key = k;
	return r;
}
Request Request::mkInsert(Key k, Value v) {
	Request r;
	r.key = k;
	r.tag= OP_TYPE_INSERT;
	r.insert_value = v;
	return r;
}

Request Request::mkDelete(Key k) {
	Request r;
	r.key = k;
	r.tag = OP_TYPE_DELETE;
	return r;
}


// Metatada
KMetadata::KMetadata() : occupied(false) {};

// Response

Response::Response() : tag(OP_TYPE_ILLEGAL),
		search_value(0),
		delete_element_not_found(false),
		search_element_not_found(false),
		insert_collided(false) {
}

Request create_random_request(unsigned int random[3]) {
	Request req;
	// req.tag = static_cast<OpType>(random[0] % 3);
	req.tag = random[0] % 3;

	// Pick keys from a very small key space
	// to make sure that we get SEARCH and DELETE,
	// of keys that we have already seen, as well
	// as collisions.
	static const int KEY_SPACE = 5;
	req.key = random[1] % KEY_SPACE;

	switch (req.tag) {
	case OP_TYPE_INSERT:
		static const int VALUE_SPACE = 5;
		req.insert_value = random[2] % VALUE_SPACE;
		return req;

	case OP_TYPE_DELETE:
	case OP_TYPE_SEARCH:
		return req;
	default:
		assert (false && "unknown tag type");
	}

	assert (false && "unreachable");
	return req;
}


union RequestPacker {
	Request r;
	uint64_t packed;
};

void request_pack(Request r, uint32_t *base) {
	uint32_t *packed = base;
	*packed = r.insert_value;
	packed++;

	*packed = r.key;
	packed++;

	*packed = r.tag;
	packed++;
	assert(packed - base == REQUEST_PACK_STRIDE);
}

Request request_unpack(const uint32_t *base) {
	Request r;
	const uint32_t *packed = base;
	r.insert_value = *packed;
	packed++;

	r.key  = *packed;
	packed++;

	r.tag = *packed;
	packed++;
	assert(packed - base == REQUEST_PACK_STRIDE);

	return r;

}


void response_pack(Response r, uint32_t *base) {
	uint32_t *packed = base;

	*packed = r.search_value;
	packed++;

	*packed = r.tag;
	packed++;

	*packed = (r.delete_element_not_found << 2) |
			(r.insert_collided << 1) |
			(r.search_element_not_found);

	packed++;

	assert(packed - base == RESPONSE_PACK_STRIDE);
}
Response response_unpack(const uint32_t *base) {
	const uint32_t *packed = base;
	Response r;


	r.search_value = *packed;
	packed++;

	r.tag = *packed;
	packed++;

	r.search_element_not_found = *packed & 0x1;
	r.insert_collided = *packed & (1 << 1);
	r.delete_element_not_found = *packed & (1 << 2);
	packed++;

	assert(packed - base == RESPONSE_PACK_STRIDE);

	return r;
}


uint64_t response_pack(Response r) {
	uint64_t packed;
	packed = r.tag;
	packed = (packed << 32) | r.search_value;
	packed = (packed << 1) | r.delete_element_not_found;
	packed = (packed << 1) | r.search_element_not_found;
	packed =  (packed << 1 ) | r.insert_collided;
	return packed;
}
Response response_unpack(uint64_t packed) {
	Response r;
	r.insert_collided = packed & 1;
	packed = packed >> 1;

	r.search_element_not_found = packed & 1;
	packed = packed >> 1;

	r.delete_element_not_found = packed & 1;
	packed = packed >> 1;

	r.search_value = packed & (((uint64_t)1 << 33) - 1);
	packed = packed >> 32;

	r.tag = packed;

	return r;
}



//EXECUTION----------------------------



Response execute(Request req,
		// stored in BRAM: (k, address in DRAM)
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]) {


	// DRAM: synthesize as AXI

	Response resp;
	resp.tag = req.tag;

	unsigned int hashes[NUM_HASH_TABLES];

	// value that is used to pick the hash function h_n
	unsigned int pick_ix = hash_picker_fn(req.key);

	assert (pick_ix >= 0);
	assert (pick_ix < NUM_HASH_TABLES);

	/*
	// we can't write nice code like this, because there's
	// no function pointer support :(
	for(int i = 0; i < NHASH; i++) {
		hashes[i] = G_HASH_FUNCTIONS[i](req.key, salt[i]);
	}
	*/
	// How do I parallelize this?
	static const int salt[] = {1, 2, 100};
	hashes[0] = terrible_hash_fn(req.key, salt[0]);
	hashes[1] = terrible_hash_fn(req.key, salt[1]);
	hashes[2] = terrible_hash_fn(req.key, salt[2]);

	// pick the correct hash to now perform the  operation
	const unsigned int hash = hashes[pick_ix];

	assert (hash >= 0);
	assert (hash < HASH_TABLE_SIZE);

	switch (req.tag) {
	case OP_TYPE_ILLEGAL:
		assert(0 && "received request with illegal tag");
		break;

	case OP_TYPE_INSERT:

		if (key_to_metadata[pick_ix][hash].occupied) {
			resp.insert_collided = true;
			break;
		}
		else {
			resp.insert_collided = false;
		}

		assert (key_to_metadata[pick_ix][hash].occupied == false);

		// DRAM
		key_to_val[pick_ix][hash].key = hash;
		key_to_val[pick_ix][hash].value = req.insert_value;

		// BRAM
		key_to_metadata[pick_ix][hash].key = req.key;
		// I don't understand this two tiered mechanism thing.
		// TODO: in the metadata, do we need to store the address? I think not, right?
		key_to_metadata[pick_ix][hash].occupied = true;
		break;

	case OP_TYPE_DELETE:

		// If the location is unoccupied or occupied by another
		// key, bail
		if (key_to_metadata[pick_ix][hash].occupied == false ||
				key_to_metadata[pick_ix][hash].key != req.key) {
			resp.delete_element_not_found = true;
			break;
		}

		resp.delete_element_not_found = false;
		assert (key_to_metadata[pick_ix][hash].occupied == true);

		// tombstone the data.
		key_to_metadata[pick_ix][hash].occupied = false;

		break;

	case OP_TYPE_SEARCH:

		// TODO: increase code reuse between this branch
		// and the delete branch.

		if (key_to_metadata[pick_ix][hash].occupied == false ||
				key_to_metadata[pick_ix][hash].key != req.key) {
			resp.search_element_not_found = true;
			break;
		}


		resp.search_element_not_found = false;
		resp.tag = OP_TYPE_SEARCH;

		resp.search_value = key_to_val[pick_ix][hash].value;
		break;
	}

	return resp;
}

// A lightweight LSFR implementation
// http://homepage.mac.com/afj/taplist.html

typedef int int32;
// I'm asuming int is 32 bit
int32 lfsr_init() {
	return 0XCAFEBABE;
}

int32 lfsr_next(int32 lfsr) {
    // taps: 32 30 29 27; feedback polynomial: x^32 + x^30 + x^29 + x^27
	int32 bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
    return (lfsr >> 1) | (bit << 31);
}

void traffic_generate_and_execute(
		uint32_t test_zynq_access[NUM_TEST_REQUESTS],
		uint32_t reqresps[(REQUEST_PACK_STRIDE + RESPONSE_PACK_STRIDE) * NUM_TEST_REQUESTS],
		// stored in BRAM
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]) {
#pragma HLS DATA_PACK variable=reqresps
#pragma HLS DATA_PACK variable=key_to_val
#pragma HLS DATA_PACK variable=key_to_metadata
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE bram port=key_to_val
#pragma HLS INTERFACE bram port=test_zynq_access
#pragma HLS INTERFACE bram port=key_to_metadata bundle=key_to_metadata
#pragma HLS INTERFACE bram port=reqresps



	int32 lfsr = lfsr_init();
	//index at whch rrps is being written to
	int writeix = 0;

	unsigned int random[3];
	for(int i = 0; i < NUM_TEST_REQUESTS; i++) {
		//test_zynq_access[i] = i * 2;


		for(int j = 0; j < 3; j++) {
			random[j] = lfsr_next(lfsr);
		}



		Request req = create_random_request(random);
		Response resp = execute(req, key_to_metadata, key_to_val);

		request_pack(req, reqresps + i * (REQUEST_PACK_STRIDE + RESPONSE_PACK_STRIDE));
		response_pack(resp, reqresps + i * (REQUEST_PACK_STRIDE + RESPONSE_PACK_STRIDE) + REQUEST_PACK_STRIDE);
	}
}
