#include "search.h"

VALUE_ADDR search(HASH h, VALUE_ADDR val_addr_bram[NUM_VALUE_ADDRS])
{

#pragma HLS RESOURCE variable=val_addr_bram core=RAM_1P_BRAM

	HASH final_hash = h % NUM_VALUE_ADDRS;
	return val_addr_bram[final_hash];
}
