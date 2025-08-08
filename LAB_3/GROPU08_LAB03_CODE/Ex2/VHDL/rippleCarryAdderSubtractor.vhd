---------------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder/subtractor
-- VHDL code of ripple carry adder/subtractor
---------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rippleCarryAdderSubtractor is
	port (
		A1, A2 : in  SIGNED(3 downto 0); -- Numbers to be added
		P      : in  STD_LOGIC;          -- RCA mode
		B1     : out SIGNED(3 downto 0); -- Sum result
		COUT   : out STD_LOGIC           -- Output carry
	);
end rippleCarryAdderSubtractor;

architecture structural of rippleCarryAdderSubtractor is
	component fullAdder is
		port (
			A, B, P, CIN : in  STD_LOGIC; -- Input A, B, RCA mode and input-carry
			S, Cout      : out STD_LOGIC  -- Sum result, output-carry
		);
	end component;

	signal C1, C2, C3 : STD_LOGIC; -- Intermediate carries
begin
	FA0 : fullAdder
	port map(A1(0), A2(0), P, P, B1(0), C1);

	FA1 : fullAdder
	port map(A1(1), A2(1), P, C1, B1(1), C2);

	FA2 : fullAdder
	port map(A1(2), A2(2), P, C2, B1(2), C3);

	FA3 : fullAdder
	port map(A1(3), A2(3), P, C3, B1(3), COUT);
end structural;
