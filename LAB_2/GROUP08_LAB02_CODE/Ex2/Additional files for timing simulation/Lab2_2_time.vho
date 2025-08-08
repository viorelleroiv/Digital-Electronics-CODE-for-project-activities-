-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "03/10/2025 21:55:29"

-- 
-- Device: Altera EP4CGX110DF31I7 Package FBGA896
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_NCEO~	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: 16mA
-- ~ALTERA_DATA0~	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_NCSO~	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_NCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_NCSO~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	part2 IS
    PORT (
	SW : IN std_logic_vector(4 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END part2;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_E28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_Y30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_T21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_U25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_Y28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_V28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_T25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_G23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AE30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_V26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AA29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AB29,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF part2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \MUX0|OUTPUT[12]~0_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[0]~1_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT~0_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[2]~2_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[2]~3_combout\ : std_logic;
SIGNAL \H0|DISPLAY[6]~0_combout\ : std_logic;
SIGNAL \H0|DISPLAY[3]~1_combout\ : std_logic;
SIGNAL \H0|DISPLAY[2]~2_combout\ : std_logic;
SIGNAL \H0|DISPLAY[1]~3_combout\ : std_logic;
SIGNAL \H0|DISPLAY[0]~4_combout\ : std_logic;
SIGNAL \H0|DISPLAY[0]~5_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[5]~4_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[5]~5_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[3]~6_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[3]~7_combout\ : std_logic;
SIGNAL \H1|DISPLAY[6]~10_combout\ : std_logic;
SIGNAL \H1|DISPLAY[3]~11_combout\ : std_logic;
SIGNAL \H1|DISPLAY[2]~8_combout\ : std_logic;
SIGNAL \H1|DISPLAY[2]~13_combout\ : std_logic;
SIGNAL \H1|DISPLAY[1]~12_combout\ : std_logic;
SIGNAL \H1|DISPLAY[0]~9_combout\ : std_logic;
SIGNAL \H2|DISPLAY[6]~28_combout\ : std_logic;
SIGNAL \H2|DISPLAY[6]~29_combout\ : std_logic;
SIGNAL \H2|DISPLAY[3]~26_combout\ : std_logic;
SIGNAL \H2|DISPLAY[3]~27_combout\ : std_logic;
SIGNAL \H2|DISPLAY[2]~3_combout\ : std_logic;
SIGNAL \H2|DISPLAY[2]~23_combout\ : std_logic;
SIGNAL \H2|DISPLAY[1]~24_combout\ : std_logic;
SIGNAL \H2|DISPLAY[1]~25_combout\ : std_logic;
SIGNAL \H2|DISPLAY[0]~21_combout\ : std_logic;
SIGNAL \H2|DISPLAY[0]~22_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[11]~10_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[11]~11_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[9]~9_combout\ : std_logic;
SIGNAL \SHIFT0|OUTPUT[10]~8_combout\ : std_logic;
SIGNAL \H3|DISPLAY[6]~0_combout\ : std_logic;
SIGNAL \H3|Equal6~0_combout\ : std_logic;
SIGNAL \H3|DISPLAY[3]~1_combout\ : std_logic;
SIGNAL \SHIFT0|Equal0~0_combout\ : std_logic;
SIGNAL \H3|DISPLAY[2]~2_combout\ : std_logic;
SIGNAL \H3|DISPLAY[1]~3_combout\ : std_logic;
SIGNAL \H3|DISPLAY[0]~4_combout\ : std_logic;
SIGNAL \H3|DISPLAY[0]~5_combout\ : std_logic;
SIGNAL \H4|DISPLAY[6]~30_combout\ : std_logic;
SIGNAL \H4|DISPLAY[6]~31_combout\ : std_logic;
SIGNAL \H4|DISPLAY[3]~28_combout\ : std_logic;
SIGNAL \H4|DISPLAY[3]~29_combout\ : std_logic;
SIGNAL \H4|DISPLAY[2]~26_combout\ : std_logic;
SIGNAL \H4|DISPLAY[2]~27_combout\ : std_logic;
SIGNAL \H4|DISPLAY[1]~24_combout\ : std_logic;
SIGNAL \H4|DISPLAY[1]~25_combout\ : std_logic;
SIGNAL \H4|DISPLAY[0]~18_combout\ : std_logic;
SIGNAL \H4|DISPLAY[0]~23_combout\ : std_logic;
SIGNAL \H4|ALT_INV_DISPLAY[6]~31_combout\ : std_logic;
SIGNAL \H3|ALT_INV_DISPLAY[6]~0_combout\ : std_logic;
SIGNAL \H0|ALT_INV_DISPLAY[3]~1_combout\ : std_logic;
SIGNAL \H1|ALT_INV_DISPLAY[6]~10_combout\ : std_logic;
SIGNAL \H2|ALT_INV_DISPLAY[6]~29_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SW <= SW;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\H4|ALT_INV_DISPLAY[6]~31_combout\ <= NOT \H4|DISPLAY[6]~31_combout\;
\H3|ALT_INV_DISPLAY[6]~0_combout\ <= NOT \H3|DISPLAY[6]~0_combout\;
\H0|ALT_INV_DISPLAY[3]~1_combout\ <= NOT \H0|DISPLAY[3]~1_combout\;
\H1|ALT_INV_DISPLAY[6]~10_combout\ <= NOT \H1|DISPLAY[6]~10_combout\;
\H2|ALT_INV_DISPLAY[6]~29_combout\ <= NOT \H2|DISPLAY[6]~29_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X117_Y26_N9
\HEX0[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H0|DISPLAY[6]~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X117_Y83_N9
\HEX0[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X117_Y83_N2
\HEX0[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X117_Y22_N2
\HEX0[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H0|ALT_INV_DISPLAY[3]~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X117_Y18_N9
\HEX0[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H0|DISPLAY[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X117_Y22_N9
\HEX0[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H0|DISPLAY[1]~3_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X117_Y32_N9
\HEX0[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H0|DISPLAY[0]~5_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X117_Y33_N9
\HEX1[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H1|ALT_INV_DISPLAY[6]~10_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\HEX1[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X28_Y0_N9
\HEX1[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X117_Y17_N2
\HEX1[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H1|DISPLAY[3]~11_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X117_Y29_N9
\HEX1[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H1|DISPLAY[2]~13_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X117_Y31_N2
\HEX1[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H1|DISPLAY[1]~12_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X117_Y32_N2
\HEX1[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H1|DISPLAY[0]~9_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X117_Y35_N9
\HEX2[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H2|ALT_INV_DISPLAY[6]~29_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X46_Y91_N16
\HEX2[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X41_Y0_N16
\HEX2[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X117_Y34_N9
\HEX2[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H2|DISPLAY[3]~27_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X117_Y28_N9
\HEX2[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H2|DISPLAY[2]~23_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X117_Y21_N2
\HEX2[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H2|DISPLAY[1]~25_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X117_Y28_N2
\HEX2[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H2|DISPLAY[0]~22_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X117_Y23_N9
\HEX3[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H3|ALT_INV_DISPLAY[6]~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X77_Y91_N9
\HEX3[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X117_Y39_N2
\HEX3[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X117_Y19_N2
\HEX3[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H3|DISPLAY[3]~1_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X117_Y21_N9
\HEX3[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H3|DISPLAY[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X117_Y24_N2
\HEX3[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H3|DISPLAY[1]~3_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X117_Y18_N2
\HEX3[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H3|DISPLAY[0]~5_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X117_Y34_N2
\HEX4[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H4|ALT_INV_DISPLAY[6]~31_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X39_Y91_N9
\HEX4[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X108_Y91_N9
\HEX4[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X117_Y19_N9
\HEX4[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H4|DISPLAY[3]~29_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X117_Y33_N2
\HEX4[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H4|DISPLAY[2]~27_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X117_Y23_N2
\HEX4[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H4|DISPLAY[1]~25_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X117_Y24_N9
\HEX4[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \H4|DISPLAY[0]~23_combout\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOIBUF_X117_Y27_N8
\SW[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X117_Y31_N8
\SW[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X116_Y27_N16
\MUX0|OUTPUT[12]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MUX0|OUTPUT[12]~0_combout\ = (\SW[0]~input_o\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \SW[1]~input_o\,
	combout => \MUX0|OUTPUT[12]~0_combout\);

-- Location: IOIBUF_X117_Y27_N1
\SW[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X117_Y26_N1
\SW[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X117_Y29_N1
\SW[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LCCOMB_X116_Y27_N26
\SHIFT0|OUTPUT[0]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[0]~1_combout\ = (\SW[2]~input_o\ & ((\SW[4]~input_o\) # ((\MUX0|OUTPUT[12]~0_combout\ & !\SW[3]~input_o\)))) # (!\SW[2]~input_o\ & (((\SW[3]~input_o\) # (!\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX0|OUTPUT[12]~0_combout\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[0]~1_combout\);

-- Location: LCCOMB_X116_Y28_N16
\SHIFT0|OUTPUT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT~0_combout\ = (!\SW[4]~input_o\ & (\SW[2]~input_o\ $ (\SW[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT~0_combout\);

-- Location: LCCOMB_X116_Y28_N2
\SHIFT0|OUTPUT[2]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[2]~2_combout\ = (\SW[3]~input_o\ & ((\SW[4]~input_o\))) # (!\SW[3]~input_o\ & (\SW[1]~input_o\ & !\SW[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[2]~2_combout\);

-- Location: LCCOMB_X116_Y28_N12
\SHIFT0|OUTPUT[2]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[2]~3_combout\ = (\SHIFT0|OUTPUT[2]~2_combout\ & (\SW[2]~input_o\ & ((!\SW[4]~input_o\)))) # (!\SHIFT0|OUTPUT[2]~2_combout\ & (\SW[0]~input_o\ & (\SW[2]~input_o\ $ (\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[0]~input_o\,
	datac => \SHIFT0|OUTPUT[2]~2_combout\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[2]~3_combout\);

-- Location: LCCOMB_X116_Y26_N24
\H0|DISPLAY[6]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H0|DISPLAY[6]~0_combout\ = \SHIFT0|OUTPUT~0_combout\ $ (((!\SHIFT0|OUTPUT[0]~1_combout\ & \SHIFT0|OUTPUT[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[0]~1_combout\,
	datac => \SHIFT0|OUTPUT~0_combout\,
	datad => \SHIFT0|OUTPUT[2]~3_combout\,
	combout => \H0|DISPLAY[6]~0_combout\);

-- Location: LCCOMB_X116_Y26_N18
\H0|DISPLAY[3]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H0|DISPLAY[3]~1_combout\ = \SHIFT0|OUTPUT[2]~3_combout\ $ (((!\SHIFT0|OUTPUT[0]~1_combout\ & \SHIFT0|OUTPUT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[0]~1_combout\,
	datac => \SHIFT0|OUTPUT~0_combout\,
	datad => \SHIFT0|OUTPUT[2]~3_combout\,
	combout => \H0|DISPLAY[3]~1_combout\);

-- Location: LCCOMB_X116_Y26_N20
\H0|DISPLAY[2]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H0|DISPLAY[2]~2_combout\ = (!\SHIFT0|OUTPUT[2]~3_combout\ & (\SHIFT0|OUTPUT[0]~1_combout\ $ (\SHIFT0|OUTPUT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[0]~1_combout\,
	datac => \SHIFT0|OUTPUT~0_combout\,
	datad => \SHIFT0|OUTPUT[2]~3_combout\,
	combout => \H0|DISPLAY[2]~2_combout\);

-- Location: LCCOMB_X116_Y26_N6
\H0|DISPLAY[1]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H0|DISPLAY[1]~3_combout\ = (\SHIFT0|OUTPUT[0]~1_combout\ & (!\SHIFT0|OUTPUT~0_combout\ & !\SHIFT0|OUTPUT[2]~3_combout\)) # (!\SHIFT0|OUTPUT[0]~1_combout\ & (\SHIFT0|OUTPUT~0_combout\ $ (\SHIFT0|OUTPUT[2]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[0]~1_combout\,
	datac => \SHIFT0|OUTPUT~0_combout\,
	datad => \SHIFT0|OUTPUT[2]~3_combout\,
	combout => \H0|DISPLAY[1]~3_combout\);

-- Location: LCCOMB_X116_Y30_N8
\H0|DISPLAY[0]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H0|DISPLAY[0]~4_combout\ = (\SW[2]~input_o\ & ((\SW[4]~input_o\) # ((!\SW[3]~input_o\ & \SW[1]~input_o\)))) # (!\SW[2]~input_o\ & (((\SW[3]~input_o\)) # (!\SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101111011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \H0|DISPLAY[0]~4_combout\);

-- Location: LCCOMB_X116_Y30_N26
\H0|DISPLAY[0]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H0|DISPLAY[0]~5_combout\ = (\H0|DISPLAY[0]~4_combout\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \H0|DISPLAY[0]~4_combout\,
	datad => \SW[0]~input_o\,
	combout => \H0|DISPLAY[0]~5_combout\);

-- Location: LCCOMB_X116_Y30_N4
\SHIFT0|OUTPUT[5]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[5]~4_combout\ = (!\SW[2]~input_o\ & (!\SW[4]~input_o\ & (\SW[3]~input_o\ & \SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \SHIFT0|OUTPUT[5]~4_combout\);

-- Location: LCCOMB_X116_Y30_N6
\SHIFT0|OUTPUT[5]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[5]~5_combout\ = (\SHIFT0|OUTPUT[5]~4_combout\) # ((\SW[0]~input_o\ & ((\SW[4]~input_o\) # (!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SHIFT0|OUTPUT[5]~4_combout\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[5]~5_combout\);

-- Location: LCCOMB_X116_Y30_N16
\SHIFT0|OUTPUT[3]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[3]~6_combout\ = (\SW[3]~input_o\ & \SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \SHIFT0|OUTPUT[3]~6_combout\);

-- Location: LCCOMB_X116_Y30_N18
\SHIFT0|OUTPUT[3]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[3]~7_combout\ = (!\SW[4]~input_o\ & ((\SW[2]~input_o\) # ((\SW[0]~input_o\ & \SHIFT0|OUTPUT[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SHIFT0|OUTPUT[3]~6_combout\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[3]~7_combout\);

-- Location: LCCOMB_X116_Y30_N22
\H1|DISPLAY[6]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H1|DISPLAY[6]~10_combout\ = (\SHIFT0|OUTPUT[5]~5_combout\ & (\SHIFT0|OUTPUT[3]~7_combout\ $ (((\SW[3]~input_o\ & !\SW[4]~input_o\))))) # (!\SHIFT0|OUTPUT[5]~5_combout\ & (((\SW[4]~input_o\) # (!\SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110100101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[5]~5_combout\,
	datab => \SHIFT0|OUTPUT[3]~7_combout\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H1|DISPLAY[6]~10_combout\);

-- Location: LCCOMB_X116_Y30_N24
\H1|DISPLAY[3]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H1|DISPLAY[3]~11_combout\ = \SHIFT0|OUTPUT[5]~5_combout\ $ (((\SHIFT0|OUTPUT[3]~7_combout\) # ((\SW[4]~input_o\) # (!\SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[5]~5_combout\,
	datab => \SHIFT0|OUTPUT[3]~7_combout\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H1|DISPLAY[3]~11_combout\);

-- Location: LCCOMB_X116_Y29_N24
\H1|DISPLAY[2]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H1|DISPLAY[2]~8_combout\ = (\SW[3]~input_o\ & (!\SW[0]~input_o\ & (!\SW[2]~input_o\ & !\SW[1]~input_o\))) # (!\SW[3]~input_o\ & (((\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \H1|DISPLAY[2]~8_combout\);

-- Location: LCCOMB_X116_Y29_N2
\H1|DISPLAY[2]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H1|DISPLAY[2]~13_combout\ = (\H1|DISPLAY[2]~8_combout\ & !\SW[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \H1|DISPLAY[2]~8_combout\,
	datad => \SW[4]~input_o\,
	combout => \H1|DISPLAY[2]~13_combout\);

-- Location: LCCOMB_X116_Y30_N10
\H1|DISPLAY[1]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H1|DISPLAY[1]~12_combout\ = (\SHIFT0|OUTPUT[5]~5_combout\ & (!\SHIFT0|OUTPUT[3]~7_combout\ & ((\SW[4]~input_o\) # (!\SW[3]~input_o\)))) # (!\SHIFT0|OUTPUT[5]~5_combout\ & (\SHIFT0|OUTPUT[3]~7_combout\ $ (((\SW[3]~input_o\ & !\SW[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[5]~5_combout\,
	datab => \SHIFT0|OUTPUT[3]~7_combout\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H1|DISPLAY[1]~12_combout\);

-- Location: LCCOMB_X116_Y30_N12
\H1|DISPLAY[0]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H1|DISPLAY[0]~9_combout\ = (\SW[0]~input_o\) # ((!\SW[4]~input_o\ & ((\SHIFT0|OUTPUT[3]~6_combout\) # (\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SHIFT0|OUTPUT[3]~6_combout\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H1|DISPLAY[0]~9_combout\);

-- Location: LCCOMB_X116_Y28_N26
\H2|DISPLAY[6]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[6]~28_combout\ = (\SW[2]~input_o\ & (\SW[0]~input_o\ $ (((\SW[1]~input_o\) # (!\SW[3]~input_o\))))) # (!\SW[2]~input_o\ & (\SW[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \H2|DISPLAY[6]~28_combout\);

-- Location: LCCOMB_X116_Y28_N4
\H2|DISPLAY[6]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[6]~29_combout\ = (\H2|DISPLAY[6]~28_combout\ & (((\SW[3]~input_o\ & !\SW[4]~input_o\)) # (!\SW[0]~input_o\))) # (!\H2|DISPLAY[6]~28_combout\ & (!\SW[0]~input_o\ & (\SW[3]~input_o\ $ (!\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001010100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \H2|DISPLAY[6]~28_combout\,
	datab => \SW[0]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H2|DISPLAY[6]~29_combout\);

-- Location: LCCOMB_X116_Y30_N28
\H2|DISPLAY[3]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[3]~26_combout\ = (\SW[0]~input_o\ $ (((\SW[4]~input_o\) # (\SW[1]~input_o\)))) # (!\SW[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \H2|DISPLAY[3]~26_combout\);

-- Location: LCCOMB_X116_Y30_N14
\H2|DISPLAY[3]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[3]~27_combout\ = (\SW[0]~input_o\ & (\H2|DISPLAY[3]~26_combout\ & (\SW[3]~input_o\ $ (\SW[4]~input_o\)))) # (!\SW[0]~input_o\ & ((\H2|DISPLAY[3]~26_combout\) # ((!\SW[3]~input_o\ & !\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \H2|DISPLAY[3]~26_combout\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H2|DISPLAY[3]~27_combout\);

-- Location: LCCOMB_X116_Y28_N22
\H2|DISPLAY[2]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[2]~3_combout\ = (!\SW[0]~input_o\ & !\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datac => \SW[1]~input_o\,
	combout => \H2|DISPLAY[2]~3_combout\);

-- Location: LCCOMB_X116_Y28_N24
\H2|DISPLAY[2]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[2]~23_combout\ = (\SW[3]~input_o\ & (!\SW[4]~input_o\ & ((\H2|DISPLAY[2]~3_combout\) # (!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \H2|DISPLAY[2]~3_combout\,
	datad => \SW[4]~input_o\,
	combout => \H2|DISPLAY[2]~23_combout\);

-- Location: LCCOMB_X116_Y28_N30
\H2|DISPLAY[1]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[1]~24_combout\ = (\SW[2]~input_o\ & ((\SW[3]~input_o\ & (!\SW[1]~input_o\ & !\SW[0]~input_o\)) # (!\SW[3]~input_o\ & ((\SW[0]~input_o\))))) # (!\SW[2]~input_o\ & (\SW[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \H2|DISPLAY[1]~24_combout\);

-- Location: LCCOMB_X116_Y28_N8
\H2|DISPLAY[1]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[1]~25_combout\ = (\H2|DISPLAY[1]~24_combout\ & ((\SW[0]~input_o\) # ((\SW[3]~input_o\ & !\SW[4]~input_o\)))) # (!\H2|DISPLAY[1]~24_combout\ & (\SW[0]~input_o\ & (\SW[3]~input_o\ $ (!\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \H2|DISPLAY[1]~24_combout\,
	datab => \SW[0]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H2|DISPLAY[1]~25_combout\);

-- Location: LCCOMB_X116_Y28_N6
\H2|DISPLAY[0]~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[0]~21_combout\ = (\SW[2]~input_o\ & (\SW[3]~input_o\ & (\SW[1]~input_o\ & !\SW[4]~input_o\))) # (!\SW[2]~input_o\ & (\SW[3]~input_o\ $ (((\SW[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H2|DISPLAY[0]~21_combout\);

-- Location: LCCOMB_X116_Y28_N0
\H2|DISPLAY[0]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H2|DISPLAY[0]~22_combout\ = (\H2|DISPLAY[0]~21_combout\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \H2|DISPLAY[0]~21_combout\,
	datad => \SW[0]~input_o\,
	combout => \H2|DISPLAY[0]~22_combout\);

-- Location: LCCOMB_X116_Y27_N28
\SHIFT0|OUTPUT[11]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[11]~10_combout\ = (\SW[3]~input_o\ & (!\SW[2]~input_o\ & !\SW[4]~input_o\)) # (!\SW[3]~input_o\ & (\SW[2]~input_o\ $ (\SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[11]~10_combout\);

-- Location: LCCOMB_X116_Y27_N22
\SHIFT0|OUTPUT[11]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[11]~11_combout\ = (\SHIFT0|OUTPUT[11]~10_combout\ & ((\SW[0]~input_o\) # ((\SW[1]~input_o\ & \SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SHIFT0|OUTPUT[11]~10_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[11]~11_combout\);

-- Location: LCCOMB_X116_Y27_N30
\SHIFT0|OUTPUT[9]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[9]~9_combout\ = (\SW[4]~input_o\ & ((\MUX0|OUTPUT[12]~0_combout\) # ((\SW[3]~input_o\) # (\SW[2]~input_o\)))) # (!\SW[4]~input_o\ & ((\SW[3]~input_o\ $ (!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX0|OUTPUT[12]~0_combout\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[9]~9_combout\);

-- Location: LCCOMB_X116_Y27_N12
\SHIFT0|OUTPUT[10]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|OUTPUT[10]~8_combout\ = (!\SW[4]~input_o\ & ((\SW[3]~input_o\) # (\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|OUTPUT[10]~8_combout\);

-- Location: LCCOMB_X116_Y27_N8
\H3|DISPLAY[6]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|DISPLAY[6]~0_combout\ = \SHIFT0|OUTPUT[10]~8_combout\ $ (((\SHIFT0|OUTPUT[11]~11_combout\ & !\SHIFT0|OUTPUT[9]~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[11]~11_combout\,
	datac => \SHIFT0|OUTPUT[9]~9_combout\,
	datad => \SHIFT0|OUTPUT[10]~8_combout\,
	combout => \H3|DISPLAY[6]~0_combout\);

-- Location: LCCOMB_X116_Y27_N18
\H3|Equal6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|Equal6~0_combout\ = (!\MUX0|OUTPUT[12]~0_combout\ & (!\SW[3]~input_o\ & (!\SW[2]~input_o\ & \SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MUX0|OUTPUT[12]~0_combout\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H3|Equal6~0_combout\);

-- Location: LCCOMB_X116_Y27_N20
\H3|DISPLAY[3]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|DISPLAY[3]~1_combout\ = \SHIFT0|OUTPUT[11]~11_combout\ $ (!\H3|Equal6~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SHIFT0|OUTPUT[11]~11_combout\,
	datad => \H3|Equal6~0_combout\,
	combout => \H3|DISPLAY[3]~1_combout\);

-- Location: LCCOMB_X116_Y27_N2
\SHIFT0|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SHIFT0|Equal0~0_combout\ = (\SW[3]~input_o\ & !\SW[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \SHIFT0|Equal0~0_combout\);

-- Location: LCCOMB_X116_Y27_N14
\H3|DISPLAY[2]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|DISPLAY[2]~2_combout\ = (\SHIFT0|OUTPUT[11]~11_combout\ & (\SHIFT0|Equal0~0_combout\ & (\SW[2]~input_o\))) # (!\SHIFT0|OUTPUT[11]~11_combout\ & ((\H3|Equal6~0_combout\) # ((\SHIFT0|Equal0~0_combout\ & \SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[11]~11_combout\,
	datab => \SHIFT0|Equal0~0_combout\,
	datac => \SW[2]~input_o\,
	datad => \H3|Equal6~0_combout\,
	combout => \H3|DISPLAY[2]~2_combout\);

-- Location: LCCOMB_X116_Y27_N0
\H3|DISPLAY[1]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|DISPLAY[1]~3_combout\ = (\SHIFT0|OUTPUT[11]~11_combout\ & (!\SHIFT0|OUTPUT[9]~9_combout\ & \SHIFT0|OUTPUT[10]~8_combout\)) # (!\SHIFT0|OUTPUT[11]~11_combout\ & (\SHIFT0|OUTPUT[9]~9_combout\ $ (!\SHIFT0|OUTPUT[10]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SHIFT0|OUTPUT[11]~11_combout\,
	datac => \SHIFT0|OUTPUT[9]~9_combout\,
	datad => \SHIFT0|OUTPUT[10]~8_combout\,
	combout => \H3|DISPLAY[1]~3_combout\);

-- Location: LCCOMB_X116_Y28_N10
\H3|DISPLAY[0]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|DISPLAY[0]~4_combout\ = (\SW[4]~input_o\ & ((\SW[2]~input_o\) # ((\SW[3]~input_o\) # (\SW[1]~input_o\)))) # (!\SW[4]~input_o\ & (\SW[2]~input_o\ $ ((!\SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H3|DISPLAY[0]~4_combout\);

-- Location: LCCOMB_X116_Y28_N20
\H3|DISPLAY[0]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H3|DISPLAY[0]~5_combout\ = (\H3|DISPLAY[0]~4_combout\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \H3|DISPLAY[0]~4_combout\,
	datad => \SW[0]~input_o\,
	combout => \H3|DISPLAY[0]~5_combout\);

-- Location: LCCOMB_X116_Y30_N0
\H4|DISPLAY[6]~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[6]~30_combout\ = \SW[0]~input_o\ $ (((\SW[1]~input_o\) # ((!\SW[4]~input_o\ & \SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \H4|DISPLAY[6]~30_combout\);

-- Location: LCCOMB_X116_Y30_N2
\H4|DISPLAY[6]~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[6]~31_combout\ = (\H4|DISPLAY[6]~30_combout\ & (((\SW[3]~input_o\) # (\SW[4]~input_o\)) # (!\SW[2]~input_o\))) # (!\H4|DISPLAY[6]~30_combout\ & (!\SW[2]~input_o\ & (!\SW[3]~input_o\ & \SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \H4|DISPLAY[6]~30_combout\,
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H4|DISPLAY[6]~31_combout\);

-- Location: LCCOMB_X116_Y27_N24
\H4|DISPLAY[3]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[3]~28_combout\ = \SW[4]~input_o\ $ (((\SW[3]~input_o\ & (!\SW[0]~input_o\)) # (!\SW[3]~input_o\ & ((\SW[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101101110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H4|DISPLAY[3]~28_combout\);

-- Location: LCCOMB_X116_Y27_N10
\H4|DISPLAY[3]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[3]~29_combout\ = (\SW[3]~input_o\ & ((\SW[1]~input_o\ & (!\SW[0]~input_o\)) # (!\SW[1]~input_o\ & ((\H4|DISPLAY[3]~28_combout\))))) # (!\SW[3]~input_o\ & ((\H4|DISPLAY[3]~28_combout\) # (\SW[0]~input_o\ $ (\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \H4|DISPLAY[3]~28_combout\,
	combout => \H4|DISPLAY[3]~29_combout\);

-- Location: LCCOMB_X116_Y30_N20
\H4|DISPLAY[2]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[2]~26_combout\ = (!\SW[0]~input_o\ & (!\SW[1]~input_o\ & ((\SW[4]~input_o\) # (!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \H4|DISPLAY[2]~26_combout\);

-- Location: LCCOMB_X116_Y30_N30
\H4|DISPLAY[2]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[2]~27_combout\ = (\H4|DISPLAY[2]~26_combout\ & ((\SW[4]~input_o\) # ((!\SW[2]~input_o\ & !\SW[3]~input_o\)))) # (!\H4|DISPLAY[2]~26_combout\ & (!\SW[2]~input_o\ & (!\SW[3]~input_o\ & \SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \H4|DISPLAY[2]~26_combout\,
	datab => \SW[2]~input_o\,
	datac => \SW[3]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H4|DISPLAY[2]~27_combout\);

-- Location: LCCOMB_X116_Y27_N4
\H4|DISPLAY[1]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[1]~24_combout\ = (\SW[3]~input_o\ & (\SW[0]~input_o\ & ((!\SW[4]~input_o\)))) # (!\SW[3]~input_o\ & (!\SW[2]~input_o\ & ((\SW[4]~input_o\) # (!\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H4|DISPLAY[1]~24_combout\);

-- Location: LCCOMB_X116_Y27_N6
\H4|DISPLAY[1]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[1]~25_combout\ = (\SW[0]~input_o\ & (\H4|DISPLAY[1]~24_combout\)) # (!\SW[0]~input_o\ & ((\H4|DISPLAY[1]~24_combout\ & ((\SW[4]~input_o\) # (!\SW[1]~input_o\))) # (!\H4|DISPLAY[1]~24_combout\ & (!\SW[1]~input_o\ & \SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110110001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \H4|DISPLAY[1]~24_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H4|DISPLAY[1]~25_combout\);

-- Location: LCCOMB_X116_Y28_N18
\H4|DISPLAY[0]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[0]~18_combout\ = (\SW[3]~input_o\ & (((\SW[1]~input_o\ & \SW[4]~input_o\)))) # (!\SW[3]~input_o\ & ((\SW[1]~input_o\) # (\SW[2]~input_o\ $ (\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[2]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \H4|DISPLAY[0]~18_combout\);

-- Location: LCCOMB_X116_Y28_N28
\H4|DISPLAY[0]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \H4|DISPLAY[0]~23_combout\ = (\H4|DISPLAY[0]~18_combout\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \H4|DISPLAY[0]~18_combout\,
	datad => \SW[0]~input_o\,
	combout => \H4|DISPLAY[0]~23_combout\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;
END structure;


