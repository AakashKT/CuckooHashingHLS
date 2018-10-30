#include "execute.h"
#include <assert.h>

Response execute(Request req,
		// stored in BRAM: (k, address in DRAM)
		KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		// stored in DRAM: (key, value)
		KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE]) {
	Response resp;
	resp.tag = OP_TYPE_ILLEGAL;

	int hashes[NUM_HASH_TABLES];

	// value that is used to pick the hash function h_n
	int pick_ix = hash_picker_fn(req.key);

	assert (pick_ix >= 0);
	assert (pick_ix <= NUM_HASH_TABLES - 1);

	/*
	// we can't write nice code like this, because there's
	// no function pointer support :(
	for(int i = 0; i < NHASH; i++) {
		hashes[i] = G_HASH_FUNCTIONS[i](req.key);
	}
	*/

	hashes[0] = terrible_hash_fn(req.key);
	hashes[1] = terrible_hash_fn(req.key);

	// pick the correct hash to now perform the  operation
	const int hash = hashes[pick_ix];

	assert (hash >= 0);
	assert (hash < HASH_TABLE_SIZE);

	switch (req.tag) {
	case OP_TYPE_ILLEGAL:
		assert(0 && "received request with illegal tag");
		break;

	case OP_TYPE_INSERT:

		resp.tag = OP_TYPE_INSERT;
		if (key_to_metadata[pick_ix][hash].occupied == 1) {
			resp.insert_collided = 1;
			break;
		}
		else {
			resp.insert_collided = 0;
		}

		assert (key_to_metadata[pick_ix][hash].occupied == 0);

		// TODO: check for collision
		// DRAM
		key_to_val[pick_ix][hash].key = hash;
		key_to_val[pick_ix][hash].value = req.insert_value;

		// BRAM
		key_to_metadata[pick_ix][hash].key = req.key;
		// I don't understand this two tiered mechanism thing.
		key_to_metadata[pick_ix][hash].occupied = 1;
		break;

	case OP_TYPE_DELETE:
		resp.tag = OP_TYPE_DELETE;

		if (key_to_metadata[pick_ix][hash].occupied == 0) {
			resp.delete_element_not_found = 1;
			break;
		}
		else {
			resp.delete_element_not_found = 0;
		}

		assert (key_to_metadata[pick_ix][hash].occupied == 1);

		// tombstone the data.
		key_to_metadata[pick_ix][hash].occupied = 0;

		break;

	case OP_TYPE_SEARCH:
		if (key_to_metadata[pick_ix][hash].occupied == 0) {
			resp.search_element_not_found = 1;
		}
		else {
			resp.search_element_not_found = 0;
		}
		resp.tag = OP_TYPE_SEARCH;
		resp.search_value = key_to_val[pick_ix][hash].value;
		break;
	}

	return resp;
}
