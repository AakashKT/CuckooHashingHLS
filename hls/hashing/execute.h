#ifndef EXECUTE_
#define EXECUTE_

#include "def.h"


VALUE execute(int op_type, HASH hash, VALUE_ADDR val_addr,
		KV key_val_dram[NUM_VALUES * 2],
		VALUE_ADDR val_addr_bram[NUM_VALUE_ADDRS]);

#endif
