------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 2 - 4-bit ripple carry adder
-- VHDL code of D-type flip flop
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	port (
		D, Clock, Resetn : in  STD_LOGIC;  -- D input, clock and reset signals
		Q                        : out STD_LOGIC); -- Q output of FF
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