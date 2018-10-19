#include "jenkins_hash.h"
#include "search.h"
#include "execute.h"

int main()
{
	printf("YO\n");

	VALUE_ADDR val_addr[NUM_VALUE_ADDRS * 2];
	KV key_val[VALUE_MEM_SIZE];

	for(int i=0;i<NUM_VALUE_ADDRS * 2;i++)
		val_addr[i] = -1;

	HASH h1 = jenkins_one_at_a_time(6, "AAKASH");
	HASH h2 = jenkins_one_at_a_time(9, "SIDDHARTH");
	HASH h3 = jenkins_one_at_a_time(6, "RANDOM");

	/*-------- Jugaad Insertion -------------------------*/

	key_val[1] = h1;
	key_val[NUM_VALUE_ADDRS + 1] = 190;
	// val_addr[h1] = 245;

	key_val[2] = h2;
	key_val[2 + NUM_VALUE_ADDRS] = 150;
	// val_addr[h2] = 270;

	/* ------------------------------------------------- */

	VALUE_ADDR v1 = search(h1, val_addr);
	VALUE_ADDR v2 = search(h2, val_addr);
	VALUE_ADDR v3 = search(h3, val_addr);

	printf("ADDR OF AAKASH : %u\n", v1);
	printf("ADDR OF SIDDHARTH : %u\n", v2);
	printf("ADDR OF RANDOM : %u\n", v3);

	VALUE f1;
	VALUE f2;
	VALUE f3;

	if(v1 != -1)
		f1 = execute(OP_TYPE_DELETE, h1, v1, key_val, val_addr);
	if(v2 != -1)
		f2 = execute(OP_TYPE_SEARCH, h2, v2, key_val, val_addr);

	printf("VALUE DELETED : %u\n", f1);
	printf("VALUE SEARCHED : %u\n", f2);

	f1 = execute(OP_TYPE_SEARCH, h1, v1, key_val, val_addr);

	printf("SEARCH RESULT OF DELETED VALUE : %u\n", f1);

	return 0;
}
