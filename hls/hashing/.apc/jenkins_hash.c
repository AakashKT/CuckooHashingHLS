#include "jenkins_hash.h"

#include<stdio.h>
#include<math.h>

int jenkins_one_at_a_time(const char* key, int length)
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
