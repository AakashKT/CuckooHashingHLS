#include "execute.h"
#include <assert.h>

Response execute(Request req, KDramAddr key_to_addr[HASH_TABLE_SIZE],
		KV key_to_val[HASH_TABLE_SIZE]) {
	Response resp;
	resp.tag = OP_TYPE_ILLEGAL;

	int hashes[NHASH];
	int pick_ix = hash_picker_fn(req.key);

	assert (pick_ix >= 0);
	assert (pick_ix <= NHASH - 1);

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
		if (key_to_addr[hash].occupied == 1) {
			resp.insert_collided = 1;
			break;
		}
		else {
			resp.insert_collided = 0;
		}

		assert (key_to_addr[hash].occupied == 0);

		// TODO: check for collision
		key_to_val[hash].key = hash;
		key_to_val[hash].value = req.insert_value;


		key_to_addr[hash].key = hash;
		// I don't understand this two tiered mechanism thing.
		key_to_addr[hash].addr = (int)((void *)key_to_val + hash);
		key_to_addr[hash].occupied = 1;
		break;

	case OP_TYPE_DELETE:
		resp.tag = OP_TYPE_DELETE;

		if (key_to_addr[hash].occupied == 0) {
			resp.delete_element_not_found = 1;
			break;
		}
		else {
			resp.delete_element_not_found = 0;
		}

		// tombstone the data.
		key_to_addr[hash].occupied = 0;

		break;

	case OP_TYPE_SEARCH:
		if (key_to_addr[hash].occupied == 0) {
			resp.search_element_not_found = 1;
		}
		else {
			resp.search_element_not_found = 0;
		}
		resp.tag = OP_TYPE_SEARCH;
		resp.search_value = key_to_val[hash].value;
		break;
	}

	return resp;
}

/*
VALUE execute(OpType op_type, HASH hash, VALUE_ADDR val_addr,
		KV key_val_dram[NUM_VALUES * 2],
		VALUE_ADDR val_addr_bram[NUM_VALUE_ADDRS])
{
#pragma HLS INTERFACE bram port=val_addr_bram
#pragma HLS INTERFACE ap_memory port=key_val_dram
	if(op_type == OP_TYPE_INSERT)
	{

	}
	else if(op_type == OP_TYPE_DELETE)
	{
		HASH stored_hash = key_val_dram[val_addr];
		VALUE stored_val = key_val_dram[NUM_VALUES + val_addr];

		if(hash == stored_hash) {
			val_addr_bram[hash] = -1;
			key_val_dram[val_addr] = -1;
		}

		return stored_val;

	}
	else
	{
		HASH stored_hash = key_val_dram[val_addr];
		VALUE stored_val = key_val_dram[NUM_VALUES + val_addr];

		if(hash == stored_hash)
			return stored_val;
		else
			return -1;
	}

	return -1;
}
*/
