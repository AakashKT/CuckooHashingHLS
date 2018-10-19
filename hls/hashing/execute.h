#ifndef EXECUTE_
#define EXECUTE_

#include "def.h"

static const int NUM_VALUE_ADDRS = 40;
static const int VALUE_MEM_SIZE = 10;

VALUE execute(int op_type, HASH hash, VALUE_ADDR val_addr,
		KV key_val_dram[NUM_VALUE_ADDRS * 2],
		VALUE_ADDR val_addr_bram[VALUE_MEM_SIZE]);

#endif
