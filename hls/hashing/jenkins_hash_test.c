#include "jenkins_hash.h"

int main()
{
	char key1[] = "AAKASH";
	char key2[] = "TEST_KEY_2";

	uint32_t result1 = jenkins_one_at_a_time(10, key1);
	uint32_t result2 = jenkins_one_at_a_time(10, key2);

	printf("Hash for 'AAKASH' : %u\n", result1);
	printf("Hash for 'TEST_KEY_2' : %u\n", result2);

	return 0;
}
