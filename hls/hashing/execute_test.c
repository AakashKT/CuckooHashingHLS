#include "jenkins_hash.h"
#include "search.h"
#include "execute.h"
#include <assert.h>
int main()
{

	VALUE_ADDR val_addr[NUM_VALUE_ADDRS];
#pragma HLS INTERFACE bram port=val_addr

	KV key_val_dram[NUM_VALUES * 2];

	for(int i=0;i< NUM_VALUE_ADDRS;i++)
		val_addr[i] = -1;

	HASH h1 = jenkins_one_at_a_time(6, "AAKASH") % NUM_VALUE_ADDRS;
	HASH h2 = jenkins_one_at_a_time(9, "SIDDHARTH")% NUM_VALUE_ADDRS;
	HASH h3 = jenkins_one_at_a_time(6, "RANDOM") % NUM_VALUE_ADDRS;

	/*-------- Jugaad Insertion -------------------------*/

	val_addr[h1] = 0;
	key_val_dram[0] = h1;
	key_val_dram[NUM_VALUES + 0] = 42;


	val_addr[h2] = 1;
	key_val_dram[1] = h2;
	key_val_dram[NUM_VALUES + 1] = 43;

	/* ------------------------------------------------- */


	VALUE_ADDR v1 = search(h1, val_addr);
	VALUE_ADDR v2 = search(h2, val_addr);
	VALUE_ADDR v3 = search(h3, val_addr);

	printf("ADDR OF AAKASH : %u\n", v1);
	printf("ADDR OF SIDDHARTH : %u\n", v2);
	printf("ADDR OF RANDOM : %d\n", v3);
	assert(v1 == 0);
	assert(v2 == 1);
	assert(v3 == -1);

	VALUE f1;
	VALUE f2;
	VALUE f3;

	if(v1 != -1)
		f1 = execute(OP_TYPE_DELETE, h1, v1, key_val_dram, val_addr);
	if(v2 != -1)
		f2 = execute(OP_TYPE_SEARCH, h2, v2, key_val_dram, val_addr);

	printf("VALUE DELETED : %u\n", f1);
	assert(f1 == 42);
	printf("VALUE SEARCHED : %u\n", f2);
	assert(f2 == 43);

	f1 = execute(OP_TYPE_SEARCH, h1, v1, key_val_dram, val_addr);
	printf("SEARCH RESULT OF DELETED VALUE : %d\n", f1);
	assert (f1 == -1);
	return 0;
}
