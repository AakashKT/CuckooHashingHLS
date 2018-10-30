#include "execute.h"
#include <assert.h>
#include <ap_int.h>


//http://www.azillionmonkeys.com/qed/hash.html
unsigned terrible_hash_fn(int key, int salt) {
	return ((unsigned int)(key + salt) % HASH_TABLE_SIZE);
}

unsigned hash_picker_fn(int key) {
	return key % NUM_HASH_TABLES;
}

KMetadata::KMetadata() : occupied(false) {};

Response::Response() : tag(OP_TYPE_ILLEGAL),
		search_value(0),
		delete_element_not_found(false),
		search_element_not_found(false),
		insert_collided(false) {
}

Request create_random_request(unsigned int random[3]) {
	Request req;
	req.tag = (OpType)(random[0] % 3);

	// Pick keys from a very small key space
	// to make sure that we get SEARCH and DELETE,
	// of keys that we have already seen, as well
	// as collisions.
	req.key = random[1] % 5;

	switch (req.tag) {
	case OP_TYPE_INSERT:
		req.insert_value = random[2];
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



Response execute(Request req,
		// stored in BRAM: (k, address in DRAM)
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]) {
	// DRAM: synthesize as AXI
	#pragma HLS INTERFACE m_axi depth=1 port=key_to_val

	// BRAM
	#pragma HLS RESOURCE variable=key_to_metadata core=RAM_1P_BRAM
	#pragma HLS INTERFACE ap_memory port=key_to_metadata

	Response resp;
	resp.tag = req.tag;

	int hashes[NUM_HASH_TABLES];

	// value that is used to pick the hash function h_n
	int pick_ix = hash_picker_fn(req.key);

	assert (pick_ix >= 0);
	assert (pick_ix < NUM_HASH_TABLES);

	/*
	// we can't write nice code like this, because there's
	// no function pointer support :(
	for(int i = 0; i < NHASH; i++) {
		hashes[i] = G_HASH_FUNCTIONS[i](req.key);
	}
	*/

	static const int salt = 0xDEADBEEF;
	hashes[0] = terrible_hash_fn(req.key, salt);
	hashes[1] = terrible_hash_fn(req.key, salt);
	hashes[2] = terrible_hash_fn(req.key, salt);

	// pick the correct hash to now perform the  operation
	const int hash = hashes[pick_ix];

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

		// TODO: check for collision
		// DRAM
		key_to_val[pick_ix][hash].key = hash;
		key_to_val[pick_ix][hash].value = req.insert_value;

		// BRAM
		key_to_metadata[pick_ix][hash].key = req.key;
		// I don't understand this two tiered mechanism thing.
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

// I'm asuming int is 32 bit
ap_int<32> lfsr_init() {
	return 0XCAFEBABE;
}

ap_int<32> lfsr_next(ap_int<32> lfsr) {
    // taps: 32 30 29 27; feedback polynomial: x^32 + x^30 + x^29 + x^27
	ap_int<32> bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
    return (lfsr >> 1) | (bit << 31);
}

void traffic_generate_and_execute() {
	static const int NUM_REQUESTS_TO_GENERATE = 1000;

	// stored in BRAM
	KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE];
	// stored in DRAM: (key, value)
	KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE];

	ap_int<32> lfsr = lfsr_init();
	unsigned int random[3];
	for(int i = 0; i < NUM_REQUESTS_TO_GENERATE; i++) {
		for(int j = 0; j < 3; j++) {
			random[j] = lfsr_next(lfsr);
		}

		Request req = create_random_request(random);
		execute(req, key_to_metadata, key_to_val);
	}
}
