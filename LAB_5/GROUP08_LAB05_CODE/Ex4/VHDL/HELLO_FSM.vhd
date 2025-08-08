------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity HELLO_FSM is
	port (
		CLK, RES                           : in  STD_LOGIC;               -- New state, Clock, and Reset
		OUT0, OUT1, OUT2, OUT3, OUT4, OUT5 : out STD_LOGIC_VECTOR(0 to 6) -- Register outputs
	);
end HELLO_FSM;

architecture structure of HELLO_FSM is

	component FSM is
	port (
		PULSE_1Hz, CLK, RES                           : in  STD_LOGIC;               -- New state, Clock, and Reset
		REG_DATA: out STD_LOGIC_VECTOR(0 to 6); -- Register outputs
		LOOP_EN: out std_logic
	);
	end component;

	component shiftRegn is
		generic
		(
			N     : INTEGER; -- Number of registers in cascade
			N_bit : INTEGER  -- Bit-width of each register
		);
		port (
			R                      : in  STD_LOGIC_VECTOR(0 to (N_bit - 1)); -- Shift register input
			CLK, RES, LD           : in  STD_LOGIC;                          -- Clock, Reset, and Load signals
			Q0, Q1, Q2, Q3, Q4, Q5 : out STD_LOGIC_VECTOR(0 to (N_bit - 1))  -- Register outputs
		);
	end component;

	component pulse1Hz is
		port (
			CLK, RES  : in  STD_LOGIC;
			PULSE_1Hz : out STD_LOGIC
		);
	end component;

	component mux7bit is
		port (
			IN0, IN1 : in  STD_LOGIC_VECTOR(0 to 6);
			SEL      : in  STD_LOGIC;
			OUT1     : out STD_LOGIC_VECTOR(0 to 6));
	end component;

	signal REG_FSMDATA, REG_IN                                           : STD_LOGIC_VECTOR(0 to 6);
	signal REG0_OUT, REG1_OUT, REG2_OUT, REG3_OUT, REG4_OUT, REG5_OUT : STD_LOGIC_VECTOR(0 to 6);
	signal PULSE_1Hz, LOOP_EN                                         : STD_LOGIC;

begin

FSM0: FSM
	port map(
		PULSE_1Hz =>PULSE_1Hz,
		CLK => CLK,
		RES => RES,
		REG_DATA => REG_FSMDATA,
		LOOP_EN => LOOP_EN
	);

	-- Shift register instantiation
	REG : shiftRegn
	generic
	map (
	N     => 6,
	N_bit => 7
	)
	port map(
		R   => REG_IN, -- Default input to shift register
		CLK => CLK,
		RES => RES,
		LD  => PULSE_1Hz,
		Q0  => REG0_OUT,
		Q1  => REG1_OUT,
		Q2  => REG2_OUT,
		Q3  => REG3_OUT,
		Q4  => REG4_OUT,
		Q5  => REG5_OUT
	);
	OUT0 <= REG0_OUT;
	OUT1 <= REG1_OUT;
	OUT2 <= REG2_OUT;
	OUT3 <= REG3_OUT;
	OUT4 <= REG4_OUT;
	OUT5 <= REG5_OUT;

	MUX : mux7bit
	port map(
		IN0  => REG_FSMDATA,
		IN1  => REG0_OUT,
		OUT1 => REG_IN,
		SEL  => LOOP_EN
	);

	PULSE_GEN : pulse1Hz
	port map(
		CLK       => CLK,
		RES       => RES,
		PULSE_1Hz => PULSE_1Hz
	);

end structure;
