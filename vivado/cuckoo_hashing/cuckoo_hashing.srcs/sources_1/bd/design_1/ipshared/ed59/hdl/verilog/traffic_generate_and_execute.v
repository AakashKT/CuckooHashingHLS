// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="traffic_generate_and_execute,hls_ip_2017_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.427000,HLS_SYN_LAT=4001,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=65,HLS_SYN_LUT=222}" *)

module traffic_generate_and_execute (
        ap_clk,
        ap_rst_n,
        reqresps_Addr_A,
        reqresps_EN_A,
        reqresps_WEN_A,
        reqresps_Din_A,
        reqresps_Dout_A,
        reqresps_Clk_A,
        reqresps_Rst_A,
        key_to_metadata_Addr_A,
        key_to_metadata_EN_A,
        key_to_metadata_WEN_A,
        key_to_metadata_Din_A,
        key_to_metadata_Dout_A,
        key_to_metadata_Clk_A,
        key_to_metadata_Rst_A,
        key_to_val_Addr_A,
        key_to_val_EN_A,
        key_to_val_WEN_A,
        key_to_val_Din_A,
        key_to_val_Dout_A,
        key_to_val_Clk_A,
        key_to_val_Rst_A,
        key_to_val_Addr_B,
        key_to_val_EN_B,
        key_to_val_WEN_B,
        key_to_val_Din_B,
        key_to_val_Dout_B,
        key_to_val_Clk_B,
        key_to_val_Rst_B,
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 4;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_AXILITES_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output  [31:0] reqresps_Addr_A;
output   reqresps_EN_A;
output  [15:0] reqresps_WEN_A;
output  [127:0] reqresps_Din_A;
input  [127:0] reqresps_Dout_A;
output   reqresps_Clk_A;
output   reqresps_Rst_A;
output  [31:0] key_to_metadata_Addr_A;
output   key_to_metadata_EN_A;
output  [7:0] key_to_metadata_WEN_A;
output  [63:0] key_to_metadata_Din_A;
input  [63:0] key_to_metadata_Dout_A;
output   key_to_metadata_Clk_A;
output   key_to_metadata_Rst_A;
output  [31:0] key_to_val_Addr_A;
output   key_to_val_EN_A;
output  [7:0] key_to_val_WEN_A;
output  [63:0] key_to_val_Din_A;
input  [63:0] key_to_val_Dout_A;
output   key_to_val_Clk_A;
output   key_to_val_Rst_A;
output  [31:0] key_to_val_Addr_B;
output   key_to_val_EN_B;
output  [7:0] key_to_val_WEN_B;
output  [63:0] key_to_val_Din_B;
input  [63:0] key_to_val_Dout_B;
output   key_to_val_Clk_B;
output   key_to_val_Rst_B;
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1:0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;
output   interrupt;

reg reqresps_EN_A;
reg[15:0] reqresps_WEN_A;

reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
wire   [9:0] i_1_fu_84_p2;
reg   [9:0] i_1_reg_108;
wire    ap_CS_fsm_state2;
wire   [0:0] grp_execute_fu_72_ap_return;
reg   [0:0] resp_delete_element_s_reg_113;
wire    ap_CS_fsm_state3;
wire    grp_execute_fu_72_ap_done;
wire    grp_execute_fu_72_ap_start;
wire    grp_execute_fu_72_ap_idle;
wire    grp_execute_fu_72_ap_ready;
wire   [31:0] grp_execute_fu_72_key_to_metadata_Addr_A;
wire    grp_execute_fu_72_key_to_metadata_EN_A;
wire   [7:0] grp_execute_fu_72_key_to_metadata_WEN_A;
wire   [63:0] grp_execute_fu_72_key_to_metadata_Din_A;
reg   [9:0] i_reg_60;
wire    ap_CS_fsm_state4;
reg    ap_reg_grp_execute_fu_72_ap_start;
wire   [0:0] exitcond1_fu_78_p2;
wire   [63:0] tmp_fu_90_p1;
wire   [31:0] reqresps_Addr_A_orig;
reg   [3:0] ap_NS_fsm;
wire   [114:0] reqresps_Din_A0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_reg_grp_execute_fu_72_ap_start = 1'b0;
end

traffic_generate_and_execute_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
traffic_generate_and_execute_AXILiteS_s_axi_U(
    .AWVALID(s_axi_AXILiteS_AWVALID),
    .AWREADY(s_axi_AXILiteS_AWREADY),
    .AWADDR(s_axi_AXILiteS_AWADDR),
    .WVALID(s_axi_AXILiteS_WVALID),
    .WREADY(s_axi_AXILiteS_WREADY),
    .WDATA(s_axi_AXILiteS_WDATA),
    .WSTRB(s_axi_AXILiteS_WSTRB),
    .ARVALID(s_axi_AXILiteS_ARVALID),
    .ARREADY(s_axi_AXILiteS_ARREADY),
    .ARADDR(s_axi_AXILiteS_ARADDR),
    .RVALID(s_axi_AXILiteS_RVALID),
    .RREADY(s_axi_AXILiteS_RREADY),
    .RDATA(s_axi_AXILiteS_RDATA),
    .RRESP(s_axi_AXILiteS_RRESP),
    .BVALID(s_axi_AXILiteS_BVALID),
    .BREADY(s_axi_AXILiteS_BREADY),
    .BRESP(s_axi_AXILiteS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

execute grp_execute_fu_72(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_execute_fu_72_ap_start),
    .ap_done(grp_execute_fu_72_ap_done),
    .ap_idle(grp_execute_fu_72_ap_idle),
    .ap_ready(grp_execute_fu_72_ap_ready),
    .key_to_metadata_Addr_A(grp_execute_fu_72_key_to_metadata_Addr_A),
    .key_to_metadata_EN_A(grp_execute_fu_72_key_to_metadata_EN_A),
    .key_to_metadata_WEN_A(grp_execute_fu_72_key_to_metadata_WEN_A),
    .key_to_metadata_Din_A(grp_execute_fu_72_key_to_metadata_Din_A),
    .key_to_metadata_Dout_A(key_to_metadata_Dout_A),
    .ap_return(grp_execute_fu_72_ap_return)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_grp_execute_fu_72_ap_start <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_78_p2 == 1'd0))) begin
            ap_reg_grp_execute_fu_72_ap_start <= 1'b1;
        end else if ((grp_execute_fu_72_ap_ready == 1'b1)) begin
            ap_reg_grp_execute_fu_72_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_reg_60 <= i_1_reg_108;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_60 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_108 <= i_1_fu_84_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (grp_execute_fu_72_ap_done == 1'b1))) begin
        resp_delete_element_s_reg_113 <= grp_execute_fu_72_ap_return;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_78_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_78_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        reqresps_EN_A = 1'b1;
    end else begin
        reqresps_EN_A = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        reqresps_WEN_A = 16'd65535;
    end else begin
        reqresps_WEN_A = 16'd0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_78_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (grp_execute_fu_72_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign exitcond1_fu_78_p2 = ((i_reg_60 == 10'd1000) ? 1'b1 : 1'b0);

assign grp_execute_fu_72_ap_start = ap_reg_grp_execute_fu_72_ap_start;

assign i_1_fu_84_p2 = (i_reg_60 + 10'd1);

assign key_to_metadata_Addr_A = grp_execute_fu_72_key_to_metadata_Addr_A;

assign key_to_metadata_Clk_A = ap_clk;

assign key_to_metadata_Din_A = grp_execute_fu_72_key_to_metadata_Din_A;

assign key_to_metadata_EN_A = grp_execute_fu_72_key_to_metadata_EN_A;

assign key_to_metadata_Rst_A = ap_rst_n_inv;

assign key_to_metadata_WEN_A = grp_execute_fu_72_key_to_metadata_WEN_A;

assign key_to_val_Addr_A = 32'd0;

assign key_to_val_Addr_B = 32'd0;

assign key_to_val_Clk_A = ap_clk;

assign key_to_val_Clk_B = ap_clk;

assign key_to_val_Din_A = 64'd0;

assign key_to_val_Din_B = 64'd0;

assign key_to_val_EN_A = 1'b0;

assign key_to_val_EN_B = 1'b0;

assign key_to_val_Rst_A = ap_rst_n_inv;

assign key_to_val_Rst_B = ap_rst_n_inv;

assign key_to_val_WEN_A = 8'd0;

assign key_to_val_WEN_B = 8'd0;

assign reqresps_Addr_A = reqresps_Addr_A_orig << 32'd4;

assign reqresps_Addr_A_orig = tmp_fu_90_p1;

assign reqresps_Clk_A = ap_clk;

assign reqresps_Din_A = reqresps_Din_A0;

assign reqresps_Din_A0 = {{{{2'd0}, {resp_delete_element_s_reg_113}}}, {112'd4722366487267691725825}};

assign reqresps_Rst_A = ap_rst_n_inv;

assign tmp_fu_90_p1 = i_reg_60;

endmodule //traffic_generate_and_execute
