#include<stdbool.h>
typedef uint8_t OpType;

#define OP_TYPE_INSERT 0
#define OP_TYPE_DELETE 1
#define OP_TYPE_SEARCH 2
#define OP_TYPE_ILLEGAL 3

typedef uint32_t Key;
// an address in DRAM;
typedef int DRAMAddr;
typedef uint32_t Value;


// 5 bytes
struct Request {
	// 1 byte
	OpType tag;
	// 2 bytes
	Key key;

	// 2 bytes
	// if tag == insert, value to be inserted
	Value insert_value;



};
// 1 byte + 4 bytes + 2 bits ~ 6 bytes
struct Response {
	// 1 byte
	OpType tag;
	// value that is returned if the request was a searches.
	Value search_value;
	// if the element was not found, then this bit is set.
	bool delete_element_not_found;
	// if the searched element was not found, then this bit is set.
	bool search_element_not_found;
	// if there was an insert collision, then this bit is set.
	bool insert_collided;
};
struct RequestResponse {
	struct Request req;
	struct Response resp;
};

