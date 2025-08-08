------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3.2 - 16-bit ripple carry 
-- adder with carry bypass
--
-- VHDL code of 4-bit ripple carry adder
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rippleCarryAdder4bit is
	port (
		A1, A2 : in  SIGNED(3 downto 0); -- Numbers to be added
		CIN    : in  STD_LOGIC;          -- Input carry
		B1     : out SIGNED(3 downto 0); -- Sum result
		COUT    : out STD_LOGIC           -- Output carry
	);
end rippleCarryAdder4bit;

architecture Behavior of rippleCarryAdder4bit is

	component fullAdder is
		port (
			A, B, CI : in  STD_LOGIC;  -- Input A, B and input-carry
			S, Cout  : out STD_LOGIC); -- Sum result, output-carry
	end component;

	signal C1, C2, C3 : STD_LOGIC; -- Intermediate carries
begin
	FA0 : fullAdder
	port map(A1(0), A2(0), CIN, B1(0), C1);

	FA1 : fullAdder
	port map(A1(1), A2(1), C1, B1(1), C2);

	FA2 : fullAdder
	port map(A1(2), A2(2), C2, B1(2), C3);

	FA3 : fullAdder
	port map(A1(3), A2(3), C3, B1(3), COUT);
end Behavior;
