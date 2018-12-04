#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("rrps_Addr_A", 32, hls_out, 0, "bram", "mem_address", 1),
	Port_Property("rrps_EN_A", 1, hls_out, 0, "bram", "mem_ce", 1),
	Port_Property("rrps_WEN_A", 8, hls_out, 0, "bram", "mem_we", 1),
	Port_Property("rrps_Din_A", 64, hls_out, 0, "bram", "mem_din", 1),
	Port_Property("rrps_Dout_A", 64, hls_in, 0, "bram", "mem_dout", 1),
	Port_Property("rrps_Clk_A", 1, hls_out, 0, "bram", "mem_clk", 1),
	Port_Property("rrps_Rst_A", 1, hls_out, 0, "bram", "mem_rst", 1),
	Port_Property("rrps_Addr_B", 32, hls_out, 0, "bram", "mem_address", 1),
	Port_Property("rrps_EN_B", 1, hls_out, 0, "bram", "mem_ce", 1),
	Port_Property("rrps_WEN_B", 8, hls_out, 0, "bram", "mem_we", 1),
	Port_Property("rrps_Din_B", 64, hls_out, 0, "bram", "mem_din", 1),
	Port_Property("rrps_Dout_B", 64, hls_in, 0, "bram", "mem_dout", 1),
	Port_Property("rrps_Clk_B", 1, hls_out, 0, "bram", "mem_clk", 1),
	Port_Property("rrps_Rst_B", 1, hls_out, 0, "bram", "mem_rst", 1),
};
const char* HLS_Design_Meta::dut_name = "traffic_generate_and_execute";
