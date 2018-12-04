#pragma once
#include<stdbool.h>
#include <assert.h>
typedef uint8_t OpType;

#define OP_TYPE_INSERT 0
#define OP_TYPE_DELETE 1
#define OP_TYPE_SEARCH 2
#define OP_TYPE_ILLEGAL 3

typedef uint32_t Key;
// an address in DRAM;
typedef int DRAMAddr;
typedef uint32_t Value;


static const int RESPONSE_PACK_STRIDE = 3;
static const int REQUEST_PACK_STRIDE = 3;

// 5 bytes
typedef struct Request {
	// 1 byte
	OpType tag;
	// 2 bytes
	Key key;

	// 2 bytes
	// if tag == insert, value to be inserted
	Value insert_value;



} Request;

// 1 byte + 4 bytes + 2 bits ~ 6 bytes
typedef struct Response {
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
} Response;



void request_pack(Request r, volatile uint32_t *base) {
	volatile uint32_t *packed = base;
	*packed = r.insert_value;
	packed++;

	*packed = r.key;
	packed++;

	*packed = r.tag;
	packed++;
	assert(packed - base == REQUEST_PACK_STRIDE);
}

Request request_unpack(const volatile uint32_t *base) {
	Request r;
	const volatile uint32_t *packed = base;
	r.insert_value = *packed;
	packed++;

	r.key  = *packed;
	packed++;

	r.tag = *packed;
	packed++;
	assert(packed - base == REQUEST_PACK_STRIDE);

	return r;

}


void response_pack(Response r, volatile uint32_t *base) {
	volatile uint32_t *packed = base;

	*packed = r.search_value;
	packed++;

	*packed = r.tag;
	packed++;

	*packed = (r.delete_element_not_found << 2) |
			(r.insert_collided << 1) |
			(r.search_element_not_found);

	packed++;

	assert(packed - base == RESPONSE_PACK_STRIDE);
}
Response response_unpack(const volatile uint32_t *base) {
	const volatile uint32_t *packed = base;
	Response r;


	r.search_value = *packed;
	packed++;

	r.tag = *packed;
	packed++;

	r.search_element_not_found = *packed & 0x1;
	r.insert_collided = *packed & (1 << 1);
	r.delete_element_not_found = *packed & (1 << 2);
	packed++;

	assert(packed - base == RESPONSE_PACK_STRIDE);

	return r;
}


