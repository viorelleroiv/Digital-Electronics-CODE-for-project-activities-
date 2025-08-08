------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 4 - Digit flashing
-- VHDL code of elementary counter
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity elemCounter is
	port (
		prev_Q, prev_A : in  STD_LOGIC; -- Input signals: Enable, Clock and Clear (CLR is active-low)
		next_Q, next_A : out STD_LOGIC; -- Output signal
		CLK, CLR       : in  STD_LOGIC;
		LD, P          : in  STD_LOGIC
	);
end elemCounter;

architecture structure of elemCounter is

	component flipflop is
		port (
			D, Clock, Resetn : in  STD_LOGIC;
			Q                : out STD_LOGIC);
	end component;

	component mux is
		port (
			IN0, IN1, SEL : in  STD_LOGIC;
			OUT1          : out STD_LOGIC);
	end component;

	signal FF_OUT, FF_OUT_NEG : STD_LOGIC;
	signal MUX0_OUT, D, SEL0  : STD_LOGIC;

begin

	DFF : flipflop
	port map(
		D      => D,
		Clock  => CLK,
		Resetn => CLR,
		Q      => FF_OUT
	);

	MUX0 : mux
	port map(
		IN0  => FF_OUT,
		IN1  => FF_OUT_NEG,
		SEL  => SEL0,
		OUT1 => MUX0_OUT
	);

	MUX1 : mux
	port map(
		IN0  => MUX0_OUT,
		IN1  => P,
		SEL  => LD,
		OUT1 => D
	);

	FF_OUT_NEG <= not FF_OUT;
	SEL0       <= prev_Q and prev_A;
	next_Q     <= FF_OUT;
	next_A     <= SEL0;
end structure;
