------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 1 - One-hot FSM
-- VHDL code of FSM (main entity)
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity sequenceDetector is
	port (
		W, CLK, RESN : in  STD_LOGIC;
		Z            : out STD_LOGIC);
end sequenceDetector;

architecture structure of sequenceDetector is

	component flipflop is
		port (
		D, Clock, Resetn : in  STD_LOGIC;  -- D input, clock and reset signals
		Q                        : out STD_LOGIC); -- Q output of FF
	end component;

	signal X, Y         : STD_LOGIC_VECTOR(8 downto 0);
begin

	-- CC1 sub-circuit
	Y(0) <= not (RESN);
	Y(1) <= not(W) and (X(0) or X(5) or X(6) or X(7) or X(8)) and RESN;
	Y(2) <= not(W) and X(1) and RESN;
	Y(3) <= not(W) and X(2) and RESN;
	Y(4) <= not(W) and (X(3) or X(4)) and RESN;
	Y(5) <= W and (X(0) or X(1) or X(2) or X(3) or X(4)) and RESN;
	Y(6) <= W and X(5) and RESN;
	Y(7) <= W and X(6) and RESN;
	Y(8) <= W and (X(7) or X(8)) and RESN;

	-- Flipflop generation
	ff_generator : for i in 0 to 8 generate
		FF : flipflop
		port map(
			D      => Y(i),
			Clock  => CLK,
			Resetn => '1',
			Q      => X(i));
	end generate ff_generator;

	-- CC2 sub-circuit
	Z <= X(4) or X(8);
end structure;
