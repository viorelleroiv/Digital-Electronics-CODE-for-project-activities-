------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - Multiplexing the 7-seg output
-- VHDL code of decoder7
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- 7 segment display decoder
-- 000 -> H
-- 001 -> E
-- 010 -> L
-- 011 -> O
-- 100 -> C
-- 101 -> F
-- 110 -> P
-- 111 -> ' ' (blank)

entity decoder7 is
	port (
		C       : in  STD_LOGIC_VECTOR(2 downto 0); -- Input selector
		DISPLAY : out STD_LOGIC_VECTOR(0 to 6)      -- Output to display
	);
end decoder7;

architecture Behavior of decoder7 is
begin
	-- DISPLAY code depends on the C code
	DISPLAY <= "1001000" when C = "000" else 	 -- Letter H
		"0110000" when C = "001" else            -- Letter E
		"1110001" when C = "010" else            -- Letter L
		"0000001" when C = "011" else            -- Letter O
		"0110001" when C = "100" else            -- Letter C
		"0111000" when C = "101" else            -- Letter F
		"0011000" when C = "110" else            -- Letter P
		"1111111";                               -- Blank

end Behavior;