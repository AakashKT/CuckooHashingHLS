#include "jenkins_hash.h"
#include "execute.h"
#include <assert.h>
#include <map>
#include <utility>
#include <string>
#include <sstream>
#include <stdlib.h>
#include <iostream>
#include <vector>
using namespace std;


std::string optype_to_string(OpType ty) {
	switch (ty) {
	case OP_TYPE_ILLEGAL:
		return "illegal";
	case OP_TYPE_INSERT:
		return "insert";
	case OP_TYPE_DELETE:
		return "delete";
	case OP_TYPE_SEARCH:
		return "search";
	}

	assert(false && "unreachable");
	return "unreachable";

}

std::string request_to_string(Request r) {
	std::stringstream ss;

	ss << "tag := " << optype_to_string(r.tag);
	ss << "| key := " << r.key;

	if (r.tag == OP_TYPE_INSERT) {
		ss << "| insert_value := " << r.insert_value;
	}

	return ss.str();
}

std::string response_to_string(Response r) {
	std::stringstream ss;

	ss << "tag := " << optype_to_string(r.tag) << "| ";
	switch (r.tag) {
	case OP_TYPE_INSERT:
		if (r.insert_collided) {
			ss << "INSERT collided. ";
		}
		break;
	case OP_TYPE_DELETE:
		if (r.delete_element_not_found) {
			ss << "DELETE not found.";
		}
		break;
	case OP_TYPE_SEARCH:
		if (r.search_element_not_found) {
			ss << "SEARCH not found.";
		}
		else {
			ss << "SEARCH value := " << r.search_value;
		}
		break;

	case OP_TYPE_ILLEGAL:
		break;
	}
	return ss.str();
}

// This is useless, I can't just run the same
// request on an std::map hoping to get the same value.
// Rather, I should *simulate* the request only if the
// request works properly.
//
//
// Note that this will always allow inserts to succeed,
// while in reality, inserts can collide!
// So, we should only insert into this if the inserts
// don't collide.
Response simulate_request(Request req, std::map<Key, Value> &testmap) {
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
			return res;
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
std::pair<bool, std::string> response_equal(std::string name1, Response r1,
		std::string name2, Response r2) {
	std::stringstream ss;

	if (r1.tag != r2.tag) {
		ss << name1 << " tag: " << r1.tag << " | " << name2 << " tag: " << r2.tag;
		return std::make_pair(false, ss.str());
	}

	switch (r1.tag) {
	case OP_TYPE_INSERT:
		if (r1.insert_collided != r2.insert_collided) {
			ss << name1 << " insert collided: " << r1.insert_collided << "\n";
			ss << name2 << " insert collided:  " << r2.insert_collided;
			return std::make_pair(false, ss.str());
		}
		break;
	case OP_TYPE_SEARCH:
		if (r1.search_element_not_found != r2.search_element_not_found) {
			ss << name1 << " search state: " << r1.search_element_not_found << "\n";
			ss << name2 << " R2 search state: " << r2.search_element_not_found;
			return std::make_pair(false, ss.str());
		}
		if (r1.search_value != r2.search_value) {
			ss << name1 << " value: " << r1.search_value << "\n";
			ss << name2 << " value: " << r2.search_value;

			return std::make_pair(false, ss.str());
		}

		break;
	case OP_TYPE_DELETE:
		if (r1.delete_element_not_found != r2.delete_element_not_found) {
			ss << "Delete element not found: ";
			ss << name1  << " delete elem not found: "<< r1.delete_element_not_found << "\n";
			ss << name2 <<" delete elem not found: " << r2.delete_element_not_found;

			return std::make_pair(false, ss.str());
		}
		break;

	default:
		assert(false && "unknown tag type");
	}

	return std::make_pair(true, "");
}


// Collect statistics about the run
struct Statistics {
	// number of searches that returned a Value
	int num_useful_searches;
	// number of searches that did not hit a Key
	int num_non_useful_searches;
	// number of inserts that collided
	int num_colliding_inserts;
	// number of inserts that successfully inserted
	int num_successful_inserts;
	// number of deletes that deleted a Value
	int num_useful_deletes;
	// number of deletes that did not hit a Key
	int num_non_useful_deletes;
	// total number of requests
	int total;


	Statistics() :
	num_useful_searches(0),
	num_non_useful_searches(0),
	num_colliding_inserts(0),
	num_successful_inserts(0),
	num_useful_deletes(0),
	num_non_useful_deletes (0),
	total(0){}
};

// Update the hit statistics of our KV store
// based on the response success
void update_statistics(Response r, Statistics *s) {
	assert (s != NULL);
	s->total++;

	switch (r.tag) {
	case OP_TYPE_INSERT:
		if (r.insert_collided) {
			s->num_colliding_inserts++;
		} else {
			s->num_successful_inserts++;
		}
		return;
	case OP_TYPE_SEARCH:
		if (r.search_element_not_found) {
			s->num_non_useful_searches++;
		} else {
			s->num_useful_searches++;
		}
		return;

	case OP_TYPE_DELETE:
		if (r.delete_element_not_found) {
			s->num_non_useful_deletes++;
		} else {
			s->num_useful_deletes++;
		}
		return;

	case OP_TYPE_ILLEGAL:
		assert(false && "illegal tag");
	}
}

void print_statistics(const Statistics s) {
	std::cout <<"Inserts:";
	std::cout << "\n\tsuccessful: " << s.num_successful_inserts;
	std::cout<<"\n\tcollisions: " << s.num_colliding_inserts;

	std::cout<<"\n\n";

	std::cout<<"Deletes:";
	std::cout<<"\n\tuseful: " << s.num_useful_deletes;
	std::cout<<"\n\tnon useful: " << s.num_non_useful_deletes;

	std::cout << "\n\n";

	std::cout<<"Searches:";
	std::cout<<"\n\tuseful: " << s.num_useful_searches;
	std::cout<<"\n\tnon useful: " << s.num_non_useful_searches;

	std::cout << "\n";
	std::cout<<"TOTAL: " << s.total;

	std::cout<<"\n";
}


// run the initialization request
void initialize(KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE],
		KV kv[NUM_HASH_TABLES][HASH_TABLE_SIZE]) {
	// initialize.
	// For whatever reason, the RTL is fucked.
	for(int i = 0; i < NUM_HASH_TABLES; i++) {
		for(int j = 0 ; j < HASH_TABLE_SIZE; j++) {
			key_to_metadata[i][j].occupied = false;
		}
	}
}


// wow, I feel so ugly, why can't we just have lambdas.
void push_rand_requests(std::vector<Request> &rs) {
	static const int NUM_TESTS = 1000;

	for(int i = 0; i < NUM_TESTS; ++i) {
		unsigned int random[3] = {
				static_cast<unsigned int>(rand()),
				static_cast<unsigned int>(rand()),
				static_cast<unsigned int>(rand())
		};
		rs.push_back(create_random_request(random));
	}
}

void push_deterministic_requests(std::vector<Request> &rs) {
	assert(rs.size() == 0 && "deterministic requests should be before random requests");
	// insert hit
	rs.push_back(Request::mkInsert(10, 42));

	// insert: collide
	rs.push_back(Request::mkInsert(10, 42));


	//search: hit
	rs.push_back(Request::mSearch(10));

	//search: miss
	rs.push_back(Request::mSearch(20));

	// delete:hit
	rs.push_back(Request::mkDelete(10));
	// delete:miss
	rs.push_back(Request::mkDelete(10));

}

int main()
{
	// srand(time(NULL));


	// stored in BRAM
	KMetadata key_to_metadata[NUM_HASH_TABLES][HASH_TABLE_SIZE];
	// stored in DRAM: (key, value)
	KV key_to_val[NUM_HASH_TABLES][HASH_TABLE_SIZE];

	std::map<Key, Value> testmap;
	Statistics stats;

	initialize(key_to_metadata, key_to_val);

	// populate tests
	std::vector<Request> reqs;
	push_deterministic_requests(reqs);
	push_rand_requests(reqs);


	// run tests
	int count = 0;
	for(std::vector<Request>::iterator it = reqs.begin();
			it != reqs.end(); ++it, ++count) {
		const Request req = *it;
		std::cout << "(" << count << ")===\n";

		std::cout << "request: ";
		std::cout << request_to_string(req);
		std::cout<<"--\n";


		std::cout << "calling execute() on FPGA...\n";
		Response fpga = execute(req, key_to_metadata, key_to_val);

		std::cout << "FPGA response: ";
		std::cout << response_to_string(fpga);
		std::cout << "--\n";

		// NOTE: this actually gives us another way to
		// compare responses.
		// If the stats are not equal for
		// two Responses, then we know that they are not equal!
		update_statistics(fpga, &stats);


		// If we tried to insert and failed, we can't
		// simulate it, since it's just a hash collision.
		// So, we skip this iteration.
		// Otherwise, we continue.
		if ((fpga.tag == OP_TYPE_INSERT &&
						fpga.insert_collided)) {
			continue;
		}

		// Simulate the request and check that the simulation
		// has the same value as that of the hash table.
		Response reference = simulate_request(req, testmap);
		std::cout << "Reference response: ";
		std::cout << response_to_string(reference);
		std::cout << "--\n";

		std::pair<bool, std::string> check =
				response_equal("reference", reference, "FPGA", fpga);

		if (!check.first) {
			std::cout << "\n****\n";
			std::cout << "Reference data does not match test data";

			std::cout << "REFERENCE: " << response_to_string(reference);
			std::cout << "\n";
			std::cout << "TEST: " << response_to_string(fpga);
			std::cout << "\n\n" << check.second;
			std::cout << "\n****\n";
			return 1;
		}

	}

	print_statistics(stats);


	// really nothing to do here, there's no output I can see,
	// but I call it anyway?...
	traffic_generate_and_execute();

	return 0;
}
