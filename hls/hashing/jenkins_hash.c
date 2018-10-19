#include "jenkins_hash.h"

VALUE jenkins_one_at_a_time(int length, KEY key[1000])
{
	int i = 0;
	uint32_t hash = 0;

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
