#include "execute.h"

VALUE execute(int op_type, HASH hash, VALUE_ADDR val_addr, KV key_val_dram[NUM_VALUE_ADDRS * 2], VALUE_ADDR val_addr_bram[VALUE_MEM_SIZE])
{
#pragma HLS INTERFACE ap_memory port=key_val_dram
	if(op_type == OP_TYPE_INSERT)
	{

	}
	else if(op_type == OP_TYPE_DELETE)
	{
		HASH stored_hash = key_val_dram[val_addr];
		VALUE stored_val = key_val_dram[NUM_VALUE_ADDRS + val_addr];

		if(hash == stored_hash)
			val_addr_bram[hash] = -1;

		return stored_val;

	}
	else
	{
		HASH stored_hash = key_val_dram[val_addr];
		VALUE stored_val = key_val_dram[NUM_VALUE_ADDRS + val_addr];

		if(hash == stored_hash)
			return stored_val;
		else
			return -1;
	}

	return -1;
}
