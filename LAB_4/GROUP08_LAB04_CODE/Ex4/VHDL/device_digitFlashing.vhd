------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 4 - Digit flashing
-- VHDL code of device entity (top-entity)
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity device_digitFlashing is
	port (
		CLOCK_50 : in  STD_LOGIC;
		KEY      : in  STD_LOGIC_VECTOR(3 downto 0);
		HEX0     : out STD_LOGIC_VECTOR(0 to 6)
	);
end device_digitFlashing;

architecture structure of device_digitFlashing is

	component digitFlashing is
		port (
			IN1, CLR : in  STD_LOGIC;                   -- Input signal: (will be conected to 50 MHz clock)
			OUT1     : out STD_LOGIC_VECTOR(3 downto 0) -- Output signal: 4-bit binary value in range 0 to 9 (in decimal)
		);
	end component;

	component hexDecoder is
		port (
			IN1  : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input
			OUT1 : out STD_LOGIC_VECTOR(0 to 6)      -- Decimal output
		);
	end component;

	signal DEC_INPUT : STD_LOGIC_VECTOR(3 downto 0);

begin

	U1 : digitFlashing
	port map(
		IN1  => CLOCK_50,
		CLR  => KEY(0),
		OUT1 => DEC_INPUT
	);

	DEC : hexDecoder

	port map(
		IN1  => DEC_INPUT,
		OUT1 => HEX0
	);

end structure;