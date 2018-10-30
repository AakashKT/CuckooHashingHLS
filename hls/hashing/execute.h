#pragma once
#ifndef EXECUTE
#define EXECUTE_

// number of hash tables;
static const int NUM_HASH_TABLES = 2;
// size of each hash table
static const int HASH_TABLE_SIZE = 100;

typedef int Key;
// an address in DRAM;
typedef int DRAMAddr;
typedef int Value;

struct KMetadata {
	Key key;
	// should be bool
	bool occupied;
};

struct KV {
	Key key;
	Value value;
};

/* type of hash function */
typedef int (*HashFn)(int);

/* a dummy hash function to test */
int terrible_hash_fn(int key);

int hash_picker_fn(int key) {
	return key % NUM_HASH_TABLES;
}

static const HashFn G_HASH_FUNCTIONS[NUM_HASH_TABLES] = {
	terrible_hash_fn, terrible_hash_fn
};


enum OpType{
	OP_TYPE_ILLEGAL = -1,
	OP_TYPE_INSERT,
	OP_TYPE_DELETE,
	OP_TYPE_SEARCH
};


struct Request {
	OpType tag;
	Key key;

	// if tag == insert, value to be inserted
	Value insert_value;
};


struct Response {
	OpType tag;
	Value search_value;
	// TODO: use bool!
	// TODO: merge {delte, search} element not found bits.
	bool delete_element_not_found;
	bool search_element_not_found;
	bool insert_collided;
};

Response execute(Request req,
		// stored in BRAM: (k, address in DRAM)
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]);

#endif
