------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- VHDL code of N-bits register
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regn is
	generic
		(N_bit : INTEGER);
	port (
		R             : in  STD_LOGIC_VECTOR(0 to (N_bit - 1));	-- Register input
		CLK, RES, LD : in  STD_LOGIC;			-- Clock and reset signals
		Q             : out STD_LOGIC_VECTOR(0 to (N_bit - 1)));	-- Register output
end regn;

architecture Behavior of regn is
begin
	process (CLK, RES, LD)
	begin
		if (RES = '0') then
			Q <= (others => '0');
		elsif (CLK'EVENT and CLK = '1') then
			if (LD = '1') then
				Q <= R;
			end if;
		end if;
	end process;
end Behavior;
