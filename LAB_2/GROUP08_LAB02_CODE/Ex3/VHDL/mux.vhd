------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of multiplexer
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port (
		A1, A2 : in  STD_LOGIC;
		SEL    : in  STD_LOGIC;
		OUTPUT : out STD_LOGIC
	);
end mux;

architecture Structural of mux is
begin
	OUTPUT <= (A1 and not(SEL)) or (A2 and SEL);
end Structural;