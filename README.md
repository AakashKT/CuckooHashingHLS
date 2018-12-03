
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

# SDAccel craziness
**[link to tutorial we were following](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1028-sdsoc-intro-tutorial.pdf)**
- The executable is named `.exe` while it's actually an ELF executable (The SDAccel tutorials say it is called as `.elf`)
- the board is supposed to automatically boot into linux, which it does not. One is expected to call `bootd` manually (for "boot default") so it boots ito linux. (The SDAccel tutorials say it automatically boots into it)
- At this point, the SD card is unreadable. It took a bunch of time to figure out that the SD card needs to be mounted by us, and has the mount name `/dev/mmcblk0p1`. (The SDAccel tutorials say that it should be automatically mounted)
- At this point, we are unable to run `hashing.elf`. It dies with a truly bizarre error: `hashing.elf: command not found`. This is almost un-googleable, due to the fact that the same problem occurs when people don't have the correct file name. Eventually, realising that the linux distro uses busybox led me to google "busybox unable to execute executable", which led me to this [StackOverflow link](https://stackoverflow.com/questions/1562071/how-can-i-find-which-elf-dependency-is-not-fulfilled) that clued me into the fact that the ELF interpreter is missing.
- When I discovered this, I wound up trying to understand how to get the right ELF interpreter. `readelf -l <exe name>` dumps out `[Requesting program interpreter: /lib/ld-linux-armhf.so.3]`. So, I bravely copied: `cp /lib/ld-linux.so.3 /lib/ld-linux-armhf.so.3`.
- Stuff is *still* broken, but I now get *useful* error messages:
```
zynq> /hashing.elf 
/hashing.elf: error while loading shared libraries: libxilinxopencl.so: cannot open shared object file: No such file or directory
```

At this point, clearly we have some linker issues (why does `xocc` not correctly statically link? What's up with it? Why does it expect it to be able to load a shared library? **WTF is happening**). do note that this is _not_ the way the process
is supposed to go according to the tutorial!  
- Of course, there's no static library version of `libxilinxopencl.so`, so that's a dead end. I'm completely unsure if the tutorial even makes sense. 

# Considerations of different kinds of KV stores

- [Immutable KV store can perform O(1) lookup](https://discodb.readthedocs.io/en/latest/)
- Ordered KV Store (like LevelDB) (not done before)
- [LSM on a GPU](https://arxiv.org/abs/1707.05354)

# Reading
Read about the vivado HLS tutorials on using BRAM/DRAM.


# People to contact to burn the FPGA
- Poornavathi
- Vivek Gupta
