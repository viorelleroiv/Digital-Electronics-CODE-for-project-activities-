------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- VHDL code of testbenhc
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity HELLO_FSM_tb is
end HELLO_FSM_tb;

architecture behaviour of HELLO_FSM_tb is

	component HELLO_FSM is
	port (
		CLK, RES                           : in  STD_LOGIC;               -- New state, Clock, and Reset
		OUT0, OUT1, OUT2, OUT3, OUT4, OUT5 : out STD_LOGIC_VECTOR(0 to 6) -- Register outputs
	);
end component;

	signal OUT0, OUT1, OUT2, OUT3, OUT4, OUT5 : STD_LOGIC_VECTOR(0 to 6);
	signal CLK, RES              : STD_LOGIC;
begin

	clocl_gen: process
		begin
			CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
			wait for 20 ns;
		end process;
	process
	begin
	RES <= '0';
	wait for 5 ns;
	RES <= '1';
	wait;
	end process;

	UUT : HELLO_FSM
	port map(
		CLK    => CLK,
		RES    => RES,
		OUT0   => OUT0,
		OUT1   => OUT1,
		OUT2   => OUT2,
		OUT3   => OUT3,
		OUT4   => OUT4,
		OUT5   => OUT5);
end behaviour;
