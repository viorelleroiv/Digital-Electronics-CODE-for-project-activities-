------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 4 - BIN to BCD converter
-- VHDL code of Circuit B
------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_b is
	port (
		in_b  : in  STD_LOGIC_VECTOR(2 downto 0); -- takes values of comaprator that are at the same written as 2 down to 0
		EOX_1 : out STD_LOGIC_VECTOR(0 to 6)      -- bit 6 MSB; active low
	);
end circuit_b;

architecture behavioural of circuit_b is
begin
	process (in_b)
	begin
		if in_b = "000" then    -- 0
			EOX_1 <= "0000001";     -- Segments: a, b, c, d, e, f on ; g off
		elsif in_b = "001" then -- 1
			EOX_1 <= "1001111";     -- Segments: b e c on
		elsif in_b = "010" then -- 2
			EOX_1 <= "0010010";     -- Segments: a, b, d, e, g on
		elsif in_b = "011" then -- 3
			EOX_1 <= "0000110";     -- Segments: a, b, c, d, g on
		elsif in_b = "100" then -- 4
			EOX_1 <= "1001100";     -- Segments: b, c, f, g on
		elsif in_b = "101" then -- 5
			EOX_1 <= "0100100";     -- Segments: a, c, d, f, g on
		elsif in_b = "110" then -- 6
			EOX_1 <= "0100000";     -- Segments: a, c, d, e, f, g on
		else
			EOX_1 <= "1111111"; -- for invalid values all the segments are turned off
		end if;
	end process;
end behavioural;
