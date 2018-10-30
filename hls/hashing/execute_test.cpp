#include "jenkins_hash.h"
#include "execute.h"
#include <assert.h>
#include <map>

int main()
{
	// stored in BRAM
	KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE];
	// stored in DRAM: (key, value)
	KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE];

	std::map<Key, Value> testmap;

	return 0;
}
