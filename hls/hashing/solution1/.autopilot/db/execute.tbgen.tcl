set moduleName execute
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {execute}
set C_modelType { int 1 }
set C_modelArgList {
	{ key_to_metadata_key int 32 regular {array 384 { 1 } 1 1 }  }
	{ key_to_metadata_occu int 1 regular {array 384 { 2 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "key_to_metadata_key", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "key_to_metadata_occu", "interface" : "memory", "bitwidth" : 1, "direction" : "READWRITE"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ key_to_metadata_key_address0 sc_out sc_lv 9 signal 0 } 
	{ key_to_metadata_key_ce0 sc_out sc_logic 1 signal 0 } 
	{ key_to_metadata_key_q0 sc_in sc_lv 32 signal 0 } 
	{ key_to_metadata_occu_address0 sc_out sc_lv 9 signal 1 } 
	{ key_to_metadata_occu_ce0 sc_out sc_logic 1 signal 1 } 
	{ key_to_metadata_occu_we0 sc_out sc_logic 1 signal 1 } 
	{ key_to_metadata_occu_d0 sc_out sc_lv 1 signal 1 } 
	{ key_to_metadata_occu_q0 sc_in sc_lv 1 signal 1 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "key_to_metadata_key_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "key_to_metadata_key", "role": "address0" }} , 
 	{ "name": "key_to_metadata_key_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_to_metadata_key", "role": "ce0" }} , 
 	{ "name": "key_to_metadata_key_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_to_metadata_key", "role": "q0" }} , 
 	{ "name": "key_to_metadata_occu_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "key_to_metadata_occu", "role": "address0" }} , 
 	{ "name": "key_to_metadata_occu_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_to_metadata_occu", "role": "ce0" }} , 
 	{ "name": "key_to_metadata_occu_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_to_metadata_occu", "role": "we0" }} , 
 	{ "name": "key_to_metadata_occu_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "key_to_metadata_occu", "role": "d0" }} , 
 	{ "name": "key_to_metadata_occu_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "key_to_metadata_occu", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "execute",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"FunctionPipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "key_to_metadata_key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_to_metadata_occu", "Type" : "Memory", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	execute {
		key_to_metadata_key {Type I LastRead 1 FirstWrite -1}
		key_to_metadata_occu {Type IO LastRead 0 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	key_to_metadata_key { ap_memory {  { key_to_metadata_key_address0 mem_address 1 9 }  { key_to_metadata_key_ce0 mem_ce 1 1 }  { key_to_metadata_key_q0 mem_dout 0 32 } } }
	key_to_metadata_occu { ap_memory {  { key_to_metadata_occu_address0 mem_address 1 9 }  { key_to_metadata_occu_ce0 mem_ce 1 1 }  { key_to_metadata_occu_we0 mem_we 1 1 }  { key_to_metadata_occu_d0 mem_din 1 1 }  { key_to_metadata_occu_q0 mem_dout 0 1 } } }
}
