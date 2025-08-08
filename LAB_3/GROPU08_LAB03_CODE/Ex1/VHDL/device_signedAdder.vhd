------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 1 - 4-bit ripple carry adder
-- VHDL code of DE1-SoC assignments
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity device_signedAdder is
	port (
		SW                                 : in  STD_LOGIC_VECTOR(7 downto 0); -- Switches 7 downto 0
		KEY                                : in  STD_LOGIC_VECTOR(1 downto 0); -- Key pushbuttons
		LEDR                               : out STD_LOGIC_VECTOR(9 downto 0); -- Led no. 9
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out STD_LOGIC_VECTOR(0 to 6)      -- 7-seg displays
	);
end device_signedAdder;

architecture structural of device_signedAdder is

	component signedAdder
		port (
			IN1, IN2       : in  SIGNED(3 downto 0); -- Numbers to be added (2's complement format)
			IN3, CLK, RESN : in  STD_LOGIC;          -- Input-carry, Clock and Clear (Clear is active-low)
			OUT1           : out SIGNED(3 downto 0); -- Sum result (2's complement format)
			OUT2           : out STD_LOGIC           -- Overflow flag
		);
	end component;

	component hexDecoder is
		port (
			IN1  : in  SIGNED(3 downto 0);       -- 2's complement input
			OUT1 : out STD_LOGIC_VECTOR(0 to 6); -- Digit output (modulus)
			OUT2 : out STD_LOGIC_VECTOR(0 to 6)  -- Sign digit
		);
	end component;

	-- Input carry always equal to '0'
	constant Cin : STD_LOGIC := '0';

	-- Sum result (signed)
	signal C     : SIGNED(3 downto 0);

begin
	DEV : signedAdder
	port map(signed(SW(3 downto 0)), signed(SW(7 downto 4)), Cin, KEY(1), KEY(0), C, LEDR(9));

	DEC0 : hexDecoder
	port map(signed(SW(3 downto 0)), HEX4, HEX5);

	DEC1 : hexDecoder
	port map(signed(SW(7 downto 4)), HEX2, HEX3);

	DEC2 : hexDecoder
	port map(C, HEX0, HEX1);

end structural;