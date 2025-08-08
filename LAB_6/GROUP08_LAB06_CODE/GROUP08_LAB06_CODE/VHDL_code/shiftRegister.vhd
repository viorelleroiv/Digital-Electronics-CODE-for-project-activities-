------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of shift register
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftRegn is
	generic (
		N_bit : INTEGER -- Bit-width of each register
	);
	port (
		R              : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0); -- Shift register input
		CLK, RES, LD   : in  STD_LOGIC;                              -- Clock, Reset, and Load signals
		Q0, Q1, Q2, Q3 : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)  -- Register output

	);
end shiftRegn;

architecture structure of shiftRegn is

	component regn is
		generic (
			N_bit : INTEGER
		);
		port (
			R            : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0); -- Register input
			CLK, RES, LD : in  STD_LOGIC;                              -- Clock, Reset, and Load signals
			Q            : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)  -- Shift register output
		);
	end component;

	-- Signal for intermediate values between registers
	type intermediateValue is array(0 to 4) of STD_LOGIC_VECTOR((N_bit - 1) downto 0);
	signal int_value : intermediateValue;

begin

	-- Generate multiple registers in a chain to implement the shift register
	regn_generate : for i in 0 to 3 generate
		REG : regn
		generic map(
			N_bit => N_bit
		)
		port map(
			R   => int_value(i), -- Input connected to previous register output
			CLK => CLK,
			RES => RES,
			LD  => LD,
			Q   => int_value(i + 1) -- Output passed to the next register in the chain
		);
	end generate regn_generate;

	-- Connect the input and output signals
	int_value(0) <= R;
	Q0           <= int_value(1);
	Q1           <= int_value(2);
	Q2           <= int_value(3);
	Q3           <= int_value(4);
end structure;
