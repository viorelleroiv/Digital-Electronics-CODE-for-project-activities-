------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- 
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftRegn is
	generic
	(
		N     : INTEGER; -- Number of registers in cascade
		N_bit : INTEGER  -- Bit-width of each register
	);
	port (
		R                      : in  STD_LOGIC_VECTOR(0 to (N_bit - 1)); -- Shift register input
		CLK, RES, LD           : in  STD_LOGIC;                            -- Clock, Reset, and Load signals
		Q0, Q1, Q2, Q3, Q4, Q5 : out STD_LOGIC_VECTOR(0 to (N_bit - 1))  -- Register output

	);
end shiftRegn;

architecture structure of shiftRegn is

	component regn is
		generic
		(
			N_bit : INTEGER
		);
		port (
			R            : in  STD_LOGIC_VECTOR(0 to (N_bit - 1)); -- Register input
			CLK, RES, LD : in  STD_LOGIC;                            -- Clock, Reset, and Load signals
			Q            : out STD_LOGIC_VECTOR(0 to (N_bit - 1))  -- Shift register output
		);
	end component;

	-- Signal for intermediate values between registers
	type intermediateValue is array(0 to N) of STD_LOGIC_VECTOR(0 to (N_bit - 1));
	signal int_value : intermediateValue;

begin

	regn_generate : for i in 0 to (N - 1) generate
		REG : regn
		generic
		map (
		N_bit => N_bit
		)
		port map(
			R   => int_value(i),
			CLK => CLK,
			RES => RES,
			LD  => LD,
			Q   => int_value(i + 1)
		);
	end generate regn_generate;

	int_value(0) <= R;
	Q5 <= int_value(1);
	Q4 <= int_value(2);
	Q3 <= int_value(3);
	Q2 <= int_value(4);
	Q1 <= int_value(5);
	Q0 <= int_value(6);
end structure;
