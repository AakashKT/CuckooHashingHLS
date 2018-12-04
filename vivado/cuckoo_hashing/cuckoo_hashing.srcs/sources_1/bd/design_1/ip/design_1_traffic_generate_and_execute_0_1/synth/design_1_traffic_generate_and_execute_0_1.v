// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: bollu:kvstore:traffic_generate_and_execute:1.0
// IP Revision: 1812041905

(* X_CORE_INFO = "traffic_generate_and_execute,Vivado 2017.4" *)
(* CHECK_LICENSE_TYPE = "design_1_traffic_generate_and_execute_0_1,traffic_generate_and_execute,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_traffic_generate_and_execute_0_1 (
  s_axi_AXILiteS_AWADDR,
  s_axi_AXILiteS_AWVALID,
  s_axi_AXILiteS_AWREADY,
  s_axi_AXILiteS_WDATA,
  s_axi_AXILiteS_WSTRB,
  s_axi_AXILiteS_WVALID,
  s_axi_AXILiteS_WREADY,
  s_axi_AXILiteS_BRESP,
  s_axi_AXILiteS_BVALID,
  s_axi_AXILiteS_BREADY,
  s_axi_AXILiteS_ARADDR,
  s_axi_AXILiteS_ARVALID,
  s_axi_AXILiteS_ARREADY,
  s_axi_AXILiteS_RDATA,
  s_axi_AXILiteS_RRESP,
  s_axi_AXILiteS_RVALID,
  s_axi_AXILiteS_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  reqresps_Clk_A,
  reqresps_Rst_A,
  reqresps_EN_A,
  reqresps_WEN_A,
  reqresps_Addr_A,
  reqresps_Din_A,
  reqresps_Dout_A,
  key_to_metadata_Clk_A,
  key_to_metadata_Rst_A,
  key_to_metadata_EN_A,
  key_to_metadata_WEN_A,
  key_to_metadata_Addr_A,
  key_to_metadata_Din_A,
  key_to_metadata_Dout_A,
  key_to_val_Clk_A,
  key_to_val_Rst_A,
  key_to_val_EN_A,
  key_to_val_WEN_A,
  key_to_val_Addr_A,
  key_to_val_Din_A,
  key_to_val_Dout_A,
  key_to_val_Clk_B,
  key_to_val_Rst_B,
  key_to_val_EN_B,
  key_to_val_WEN_B,
  key_to_val_Addr_B,
  key_to_val_Din_B,
  key_to_val_Dout_B
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR" *)
input wire [3 : 0] s_axi_AXILiteS_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID" *)
input wire s_axi_AXILiteS_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY" *)
output wire s_axi_AXILiteS_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA" *)
input wire [31 : 0] s_axi_AXILiteS_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB" *)
input wire [3 : 0] s_axi_AXILiteS_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID" *)
input wire s_axi_AXILiteS_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY" *)
output wire s_axi_AXILiteS_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP" *)
output wire [1 : 0] s_axi_AXILiteS_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID" *)
output wire s_axi_AXILiteS_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY" *)
input wire s_axi_AXILiteS_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR" *)
input wire [3 : 0] s_axi_AXILiteS_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID" *)
input wire s_axi_AXILiteS_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY" *)
output wire s_axi_AXILiteS_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA" *)
output wire [31 : 0] s_axi_AXILiteS_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP" *)
output wire [1 : 0] s_axi_AXILiteS_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID" *)
output wire s_axi_AXILiteS_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_AXILiteS, ADDR_WIDTH 4, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY" *)
input wire s_axi_AXILiteS_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_AXILiteS, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_1_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {INTERRUPT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA CLK" *)
output wire reqresps_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA RST" *)
output wire reqresps_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA EN" *)
output wire reqresps_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA WE" *)
output wire [15 : 0] reqresps_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA ADDR" *)
output wire [31 : 0] reqresps_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA DIN" *)
output wire [127 : 0] reqresps_Din_A;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reqresps_PORTA, MEM_WIDTH 128, MEM_SIZE 16000, MASTER_TYPE BRAM_CTRL, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {EN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ADDR {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} WE {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DIN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_req {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value req} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_tag {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value tag} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_insert_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value insert_value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 40} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}} field_resp {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value resp} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 72} struct {field_tag {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value tag} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_search_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value search_value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_delete_element_not_found {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value delete_element_not_found} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 40}}} field_search_element_not_found {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value search_element_not_found} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 41}}} field_insert_collided {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value insert_collided} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 42}}}}}}}}} DOUT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_req {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value req} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_tag {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value tag} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_insert_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value insert_value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 40} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}} field_resp {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value resp} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 72} struct {field_tag {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value tag} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_search_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value search_value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_delete_element_not_found {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value delete_element_not_found} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 40}}} field_search_element_not_found {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value search_element_not_found} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 41}}} field_insert_collided {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value insert_collided} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 42}}}}}}}}}}, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 reqresps_PORTA DOUT" *)
input wire [127 : 0] reqresps_Dout_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA CLK" *)
output wire key_to_metadata_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA RST" *)
output wire key_to_metadata_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA EN" *)
output wire key_to_metadata_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA WE" *)
output wire [7 : 0] key_to_metadata_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA ADDR" *)
output wire [31 : 0] key_to_metadata_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA DIN" *)
output wire [63 : 0] key_to_metadata_Din_A;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME key_to_metadata_PORTA, MEM_WIDTH 64, MEM_SIZE 3072, MASTER_TYPE BRAM_CTRL, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {EN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ADDR {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} WE {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DIN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_occupied {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value occupied} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}} DOUT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_occupied {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value occupied} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_metadata_PORTA DOUT" *)
input wire [63 : 0] key_to_metadata_Dout_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA CLK" *)
output wire key_to_val_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA RST" *)
output wire key_to_val_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA EN" *)
output wire key_to_val_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA WE" *)
output wire [7 : 0] key_to_val_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA ADDR" *)
output wire [31 : 0] key_to_val_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA DIN" *)
output wire [63 : 0] key_to_val_Din_A;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME key_to_val_PORTA, MEM_WIDTH 64, MEM_SIZE 3072, MASTER_TYPE BRAM_CTRL, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {EN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ADDR {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} WE {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DIN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}} DOUT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}}}, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTA DOUT" *)
input wire [63 : 0] key_to_val_Dout_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB CLK" *)
output wire key_to_val_Clk_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB RST" *)
output wire key_to_val_Rst_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB EN" *)
output wire key_to_val_EN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB WE" *)
output wire [7 : 0] key_to_val_WEN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB ADDR" *)
output wire [31 : 0] key_to_val_Addr_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB DIN" *)
output wire [63 : 0] key_to_val_Din_B;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME key_to_val_PORTB, MEM_WIDTH 64, MEM_SIZE 3072, MASTER_TYPE BRAM_CTRL, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {EN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} ADDR {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} WE {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DIN {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}} DOUT {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_key {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value key} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_value {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value value} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}}}, MEM_ECC NONE, READ_WRITE_MODE READ_WRITE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 key_to_val_PORTB DOUT" *)
input wire [63 : 0] key_to_val_Dout_B;

  traffic_generate_and_execute #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(4),
    .C_S_AXI_AXILITES_DATA_WIDTH(32)
  ) inst (
    .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
    .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
    .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
    .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
    .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
    .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
    .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
    .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
    .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
    .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .reqresps_Clk_A(reqresps_Clk_A),
    .reqresps_Rst_A(reqresps_Rst_A),
    .reqresps_EN_A(reqresps_EN_A),
    .reqresps_WEN_A(reqresps_WEN_A),
    .reqresps_Addr_A(reqresps_Addr_A),
    .reqresps_Din_A(reqresps_Din_A),
    .reqresps_Dout_A(reqresps_Dout_A),
    .key_to_metadata_Clk_A(key_to_metadata_Clk_A),
    .key_to_metadata_Rst_A(key_to_metadata_Rst_A),
    .key_to_metadata_EN_A(key_to_metadata_EN_A),
    .key_to_metadata_WEN_A(key_to_metadata_WEN_A),
    .key_to_metadata_Addr_A(key_to_metadata_Addr_A),
    .key_to_metadata_Din_A(key_to_metadata_Din_A),
    .key_to_metadata_Dout_A(key_to_metadata_Dout_A),
    .key_to_val_Clk_A(key_to_val_Clk_A),
    .key_to_val_Rst_A(key_to_val_Rst_A),
    .key_to_val_EN_A(key_to_val_EN_A),
    .key_to_val_WEN_A(key_to_val_WEN_A),
    .key_to_val_Addr_A(key_to_val_Addr_A),
    .key_to_val_Din_A(key_to_val_Din_A),
    .key_to_val_Dout_A(key_to_val_Dout_A),
    .key_to_val_Clk_B(key_to_val_Clk_B),
    .key_to_val_Rst_B(key_to_val_Rst_B),
    .key_to_val_EN_B(key_to_val_EN_B),
    .key_to_val_WEN_B(key_to_val_WEN_B),
    .key_to_val_Addr_B(key_to_val_Addr_B),
    .key_to_val_Din_B(key_to_val_Din_B),
    .key_to_val_Dout_B(key_to_val_Dout_B)
  );
endmodule
