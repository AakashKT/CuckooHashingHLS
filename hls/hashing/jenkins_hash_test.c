#include "jenkins_hash.h"

int main()
{
	char key1[] = "AAKASH";
	char key2[] = "TEST_KEY_2";

	uint32_t result1 = jenkins_one_at_a_time(key1, 10);
	uint32_t result2 = jenkins_one_at_a_time(key2, 10);

	printf("Hash for 'AAKASH' : %u\n", result1);
	printf("Hash for 'TEST_KEY_2' : %u\n", result2);

	return 0;
}
