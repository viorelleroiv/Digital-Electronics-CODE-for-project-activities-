------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 4 - Array multiplier
-- VHDL code of full-adder
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
	port (
		A, B, CI : in  STD_LOGIC; -- Input A, B and input-carry
		S, Cout  : out STD_LOGIC  -- Sum result, output-carry
	);
end fullAdder;

architecture structural of fullAdder is

	component mux is
		port (
			IN0, IN1, SEL : in  STD_LOGIC;  -- Input signals and selection signal
			OUT1          : out STD_LOGIC); -- Output signal
	end component;

	signal SEL : STD_LOGIC; -- Mux selection signal
begin
	-- 2-to-1 multiplexer
	MUX0 : mux
	port map(B, CI, SEL, Cout);

	SEL <= A xor B;
	S   <= CI xor SEL;

end structural;
