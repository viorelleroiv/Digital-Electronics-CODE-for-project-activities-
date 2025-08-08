------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- VHDL code of 7-bit multiplexer
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux7bit is
	port (
		IN0, IN1: in STD_LOGIC_VECTOR(0 to 6);
		SEL : in  STD_LOGIC;
		OUT1          : out STD_LOGIC_VECTOR(0 to 6));
end mux7bit;

architecture stuctural of mux7bit is
begin
	OUT1(0) <= (IN0(0) and not(SEL)) or (IN1(0) and SEL);
	OUT1(1) <= (IN0(1) and not(SEL)) or (IN1(1) and SEL);
	OUT1(2) <= (IN0(2) and not(SEL)) or (IN1(2) and SEL);
	OUT1(3) <= (IN0(3) and not(SEL)) or (IN1(3) and SEL);
	OUT1(4) <= (IN0(4) and not(SEL)) or (IN1(4) and SEL);
	OUT1(5) <= (IN0(5) and not(SEL)) or (IN1(5) and SEL);
	OUT1(6) <= (IN0(6) and not(SEL)) or (IN1(6) and SEL);

end stuctural;
