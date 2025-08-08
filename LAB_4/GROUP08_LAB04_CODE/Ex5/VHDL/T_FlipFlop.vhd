------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 2 - 16-bit counter (structural)
-- VHDL code of T-type flip flop
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity T_FlipFlop is
	port (
		CLK : in  STD_LOGIC;
		CLR : in  STD_LOGIC; -- Active-low asynchronous clear input
		T   : in  STD_LOGIC;
		Q   : out STD_LOGIC
	);
end T_FlipFlop;

architecture behaviour of T_FlipFlop is

	signal t_tmp : STD_LOGIC;

begin
	process (CLR, clk)
	begin
		if (CLR = '0') then
			t_tmp <= '0';
		elsif (rising_edge(CLK)) then
			t_tmp <= T xor t_tmp;
		end if;
	end process;
	Q <= t_tmp;

end behaviour;