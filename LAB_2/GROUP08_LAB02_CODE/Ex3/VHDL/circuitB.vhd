------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of Circuit B
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity circuitB is
	port (
		input   : in  STD_LOGIC;
		Display : out STD_LOGIC_VECTOR(0 to 6)
	);
end circuitB;

architecture Behavior of circuitB is
begin
	process (INPUT)
	begin
		if INPUT = '1' then
			DISPLAY <= "1001111";
		else
			DISPLAY <= "1111111";
		end if;
	end process;
end Behavior;