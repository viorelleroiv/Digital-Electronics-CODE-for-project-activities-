------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - Multiplexing the 7-seg output
-- VHDL code of shifter
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
	port (
		INPUT  : in  STD_LOGIC_VECTOR(0 to 14);
		SEL    : in  STD_LOGIC_VECTOR(2 downto 0);
		OUTPUT : out STD_LOGIC_VECTOR(0 to 14)
	);
end shifter;
architecture Behavior of shifter is
begin
	process (SEL, INPUT)
	begin
		if SEL = "000" then
			OUTPUT <= INPUT;
		elsif SEL = "001" then
			OUTPUT(3 to 14) <= INPUT(0 to 11);
			OUTPUT(0 to 2)  <= INPUT(12 to 14);
		elsif SEL = "010" then
			OUTPUT(6 to 14) <= INPUT(0 to 8);
			OUTPUT(0 to 5)  <= INPUT(9 to 14);
		elsif SEL = "011" then
			OUTPUT(9 to 14) <= INPUT(0 to 5);
			OUTPUT(0 to 8)  <= INPUT(6 to 14);
		elsif SEL = "100" then
			OUTPUT(12 to 14) <= INPUT(0 to 2);
			OUTPUT(0 to 11)  <= INPUT(3 to 14);
		else
			OUTPUT <= INPUT;
		end if;
	end process;
end Behavior;