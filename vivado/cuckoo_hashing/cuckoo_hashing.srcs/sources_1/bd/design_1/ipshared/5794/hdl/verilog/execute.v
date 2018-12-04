// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module execute (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        key_to_metadata_Addr_A,
        key_to_metadata_EN_A,
        key_to_metadata_WEN_A,
        key_to_metadata_Din_A,
        key_to_metadata_Dout_A,
        ap_return
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [31:0] key_to_metadata_Addr_A;
output   key_to_metadata_EN_A;
output  [7:0] key_to_metadata_WEN_A;
output  [63:0] key_to_metadata_Din_A;
input  [63:0] key_to_metadata_Dout_A;
output  [0:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg key_to_metadata_EN_A;
reg[7:0] key_to_metadata_WEN_A;
reg[0:0] ap_return;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [8:0] key_to_metadata_addr_reg_101;
reg   [0:0] ap_phi_mux_agg_result_delete_el_phi_fu_48_p4;
wire    ap_CS_fsm_state2;
wire   [0:0] or_cond_fu_82_p2;
reg   [31:0] key_to_metadata_Addr_A_orig;
wire   [31:0] key_to_metadata_occu_fu_56_p4;
wire   [31:0] tmp_fu_72_p1;
wire   [0:0] tmp_4_fu_66_p2;
wire   [0:0] tmp_s_fu_76_p2;
reg   [0:0] ap_return_preg;
reg   [1:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_return_preg = 1'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_return_preg <= ap_phi_mux_agg_result_delete_el_phi_fu_48_p4;
        end
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if ((1'b1 == ap_CS_fsm_state2)) begin
        if ((or_cond_fu_82_p2 == 1'd0)) begin
            ap_phi_mux_agg_result_delete_el_phi_fu_48_p4 = 1'd1;
        end else if ((or_cond_fu_82_p2 == 1'd1)) begin
            ap_phi_mux_agg_result_delete_el_phi_fu_48_p4 = 1'd0;
        end else begin
            ap_phi_mux_agg_result_delete_el_phi_fu_48_p4 = 'bx;
        end
    end else begin
        ap_phi_mux_agg_result_delete_el_phi_fu_48_p4 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_return = ap_phi_mux_agg_result_delete_el_phi_fu_48_p4;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        key_to_metadata_Addr_A_orig = key_to_metadata_addr_reg_101;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        key_to_metadata_Addr_A_orig = 64'd134;
    end else begin
        key_to_metadata_Addr_A_orig = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
        key_to_metadata_EN_A = 1'b1;
    end else begin
        key_to_metadata_EN_A = 1'b0;
    end
end

always @ (*) begin
    if (((or_cond_fu_82_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        key_to_metadata_WEN_A = 8'd255;
    end else begin
        key_to_metadata_WEN_A = 8'd0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign key_to_metadata_Addr_A = key_to_metadata_Addr_A_orig << 32'd3;

assign key_to_metadata_Din_A = {{32'd0}, {key_to_metadata_Dout_A[31:0]}};

assign key_to_metadata_addr_reg_101 = 64'd134;

assign key_to_metadata_occu_fu_56_p4 = {{key_to_metadata_Dout_A[63:32]}};

assign or_cond_fu_82_p2 = (tmp_s_fu_76_p2 & tmp_4_fu_66_p2);

assign tmp_4_fu_66_p2 = ((key_to_metadata_occu_fu_56_p4 != 32'd0) ? 1'b1 : 1'b0);

assign tmp_fu_72_p1 = key_to_metadata_Dout_A[31:0];

assign tmp_s_fu_76_p2 = ((tmp_fu_72_p1 == 32'd4) ? 1'b1 : 1'b0);

endmodule //execute
