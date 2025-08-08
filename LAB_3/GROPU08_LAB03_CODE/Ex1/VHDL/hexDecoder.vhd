------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 1 - 4-bit ripple carry adder
-- VHDL code of decoder for 4-bit signed numbers (-8 to 7)
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity hexDecoder is
	port (
		IN1  : in  SIGNED(3 downto 0);       -- 2's complement input
		OUT1 : out STD_LOGIC_VECTOR(0 to 6); -- Digit output (modulus)
		OUT2 : out STD_LOGIC_VECTOR(0 to 6)  -- Sign digit
	);
end hexDecoder;

architecture dataflow of hexDecoder is
	signal IN1_STD : STD_LOGIC_VECTOR(3 downto 0); -- Input in std_logic
begin

	IN1_STD <= STD_LOGIC_VECTOR(IN1);

	-- Digit output (magnitude)
	OUT1    <= "0000001" when IN1_STD = "0000" else              -- 0
		"1001111" when (IN1_STD = "0001") or (IN1_STD = "1111") else -- 1
		"0010010" when (IN1_STD = "0010") or (IN1_STD = "1110") else -- 2
		"0000110" when (IN1_STD = "0011") or (IN1_STD = "1101") else -- 3
		"1001100" when (IN1_STD = "0100") or (IN1_STD = "1100") else -- 4
		"0100100" when (IN1_STD = "0101") or (IN1_STD = "1011") else -- 5
		"0100000" when (IN1_STD = "0110") or (IN1_STD = "1010") else -- 6
		"0001111" when (IN1_STD = "0111") or (IN1_STD = "1001") else -- 7
		"0000000" when IN1_STD = "1000" else                         -- 8
		"1111111";                                                   -- Blank

	-- Sign digit
	OUT2 <= "1111110" when IN1(3) = '1' else
		"1111111";

end dataflow;