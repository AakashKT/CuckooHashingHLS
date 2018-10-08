############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project cuckoo-hashing-hls
set_top axpy
add_files cuckoo-hashing-hls/solution1/src/conv.cpp
add_files cuckoo-hashing-hls/solution1/src/conv.h
add_files -tb cuckoo-hashing-hls/solution1/test/test_conv.cpp
open_solution "solution1"
set_part {xc7z007sclg400-1} -tool vivado
create_clock -period 10 -name default
#source "./cuckoo-hashing-hls/solution1/directives.tcl"
csim_design -compiler clang
csynth_design
cosim_design -compiler gcc
export_design -format ip_catalog
