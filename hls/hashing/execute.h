#pragma once
#ifndef EXECUTE
#define EXECUTE_

#include <stdint.h>

// --- Make these sizes prime, so that hashing works decent ---
// number of hash tables;
static const int NUM_HASH_TABLES = 3;
// size of each hash table
static const int HASH_TABLE_SIZE = 128;

typedef uint32_t Key;
// an address in DRAM;
typedef int DRAMAddr;
typedef uint32_t Value;

struct KMetadata {
	Key key;
	// should be bool
	int occupied;

	// default constructor that initializes occupied correctly.
	KMetadata();
};

struct KV {
	Key key;
	Value value;

	// no default constructor to make sure
	// that we get fast construction.
};


// a dummy hash function to test
int terrible_hash_fn(int key);

// function to pick the correct hash bucket from the key.
// returns: n, 0 <= n < NUM_HASH_TABLES
int hash_picker_fn(int key, int salt);



/*
enum OpType{
	OP_TYPE_ILLEGAL = -1,
	OP_TYPE_INSERT  = 0,
	OP_TYPE_DELETE = 1,
	OP_TYPE_SEARCH = 2,
};
*/

typedef uint8_t OpType;

#define OP_TYPE_INSERT 0
#define OP_TYPE_DELETE 1
#define OP_TYPE_SEARCH 2
#define OP_TYPE_ILLEGAL 3

// 5 bytes
struct Request {
	// 1 byte
	OpType tag;
	// 2 bytes
	Key key;

	// 2 bytes
	// if tag == insert, value to be inserted
	Value insert_value;


	// helpers to construct Requests
	static Request mSearch(Key k);
	static Request mkInsert(Key k, Value v);
	static Request mkDelete(Key k);

};

uint64_t request_pack(Request r);
Request request_unpack(uint64_t packed);


// 1 byte + 4 bytes + 2 bits ~ 6 bytes
struct Response {
	// 1 byte
	OpType tag;
	// value that is returned if the request was a searches.
	Value search_value;
	// if the element was not found, then this bit is set.
	bool delete_element_not_found;
	// if the searched element was not found, then this bit is set.
	bool search_element_not_found;
	// if there was an insert collision, then this bit is set.
	bool insert_collided;
	Response();
};

uint64_t response_pack(Response r);
Response response_unpack(uint64_t packed);

Response execute(Request req,
		// stored in BRAM: (k, address in DRAM)
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]);

// generate traffic and execute requests.
// Note that this is _not_ a replacement for the test bench,
// because the test bench checks functional correctness
static const int NUM_TEST_REQUESTS = 1;




struct RequestResponse {
	Request req;
	Response resp;
};
// size of the request/response pair in uint64's
void traffic_generate_and_execute(RequestResponse reqresps[NUM_TEST_REQUESTS],
		// stored in BRAM
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]);


// traffic generate as a parametric function, so we can
// test what the HLS looks like.
void traffic_generate_and_execute_param(
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
 KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]);


// Helper function to generate a random request,
// given some random seed.
Request create_random_request(unsigned int random[3]);

#endif
