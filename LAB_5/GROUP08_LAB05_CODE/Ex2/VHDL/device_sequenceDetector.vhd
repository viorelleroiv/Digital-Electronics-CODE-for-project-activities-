------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 1 - One-hot FSM
-- VHDL code of device_sequence detector
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity device_sequenceDetector is
	port (
	SW   : in  STD_LOGIC_VECTOR(9 downto 0); -- D input, clock and reset signals
	LEDR : out STD_LOGIC_VECTOR(9 downto 0); -- D input, clock and reset signals
	KEY  : in  STD_LOGIC_VECTOR(3 downto 0));
end device_sequenceDetector;

architecture structure of device_sequenceDetector is

	component sequenceDetector is
		port (
			W, CLK, RESN : in  STD_LOGIC;  -- D input, clock and reset signals
			Z            : out STD_LOGIC); -- Q output of FF
	end component;

begin

	U1: sequenceDetector
	port map(
		W    => SW(1),
		CLK  => KEY(0),
		RESN => SW(0),
		Z    => LEDR(0));

end structure;