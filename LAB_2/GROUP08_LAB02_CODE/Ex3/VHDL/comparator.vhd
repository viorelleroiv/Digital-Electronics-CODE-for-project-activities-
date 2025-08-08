------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of Comparator
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity comparator is
	port (
		INPUT  : in  STD_LOGIC_VECTOR(3 downto 0);
		OUTPUT : out STD_LOGIC
	);
end comparator;

architecture Behavior of comparator is
	signal NUM : INTEGER;
begin
	NUM <= to_integer(unsigned(INPUT));
	process (NUM)
	begin
		if NUM > 9 then
			OUTPUT <= '1';
		else
			OUTPUT <= '0';
		end if;
	end process;
end Behavior;