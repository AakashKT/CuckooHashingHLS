# CuckooHashingHLS
HLS implementation of cuckoo hashing. Refer to paper : https://ieeexplore.ieee.org/document/7577355/

# Directory structure
- `src/hls/`  Contains the HLS implementation
- `src/bsv` Contains BSV implementation
- `bench/` Contains benchmarks of other KV-stores

# Source
1. Hash module
2. Search module
3. Execute module
4. Storage module

# Test Bench
1. Traffic generator (?)
2. Traffic checker (?)
3. Controller test bench


# Minutes of meeting

## 31st october
- Finished first cut implementation of insert, search, delete
- Now, burn the thing on an FPGA and test it.
- Make the test bench first `insert` a bunch of keys, then `search`, then `delete`
- Make sure that the test bench is not the bottleneck!


# Considerations of different kinds of KV stores

- [Immutable KV store can perform O(1) lookup](https://discodb.readthedocs.io/en/latest/)
- Ordered KV Store (like LevelDB) (not done before)
- [LSM on a GPU](https://arxiv.org/abs/1707.05354)

# Reading
Read about the vivado HLS tutorials on using BRAM/DRAM.


# People to contact to burn the FPGA
- Poornavathi 
- Vivek Gupta
