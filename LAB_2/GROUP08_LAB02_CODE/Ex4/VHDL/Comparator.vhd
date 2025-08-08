------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 4 - BIN to BCD converter
-- VHDL code of Comparator
------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity comparator is
	port (
		in_c  : in  STD_LOGIC_VECTOR(5 downto 0); -- input  6 bit; MSB = in_c(5)
		out_c : out STD_LOGIC_VECTOR(2 downto 0)  -- out 3 bit: (tens digit)
	);
end comparator;

architecture behavioural of comparator is
begin
	process (in_c)
	begin
		-- Direct comparisons: it is assumed that the "<" operator on std_logic_vector (with order 5 downto 0)
		-- works in a "lexicographic" way consistent with the numerical order, in fact there is a correspondence between MSBs.
		if in_c < "001010" then     -- in_c < 10 decimal the comparison considers 00 in MSB position
			out_c <= "000";             -- tens 0
		elsif in_c < "010100" then  -- 10 <= in_c < 20
			out_c <= "001";             -- 0 is the bit in position 2
		elsif in_c < "011110" then  -- 20 <= in_c < 30
			out_c <= "010";             -- tens 2
		elsif in_c < "101000" then  -- 30 <= in_c < 40
			out_c <= "011";             -- tens 3 is the bit in position 2
		elsif in_c < "110010" then  -- 40 <= in_c < 50
			out_c <= "100";             -- tens 4
		elsif in_c < "111100" then  -- 50 <= in_c < 60
			out_c      <= "101";        -- tens 5
		elsif in_c <= "111111" then -- in_c <= 60
			out_c      <= "110";        -- tens 6
		else
			out_c <= "111"; --error
		end if;
	end process;
end behavioural;
