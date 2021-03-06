-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity execute is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    key_to_metadata_key_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    key_to_metadata_key_ce0 : OUT STD_LOGIC;
    key_to_metadata_key_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    key_to_metadata_occu_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    key_to_metadata_occu_ce0 : OUT STD_LOGIC;
    key_to_metadata_occu_we0 : OUT STD_LOGIC;
    key_to_metadata_occu_d0 : OUT STD_LOGIC_VECTOR (0 downto 0);
    key_to_metadata_occu_q0 : IN STD_LOGIC_VECTOR (0 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of execute is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv64_86 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000010000110";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal key_to_metadata_occu_2_reg_72 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal key_to_metadata_occu_3_reg_82 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_agg_result_delete_el_phi_fu_58_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_9_fu_66_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv1_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    ap_return_preg <= ap_phi_mux_agg_result_delete_el_phi_fu_58_p4;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                key_to_metadata_occu_3_reg_82 <= key_to_metadata_occu_q0;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_agg_result_delete_el_phi_fu_58_p4_assign_proc : process(key_to_metadata_occu_3_reg_82, ap_CS_fsm_state3, tmp_9_fu_66_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
            if (((tmp_9_fu_66_p2 = ap_const_lv1_0) or (key_to_metadata_occu_3_reg_82 = ap_const_lv1_0))) then 
                ap_phi_mux_agg_result_delete_el_phi_fu_58_p4 <= ap_const_lv1_1;
            elsif (((tmp_9_fu_66_p2 = ap_const_lv1_1) and (key_to_metadata_occu_3_reg_82 = ap_const_lv1_1))) then 
                ap_phi_mux_agg_result_delete_el_phi_fu_58_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_agg_result_delete_el_phi_fu_58_p4 <= "X";
            end if;
        else 
            ap_phi_mux_agg_result_delete_el_phi_fu_58_p4 <= "X";
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_agg_result_delete_el_phi_fu_58_p4, ap_CS_fsm_state3, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_return <= ap_phi_mux_agg_result_delete_el_phi_fu_58_p4;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    key_to_metadata_key_address0 <= ap_const_lv64_86(9 - 1 downto 0);

    key_to_metadata_key_ce0_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            key_to_metadata_key_ce0 <= ap_const_logic_1;
        else 
            key_to_metadata_key_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    key_to_metadata_occu_2_reg_72 <= ap_const_lv64_86(9 - 1 downto 0);

    key_to_metadata_occu_address0_assign_proc : process(ap_CS_fsm_state1, key_to_metadata_occu_2_reg_72, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            key_to_metadata_occu_address0 <= key_to_metadata_occu_2_reg_72;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            key_to_metadata_occu_address0 <= ap_const_lv64_86(9 - 1 downto 0);
        else 
            key_to_metadata_occu_address0 <= "XXXXXXXXX";
        end if; 
    end process;


    key_to_metadata_occu_ce0_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            key_to_metadata_occu_ce0 <= ap_const_logic_1;
        else 
            key_to_metadata_occu_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    key_to_metadata_occu_d0 <= ap_const_lv1_0;

    key_to_metadata_occu_we0_assign_proc : process(key_to_metadata_occu_3_reg_82, ap_CS_fsm_state3, tmp_9_fu_66_p2)
    begin
        if (((tmp_9_fu_66_p2 = ap_const_lv1_1) and (key_to_metadata_occu_3_reg_82 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            key_to_metadata_occu_we0 <= ap_const_logic_1;
        else 
            key_to_metadata_occu_we0 <= ap_const_logic_0;
        end if; 
    end process;

    tmp_9_fu_66_p2 <= "1" when (key_to_metadata_key_q0 = ap_const_lv32_4) else "0";
end behav;
