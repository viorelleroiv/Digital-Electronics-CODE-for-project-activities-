------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder/subtractor
-- VHDL code of full adder
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
	port (
		A, B, P, CIN : in  STD_LOGIC; -- Input A, B, RCA mode and input-carry
		S, Cout      : out STD_LOGIC  -- Sum result, output-carry
	);
end fullAdder;

architecture stuctural of fullAdder is

	component mux is
		port (
			IN0, IN1, SEL : in  STD_LOGIC;  -- Input signals and selection signal
			OUT1          : out STD_LOGIC); -- Output signal
	end component;
	-- Full-adder input B and mux selection signal
	signal B2, SEL : STD_LOGIC;
begin
	B2 <= B xor P;

	MUX0 : mux
	port map(B2, CIN, SEL, Cout);

	SEL <= A xor B2;
	S   <= CIN xor SEL;

end stuctural;
