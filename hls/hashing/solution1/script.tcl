############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hashing
set_top traffic_generate_and_execute
add_files hashing/execute.cpp
add_files hashing/execute.h
add_files hashing/jenkins_hash.cpp
add_files hashing/jenkins_hash.h
add_files -tb hashing/execute_test.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./hashing/solution1/directives.tcl"
csim_design -compiler gcc
csynth_design
cosim_design -compiler gcc
export_design -rtl verilog -format ip_catalog -description "key value store" -vendor "bollu" -library "kvstore" -display_name "kvstore"
