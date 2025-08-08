------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of decoder7
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity decoder7 is
	port (
		C       : in  STD_LOGIC_VECTOR(3 downto 0);
		DISPLAY : out STD_LOGIC_VECTOR(0 to 6)
	);
end decoder7;

architecture Behaviour of decoder7 is
	signal NUM : INTEGER;
begin
	NUM     <= TO_INTEGER(UNSIGNED(C));
	DISPLAY <= "0000001" when NUM = 0 else
		"1001111" when NUM = 1 else
		"0010010" when NUM = 2 else
		"0000110" when NUM = 3 else
		"1001100" when NUM = 4 else
		"0100100" when NUM = 5 else
		"0100000" when NUM = 6 else
		"0001111" when NUM = 7 else
		"0000000" when NUM = 8 else
		"0000100" when NUM = 9 else
		"1111111"; -- Blank
end Behaviour;