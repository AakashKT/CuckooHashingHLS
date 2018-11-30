
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


# Life-saving links for Vivado
- [How to program a Zynq (just C code)](http://blog.dev-flow.com/en/8-first-use-of-the-zynq-7000-processor-system-on-a-zynq/)
- [Setting up drivers for Ubuntu to get USB/JTAG working for Zedboard](http://svenand.blogdrives.com/archive/172.html#.VNTZqmjF-Sp)
- [Detailed tutorial with pictures on connecting to Zedboard](https://www.avnet.com/opasdata/d120001/medias/docus/3/SILICA_Xilinx_Zynq_ZedBoard_Vivado_Workshop_ver1.0.pdf)
- [Correct way to setup drivers for Ubuntu](https://www.xilinx.com/support/answers/66440.html)
- [Exampe of Matmul using HLS](https://www.xilinx.com/support/documentation/application_notes/xapp1170-zynq-hls.pdf)
- [Video clearly explaining how to connect AXI and BRAM](https://www.youtube.com/watch?v=BUVbKonhc2w)

Oh my fucking god, Vivado's own tools don't detect their own serial
ports. Fix this using:

```
sudo minicom -D /dev/ttyACM0 -b 115200 -8 -o
```


# Considerations of different kinds of KV stores

- [Immutable KV store can perform O(1) lookup](https://discodb.readthedocs.io/en/latest/)
- Ordered KV Store (like LevelDB) (not done before)
- [LSM on a GPU](https://arxiv.org/abs/1707.05354)

# Reading
Read about the vivado HLS tutorials on using BRAM/DRAM.


# People to contact to burn the FPGA
- Poornavathi
- Vivek Gupta
