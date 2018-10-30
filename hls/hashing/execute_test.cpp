#include "jenkins_hash.h"
#include "execute.h"
#include <assert.h>
#include <map>
#include <utility>
#include <string>
#include <sstream>

using namespace std;

Response test_request(Request req, std::map<Key, Value> &testmap) {
	Response res;
	std::map<Key, Value>::iterator it = testmap.find(req.key);

	switch (req.tag) {
	case OP_TYPE_INSERT:
		res.tag = OP_TYPE_INSERT;
		if (it != testmap.end()) {
			res.insert_collided = true;
			return res;
		}

		testmap[req.key] = req.insert_value;
		break;
	case OP_TYPE_DELETE:
		res.tag = OP_TYPE_DELETE;

		if (it == testmap.end()) {
			res.delete_element_not_found = true;
		}

		testmap.erase(it);
		break;
	case OP_TYPE_SEARCH:
		res.tag = OP_TYPE_SEARCH;

		if (it == testmap.end()) {
			res.search_element_not_found = true;
			return res;
		}

		res.search_value = it->second;
		break;
	}

	return res;

}

// Checks if two responses are semantically equal
// If returns false, then the std::string contains the
// error details
std::pair<bool, std::string> response_equal(Response r1, Response r2) {
	std::stringstream ss;

	if (r1.tag != r2.tag) {
		ss << "R1 tag: " << r1.tag << " | R2 tag: " << r2.tag;
		return std::make_pair(false, ss.str());
	}

	switch (r1.tag) {
	case OP_TYPE_INSERT:
		if (r1.insert_collided != r2.insert_collided) {
			ss << "R1 insert collided: " << r1.insert_collided;
			ss << "| R2 insert collided:  " << r2.insert_collided;
			return std::make_pair(false, ss.str());
		}
		break;
	case OP_TYPE_SEARCH:
		if (r1.search_element_not_found != r2.search_element_not_found) {
			ss << "R1 search state: " << r1.search_element_not_found;
			ss << "|R2 search state: " << r2.search_element_not_found;
			return std::make_pair(false, ss.str());
		}
		if (r1.search_value != r2.search_value) {
			ss << "R1 value: " << r1.search_value;
			ss << "|R2 value: " << r2.search_value;

			return std::make_pair(false, ss.str());
		}

		break;
	case OP_TYPE_DELETE:
		if (r1.delete_element_not_found != r2.delete_element_not_found) {
			ss << "Delete element not found: ";
			ss << "R1: " << r1.delete_element_not_found;
			ss << "|R2: " << r2.delete_element_not_found;

			return std::make_pair(false, ss.str());
		}
		break;
	}

	return std::make_pair(true, "");
}

int main()
{
	// stored in BRAM
	KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE];
	// stored in DRAM: (key, value)
	KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE];

	std::map<Key, Value> testmap;

	return 0;
}
