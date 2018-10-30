#ifndef EXECUTE_
#define EXECUTE_

// number of hash tables;
static const int NHASH = 2;
// size of each hash table
static const int HASH_TABLE_SIZE = 100;

typedef int Key;
// an address in DRAM;
typedef int DRAMAddr;
typedef int Value;

typedef struct {
	Key key;
	DRAMAddr addr;
	// should be bool
	int occupied;
} KDramAddr;

typedef struct {
	Key key;
	Value value;
} KV;


/* type of hash function */
typedef int (*HashFn)(int);

/* a dummy hash function to test */
int  terrible_hash_fn(int key) {
	return key;
}

int hash_picker_fn(int key) {
	return key % NHASH;
}

static const HashFn G_HASH_FUNCTIONS[NHASH] = {
	terrible_hash_fn, terrible_hash_fn
};


typedef enum {
	OP_TYPE_ILLEGAL = -1,
	OP_TYPE_INSERT,
	OP_TYPE_DELETE,
	OP_TYPE_SEARCH
} OpType;

typedef struct {
	int value;
} InsertReqData;


typedef struct {
	OpType tag;
	Key key;

	// if tag == insert, value to be inserted
	Value insert_value;
} Request;


typedef struct {
	OpType tag;
	Value search_value;
	// TODO: use bool!
	// TODO: merge {delte, search} element not found bits.
	int delete_element_not_found;
	int search_element_not_found;
	int insert_collided;
} Response;

Response execute(Request r, KDramAddr key_to_addr[HASH_TABLE_SIZE],
		KV key_to_val[HASH_TABLE_SIZE]);

/*
VALUE execute(OpType op_type, HASH hash, VALUE_ADDR val_addr,
		KV key_val_dram[NUM_VALUES * 2],
		VALUE_ADDR val_addr_bram[NUM_VALUE_ADDRS]);

*/
#endif
