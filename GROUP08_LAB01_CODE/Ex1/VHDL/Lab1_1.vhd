------------------------------------
-- Group 8 - Laboratory 1
-- Exercise 1 - Controlling the LEDs
-- VHDL code of part1
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- Simple module that connects
-- the SW switches to the LEDR lights

entity part1 is
	port (
		SW   : in  STD_LOGIC_VECTOR(9 downto 0);
		LEDR : out STD_LOGIC_VECTOR(9 downto 0)); -- red LEDs
end part1;

architecture Behavior of part1 is
begin
	LEDR <= SW;
end Behavior;