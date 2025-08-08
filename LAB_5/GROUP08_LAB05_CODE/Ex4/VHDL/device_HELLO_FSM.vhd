------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- Top-level entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity device_HELLO_FSM is
	port (
		CLOCK_50: in  STD_LOGIC;               -- New state, Clock, and Reset
		KEY: in STD_LOGIC_VECTOR(3 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out STD_LOGIC_VECTOR(0 to 6) -- Register outputs
	);
end device_HELLO_FSM;

architecture structure of device_HELLO_FSM is

component HELLO_FSM is
	port (
		CLK, RES                           : in  STD_LOGIC;               -- New state, Clock, and Reset
		OUT0, OUT1, OUT2, OUT3, OUT4, OUT5 : out STD_LOGIC_VECTOR(0 to 6) -- Register outputs
	);
end component;
begin
	U1: HELLO_FSM
	port map(
	CLK => CLOCK_50,
	RES => KEY(0),
	OUT0 => HEX5,
	OUT1 => HEX4,
	OUT2 => HEX3,
	OUT3 => HEX2,
	OUT4 => HEX1,
	OUT5 => HEX0
	);

end structure;
