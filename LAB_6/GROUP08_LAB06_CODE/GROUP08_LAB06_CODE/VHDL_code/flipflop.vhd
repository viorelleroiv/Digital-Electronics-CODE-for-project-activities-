------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of flip-flop
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	port (
		D, Clock, Resetn : in  STD_LOGIC;
		Q                : out STD_LOGIC);
end flipflop;

architecture Behavior of flipflop is
begin
	process (Clock, Resetn)
	begin
		if (Resetn = '0') then -- asynchronous clear 
			Q <= '0';
		elsif (Clock'EVENT and Clock = '1') then
			Q <= D;
		end if;
	end process;
end Behavior;