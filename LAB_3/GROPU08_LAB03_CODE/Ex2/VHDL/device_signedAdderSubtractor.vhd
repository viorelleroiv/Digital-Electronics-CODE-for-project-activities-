------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder
-- VHDL code of device assignments
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity device_signedAdderSubtractor is
	port (
		SW       : in  STD_LOGIC_VECTOR(8 downto 0);
		KEY : in  STD_LOGIC_VECTOR(1 downto 0);
		LEDR          : out STD_LOGIC_VECTOR(9 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5           : out STD_LOGIC_VECTOR(0 to 6)
	);
end device_signedAdderSubtractor;

architecture Behavior of device_signedAdderSubtractor is

	component signedAdderSubtractor
	port (
		IN1, IN2       : in  SIGNED(3 downto 0);
		IN3, CLK, RESN : in  STD_LOGIC;
		OUT1           : out SIGNED(3 downto 0);
		OUT2           : out STD_LOGIC
	);
	end component;

	component hexDecoder is
		port (
		IN1       : in  SIGNED(3 downto 0);		-- 2's complement input
		OUT1 : out STD_LOGIC_VECTOR(0 to 6);	-- Digit output (magnitude)
		OUT2: out STD_LOGIC_VECTOR(0 to 6)		-- Sign digit
	);
	end component;
	
	signal C: SIGNED(3 downto 0);
	
begin
	DEV : signedAdderSubtractor
	port map(signed(SW(3 downto 0)), signed(SW(7 downto 4)), SW(8), KEY(1), KEY(0), C, LEDR(9));
	DEC0 : hexDecoder
	port map(signed(SW(3 downto 0)), HEX4, HEX5);
	DEC1 : hexDecoder
	port map(signed(SW(7 downto 4)), HEX2, HEX3);
	DEC2 : hexDecoder
	port map(C, HEX0, HEX1);
	
end Behavior;