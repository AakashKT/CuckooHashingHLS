#include "search.h"
#include "jenkins_hash.h"

int main()
{
	VALUE_ADDR val_addr[100000];
	for(int i=0;i<100000;i++)
		val_addr[i] = rand() % 1000;
	
	HASH h1 = jenkins_one_at_a_time(6, "AAKASH");
	HASH h2 = jenkins_one_at_a_time(9, "SIDDHARTH");
	
	VALUE_ADDR v1 = search(h1, val_addr);
	VALUE_ADDR v2 = search(h2, val_addr);
	printf("------\n");
	printf("ADDRESS FOR AAKASH : %u", v1);
	printf("ADDRESS FOR SIDDHARTH : %u", v2);
	
	return 0;
}
