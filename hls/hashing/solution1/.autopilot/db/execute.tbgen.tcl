set C_TypeInfoList {{ 
"execute" : [[], {"return": [[],"0"] }, [{"ExternC" : 0}], [ {"op_type": [[], {"scalar": "int"}] }, {"hash": [[],"1"] }, {"val_addr": [[],"2"] }, {"key_val_dram": [[], {"array": ["3", [80]]}] }, {"val_addr_bram": [[], {"array": ["2", [10]]}] }],[],""], 
"0": [ "VALUE", {"typedef": [[[],"4"],""]}], 
"4": [ "uint32_t", {"typedef": [[[], {"scalar": "unsigned int"}],""]}], 
"1": [ "HASH", {"typedef": [[[],"4"],""]}], 
"2": [ "VALUE_ADDR", {"typedef": [[[],"4"],""]}], 
"3": [ "KV", {"typedef": [[[],"4"],""]}]
}}
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
set C_modelType { int 32 }
set C_modelArgList {
	{ op_type int 32 regular  }
	{ hash int 32 regular  }
	{ val_addr int 32 regular  }
	{ key_val_dram int 32 regular {array 80 { 2 1 } 1 1 }  }
	{ val_addr_bram int 32 regular {bram 10 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "op_type", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "op_type","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "hash", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "hash","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "val_addr", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "val_addr","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "key_val_dram", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "key_val_dram","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 79,"step" : 1}]}]}]} , 
 	{ "Name" : "val_addr_bram", "interface" : "bram", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "val_addr_bram","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 9,"step" : 1}]}]}]} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "return","cData": "VALUE","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 1,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ op_type sc_in sc_lv 32 signal 0 } 
	{ hash sc_in sc_lv 32 signal 1 } 
	{ val_addr sc_in sc_lv 32 signal 2 } 
	{ key_val_dram_address0 sc_out sc_lv 7 signal 3 } 
	{ key_val_dram_ce0 sc_out sc_logic 1 signal 3 } 
	{ key_val_dram_we0 sc_out sc_logic 1 signal 3 } 
	{ key_val_dram_d0 sc_out sc_lv 32 signal 3 } 
	{ key_val_dram_q0 sc_in sc_lv 32 signal 3 } 
	{ key_val_dram_address1 sc_out sc_lv 7 signal 3 } 
	{ key_val_dram_ce1 sc_out sc_logic 1 signal 3 } 
	{ key_val_dram_q1 sc_in sc_lv 32 signal 3 } 
	{ val_addr_bram_Addr_A sc_out sc_lv 32 signal 4 } 
	{ val_addr_bram_EN_A sc_out sc_logic 1 signal 4 } 
	{ val_addr_bram_WEN_A sc_out sc_lv 4 signal 4 } 
	{ val_addr_bram_Din_A sc_out sc_lv 32 signal 4 } 
	{ val_addr_bram_Dout_A sc_in sc_lv 32 signal 4 } 
	{ val_addr_bram_Clk_A sc_out sc_logic 1 signal 4 } 
	{ val_addr_bram_Rst_A sc_out sc_logic 1 signal 4 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "op_type", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "op_type", "role": "default" }} , 
 	{ "name": "hash", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hash", "role": "default" }} , 
 	{ "name": "val_addr", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "val_addr", "role": "default" }} , 
 	{ "name": "key_val_dram_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "key_val_dram", "role": "address0" }} , 
 	{ "name": "key_val_dram_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_val_dram", "role": "ce0" }} , 
 	{ "name": "key_val_dram_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_val_dram", "role": "we0" }} , 
 	{ "name": "key_val_dram_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_val_dram", "role": "d0" }} , 
 	{ "name": "key_val_dram_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_val_dram", "role": "q0" }} , 
 	{ "name": "key_val_dram_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "key_val_dram", "role": "address1" }} , 
 	{ "name": "key_val_dram_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key_val_dram", "role": "ce1" }} , 
 	{ "name": "key_val_dram_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "key_val_dram", "role": "q1" }} , 
 	{ "name": "val_addr_bram_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "Addr_A" }} , 
 	{ "name": "val_addr_bram_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "EN_A" }} , 
 	{ "name": "val_addr_bram_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "WEN_A" }} , 
 	{ "name": "val_addr_bram_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "Din_A" }} , 
 	{ "name": "val_addr_bram_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "Dout_A" }} , 
 	{ "name": "val_addr_bram_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "Clk_A" }} , 
 	{ "name": "val_addr_bram_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "val_addr_bram", "role": "Rst_A" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

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
			{"Name" : "op_type", "Type" : "None", "Direction" : "I"},
			{"Name" : "hash", "Type" : "None", "Direction" : "I"},
			{"Name" : "val_addr", "Type" : "None", "Direction" : "I"},
			{"Name" : "key_val_dram", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "val_addr_bram", "Type" : "Bram", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	execute {
		op_type {Type I LastRead 0 FirstWrite -1}
		hash {Type I LastRead 0 FirstWrite -1}
		val_addr {Type I LastRead 0 FirstWrite -1}
		key_val_dram {Type IO LastRead 1 FirstWrite 1}
		val_addr_bram {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "3"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	op_type { ap_none {  { op_type in_data 0 32 } } }
	hash { ap_none {  { hash in_data 0 32 } } }
	val_addr { ap_none {  { val_addr in_data 0 32 } } }
	key_val_dram { ap_memory {  { key_val_dram_address0 mem_address 1 7 }  { key_val_dram_ce0 mem_ce 1 1 }  { key_val_dram_we0 mem_we 1 1 }  { key_val_dram_d0 mem_din 1 32 }  { key_val_dram_q0 mem_dout 0 32 }  { key_val_dram_address1 mem_address 1 7 }  { key_val_dram_ce1 mem_ce 1 1 }  { key_val_dram_q1 mem_dout 0 32 } } }
	val_addr_bram { bram {  { val_addr_bram_Addr_A mem_address 1 32 }  { val_addr_bram_EN_A mem_ce 1 1 }  { val_addr_bram_WEN_A mem_we 1 4 }  { val_addr_bram_Din_A mem_din 1 32 }  { val_addr_bram_Dout_A mem_dout 0 32 }  { val_addr_bram_Clk_A mem_clk 1 1 }  { val_addr_bram_Rst_A mem_rst 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
