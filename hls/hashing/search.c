#include "search.h"

VALUE_ADDR search(HASH h, VALUE_ADDR val_addr[100000])
{
#pragma HLS RESOURCE variable=val_addr core=RAM_1P_BRAM

	HASH final_hash = h % 100000;

	return val_addr[final_hash];
}
