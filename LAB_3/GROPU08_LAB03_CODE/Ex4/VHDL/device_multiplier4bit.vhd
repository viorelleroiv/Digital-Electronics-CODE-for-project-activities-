------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 4 - 4-bit multiplier
-- VHDL code of device assignments
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity device_multiplier4bit is
	port (
		SW       : in  STD_LOGIC_VECTOR(7 downto 0);
		HEX0, HEX1, HEX3, HEX5           : out STD_LOGIC_VECTOR(0 to 6)
	);
end device_multiplier4bit;

architecture Behavior of device_multiplier4bit is

	component multiplier4bit
	port (
		IN1, IN2 : in  STD_LOGIC_VECTOR(3 downto 0);	-- Input values
		OUT1     : out STD_LOGIC_VECTOR(7 downto 0)	-- Output value
	);
	end component;

	component hexDecoder is
		port (
		IN1       : in  STD_LOGIC_VECTOR(3 downto 0);		-- 4-bit input
		OUT1 : out STD_LOGIC_VECTOR(0 to 6)						-- Hexadecimal output
	);
	end component;
	
	signal PROD: STD_LOGIC_VECTOR(7 downto 0);
begin
	MUL : multiplier4bit
	port map(SW(3 downto 0), SW(7 downto 4), PROD);
	DEC0 : hexDecoder
	port map(SW(3 downto 0), HEX5);
	DEC1 : hexDecoder
	port map(SW(7 downto 4), HEX3);
	DEC2 : hexDecoder
	port map(PROD(7 downto 4), HEX1);
	DEC3 : hexDecoder
	port map(PROD(3 downto 0), HEX0);
	
end Behavior;