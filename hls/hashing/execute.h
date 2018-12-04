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

struct Request {
	OpType tag;
	Key key;

	// if tag == insert, value to be inserted
	Value insert_value;


	// helpers to construct Requests
	static Request mSearch(Key k);
	static Request mkInsert(Key k, Value v);
	static Request mkDelete(Key k);

};

// number of uint32_t's needed to hold a Request
static const int REQUEST_PACK_STRIDE = 3;
void request_pack(Request r, uint32_t *base);
Request request_unpack(const uint32_t *base);


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

// number of uint32_t's needed to hold a Request
static const int RESPONSE_PACK_STRIDE = 3;
void response_pack(Response r, uint32_t *base);
Response response_unpack(const uint32_t *base);

Response execute(Request req,
		// stored in BRAM: (k, address in DRAM)
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]);

// generate traffic and execute requests.
// Note that this is _not_ a replacement for the test bench,
// because the test bench checks functional correctness
static const int NUM_TEST_REQUESTS = 10;





// size of the request/response pair in uint64's
void traffic_generate_and_execute(
		uint32_t test_zynq_access[NUM_TEST_REQUESTS],
		uint32_t reqresps[(REQUEST_PACK_STRIDE + RESPONSE_PACK_STRIDE) * NUM_TEST_REQUESTS],
		// stored in BRAM
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]);



// Helper function to generate a random request,
// given some random seed.
Request create_random_request(unsigned int random[3]);

#endif
