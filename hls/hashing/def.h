#ifndef DEFINITIONS_
#define DEFINITIONS_

#define OP_TYPE_INSERT 1
#define OP_TYPE_DELETE 2
#define OP_TYPE_SEARCH 3

#include<stdio.h>
#include<math.h>
#include<stdint.h>

typedef char KEY;
typedef uint32_t HASH;
typedef uint32_t VALUE;
typedef uint32_t VALUE_ADDR;
typedef uint32_t KV;



//number of memory slots we possess, to store values.
// This is stored in DRAM
static const int NUM_VALUES = 40;

// number of key-value pairs we can store.
// This is stored in BRAM.
static const int NUM_VALUE_ADDRS= 10;

#endif
