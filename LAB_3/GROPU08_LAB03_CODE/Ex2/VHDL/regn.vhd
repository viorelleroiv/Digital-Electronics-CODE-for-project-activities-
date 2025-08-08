------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder
-- VHDL code of 4-bits register
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regn is
	generic
		(N : INTEGER := 4);
	port (
		R             : in  SIGNED(N - 1 downto 0);	-- Register input
		Clock, Resetn : in  STD_LOGIC;			-- Clock and reset signals
		Q             : out SIGNED(N - 1 downto 0));	-- Register output
end regn;

architecture Behavior of regn is
begin
	process (Clock, Resetn)
	begin
		if (Resetn = '0') then
			Q <= (others => '0');
		elsif (Clock'EVENT and Clock = '1') then
			Q <= R;
		end if;
	end process;
end Behavior;
