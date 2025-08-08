------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - 7 segment decoder
-- VHDL code of decoder7
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Assignment table
-- 000 -> H
-- 001 -> E
-- 010 -> L
-- 011 -> O
-- else -> ' ' (blank)

entity decoder7 is
	port (
		SW   : in  STD_LOGIC_VECTOR(2 downto 0); -- Input: switches #0 to #2
		HEX0 : out STD_LOGIC_VECTOR(0 to 6)      -- Output: 7 segment display #0
	);
end decoder7;

architecture Behavior of decoder7 is
begin
	-- HEX0 code depends on the SW code
	HEX0 <= "1001000" when SW = "000" else	-- Letter H
		"0110000" when SW = "001" else 	-- Letter E
		"1110001" when SW = "010" else 	-- Letter L
		"0000001" when SW = "011" else 	-- Letter O
		"1111111";                     	-- Blank

end Behavior;
