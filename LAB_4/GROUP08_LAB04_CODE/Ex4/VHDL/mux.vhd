------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3 - 4-bit ripple carry adder
-- VHDL code of multiplexer
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port (
		IN0, IN1, SEL : in  STD_LOGIC;
		OUT1          : out STD_LOGIC);
end mux;

architecture stuctural of mux is
begin
	OUT1 <= (IN0 and not(SEL)) or (IN1 and SEL);

end stuctural;
