------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 2 - 16-bit counter (structural)
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity device_counter16bit is
	port (
		SW                     : in  STD_LOGIC_VECTOR(9 downto 0);
		KEY                    : in  STD_LOGIC_VECTOR(3 downto 0);
		HEX0, HEX1, HEX2, HEX3 : out STD_LOGIC_VECTOR(0 to 6)
	);
end device_counter16bit;

architecture structure of device_counter16bit is

	component counter16bit is
		port (
			EN, CLK, CLR : in  STD_LOGIC;
			COUNT        : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component hexDecoder is
		port (
			IN1  : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input
			OUT1 : out STD_LOGIC_VECTOR(0 to 6) -- Hexadecimal output
		);
	end component;
	
	signal COUNT: STD_LOGIC_VECTOR(15 downto 0);
	
begin
	CNT16 : counter16bit
	port map(
		EN    => SW(1),
		CLK   => KEY(0),
		CLR   => SW(0),
		COUNT => COUNT
	);

	DEC0 : hexDecoder
	port map(
		IN1  => COUNT(3 downto 0),
		OUT1 => HEX0
	);
	
	DEC1 : hexDecoder
	port map(
		IN1  => COUNT(7 downto 4),
		OUT1 => HEX1
	);
	
	DEC2 : hexDecoder
	port map(
		IN1  => COUNT(11 downto 8),
		OUT1 => HEX2
	);
	
	DEC3 : hexDecoder
	port map(
		IN1  => COUNT(15 downto 12),
		OUT1 => HEX3
	);

end structure;