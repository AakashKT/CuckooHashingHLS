#include "jenkins_hash.h"

int jenkins_one_at_a_time(int length, char key[1000])
{
	int i = 0;
	int hash = 0;

	while(i != length)
	{
		hash += key[i++];
		hash += hash << 10;
		hash ^= hash >> 6;
	}

	hash += hash << 3;
	hash ^= hash >> 11;
	hash += hash << 15;

	return hash;
}
