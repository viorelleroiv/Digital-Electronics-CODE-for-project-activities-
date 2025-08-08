------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 3 - 16-bit counter (behavioural)
-- VHDL code of 16-bit counter
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity counter16bit_behav is
	port (
		EN, CLK, CLR : in  STD_LOGIC;
		COUNT        : out STD_LOGIC_VECTOR(15 downto 0)
	);
end counter16bit_behav;

architecture behaviour of counter16bit_behav is

	signal C: UNSIGNED(15 downto 0);
begin
	process(CLK, EN, CLR)
	begin
		if (CLR = '0') then
			C <= "0000000000000000";
		else
			if (rising_edge(CLK) and (EN = '1')) then
				C <= C+1;
			end if;
		end if;
	end process;
	COUNT <= std_logic_vector(C);

end behaviour;