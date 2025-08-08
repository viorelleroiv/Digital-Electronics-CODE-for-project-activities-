------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 4 - 4-bit ripple carry adder
-- VHDL code of decoder
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity hexDecoder is
	port (
		IN1       : in  STD_LOGIC_VECTOR(3 downto 0);		-- 4-bit input
		OUT1 : out STD_LOGIC_VECTOR(0 to 6)						-- Hexadecimal output
	);
end hexDecoder;

architecture Behavior of hexDecoder is
begin
	
	OUT1 <=  "0000001" WHEN IN1 = "0000" ELSE    -- 0
        "1001111" WHEN IN1 = "0001" ELSE    -- 1
        "0010010" WHEN IN1 = "0010" ELSE    -- 2
        "0000110" WHEN IN1 = "0011" ELSE    -- 3
        "1001100" WHEN IN1 = "0100" ELSE    -- 4
        "0100100" WHEN IN1 = "0101" ELSE    -- 5
        "0100000" WHEN IN1 = "0110" ELSE    -- 6
        "0001111" WHEN IN1 = "0111" ELSE    -- 7
        "0000000" WHEN IN1 = "1000" ELSE    -- 8
        "0000100" WHEN IN1 = "1001" ELSE    -- 9
        "1111111";                     

end Behavior;