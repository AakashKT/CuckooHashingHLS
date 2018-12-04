
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
- [Negative slack for ZedBoard is **okay**, I freaked out about this](https://forums.xilinx.com/t5/Design-Entry/2017-2-PSU-1-critical-warning-with-basic-Zynq-design-on-DDR/td-p/789339)
- [How to `mmap` BRAM](https://forums.xilinx.com/t5/AXI-Infrastructure/Accessing-BRAM-through-PS-and-PL/td-p/894449)
Oh my fucking god, Vivado's own tools don't detect their own serial
ports. Fix this using:

```
sudo minicom -D /dev/ttyACM0 -b 115200 -8 -o
```

# HLS bugs / nits / nice to have features that dont exist
- Unable to create BRAM for fields such as `bool`, `int16`. The data buses
will be `8/16` bits long, with error:

```
[BD 41-241] Message from IP propagation TCL of /blk_mem_gen_7: set_property
error: Validation failed for parameter 'Write Width A(Write_Width_A)' for BD
Cell 'blk_mem_gen_7'. Value '8' is out of the range (32,1024) Customization
errors found on 'blk_mem_gen_7'. Restoring to previous valid configuration.
```

- I had an array of structs:

```cpp
struct S {
    bool b;
    int16 x;
    int16 y;
}
```

This gets generated as 3 ports for memory, of widths `1`, `16`, `16`. Ideally,
I wanted *one* port, of width `16+16+1=33`, for each struct value.
However, what was generated were three ports of widths `1`, `16`, and `16`
which I cannot connect to BRAM.

- **`data_pack` allows us to create one port of width `16+16+1=33`**

- Shared function names allocated on BRAM causes errors in synthesis:
```cpp
struct Foo {...};
void f (Foo conflict) {
    #pragma HLS interface bram port=conflict
}

void g (Foo conflict) {
    #pragma HLS interface bram port=conflict
}
```


- Enums causes compile failure in RTL generation  (commit `3c0d619039cff7a7abb61268e6c8bc6d250d8730`)
- `ap_int` causes compile failurre in RTL generation (commit `3c0d619039cff7a7abb61268e6c8bc6d250d8730`)
- `x % m` where `m != 2^k` is very expensive -- there must be faster encodings of modulus?
- How to share code between HLS and vivado SDK? I often wanted to share constant values between
  my HLS code and my Zynq code.
- Can't understand why array of structs that were packed does not get deserialized correctly. I had to manually
    pack a struct into a `uint32`. For whatever reason, having a `#pragma pack` did something to the representation of the struct
    as far as I can tell, and I couldn't treat the memory as just a raw `struct *` on the other side:

```cpp
// HLS side
struct Vec2  { int x; int y};
void f(Vec2 points[NUM_POINTS]) {
	#pragma HLS DATA_PACK variable=points
    #pragma HLS INTERFACE bram port=points

    points[0] = {2, 3};
}

// Host side
Vec2 *points = (Vec2 *)(0xPOINTER_LOCATION_FROM_VIVADO);

int main() {
    // points[0] will *not* be {2, 3}!
}
```

- If I change my IP, there is no way to preserve the current connections in the
  GUI why just updating the "changed connections". I'm forced to remove the IP
  and add it again (no, the Refresh IP button does not work).


# SDAccel craziness
**[link to tutorial we were following](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2017_1/ug1028-sdsoc-intro-tutorial.pdf)**
- The executable is named `.exe` while it's actually an ELF executable (The SDAccel tutorials say it is called as `.elf`)
- the board is supposed to automatically boot into linux, which it does not. One is expected to call `bootd` manually (for "boot default") so it boots ito linux. (The SDAccel tutorials say it automatically boots into it)
- At this point, the SD card is unreadable. It took a bunch of time to figure out that the SD card needs to be mounted by us, and has the mount name `/dev/mmcblk0p1`. (The SDAccel tutorials say that it should be automatically mounted)
- At this point, we are unable to run `hashing.elf`. It dies with a truly bizarre error: `hashing.elf: command not found`. This is almost un-googleable, due to the fact that the same problem occurs when people don't have the correct file name.
- I rewrote `ls` with `hashing.elf` to see what would happen, because I conjectured that the shell was able to run `coreutils`. 
- This dies with a different error `ls: core not found`. I'd luckily seen this during my android days, and knew this was from busybox.
- This led me to google "busybox unable to execute executable", which led me to this [StackOverflow link](https://stackoverflow.com/questions/1562071/how-can-i-find-which-elf-dependency-is-not-fulfilled) that clued me into the fact that the ELF interpreter is missing.
- When I discovered this, I wound up trying to understand how to get the right ELF interpreter. `readelf -l <exe name>` dumps out `[Requesting program interpreter: /lib/ld-linux-armhf.so.3]`. So, I bravely copied: `cp /lib/ld-linux.so.3 /lib/ld-linux-armhf.so.3`.
- Stuff is *still* broken, but I now get *useful* error messages:
```
zynq> /hashing.elf 
/hashing.elf: error while loading shared libraries: libxilinxopencl.so: cannot open shared object file: No such file or directory
```
At this point, clearly we have some linker issues (why does `xocc` not correctly statically link? What's up with it? Why does it expect it to be able to load a shared library? **WTF is happening**). do note that this is _not_ the way the process
is supposed to go according to the tutorial!  
- Of course, there's no static library version of `libxilinxopencl.so`, so that's a dead end. I'm completely unsure if the tutorial even makes sense. 
- This entire chain of debugging is full of luck.

- [Link talking about generating `BOOT` file](https://www.xilinx.com/html_docs/xilinx2018_2/sdsoc_doc/compiling-and-running-applications-on-arm-processor-hjy1504034381720.html)

# Considerations of different kinds of KV stores

- [Immutable KV store can perform O(1) lookup](https://discodb.readthedocs.io/en/latest/)
- Ordered KV Store (like LevelDB) (not done before)
- [LSM on a GPU](https://arxiv.org/abs/1707.05354)

# Reading
Read about the vivado HLS tutorials on using BRAM/DRAM.


# People to contact to burn the FPGA
- Poornavathi
- Vivek Gupta
- Praneet Kakarla: `+91 73 82 96 83 69`: `praneethrdd877@gmail.com`

# Zip file meanings
- `v1-fpga-synthesized-can-write-loop-to-memory.zip`: We can synthesize memory correctly, since we're
able to read back what we wrote --- note that this was not possible before. However, stdout is garbled.
- `v2-fpga-correct-stdout-incorrect-request-response.zip`: We got stdout to behave (ie, not look like garbage)
by asking the linker to kindly increase the amount of space available to us on the stack and the heap.
It provides a measly `1K` otherwise.
- `v3-fpga-correct-stdout-correct-test-array-response.zip`: We add a new argument to the kernel that stores `2 * i` at array index `i`,
this contains legal values. So the problem is *not* that the kernel is not running (it is!) the problem is that we're not
able to serialize de-serailize the struct.
- `v4-fpga-runs-correctly-on-4-tests.zip` actually desrializes requests and responses properly, and provides the right values on the other side.
  This is awesome. Next test will scale this up.
