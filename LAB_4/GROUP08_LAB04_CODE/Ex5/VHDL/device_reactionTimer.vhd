------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 5 - 16-bit counter (structural)
-- VHDL code of T-type flip flop
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity device is
	port (
		CLOCK_50: in std_logic;
		SW: in STD_LOGIC_VECTOR(7 downto 0);
		KEY: in STD_LOGIC_VECTOR( 3 downto 0);
		HEX0, HEX1, HEX2, HEX3: out STD_LOGIC_VECTOR(0 to 6);
		LEDR: out STD_LOGIC_VECTOR(9 downto 0)
	);
end device;

architecture behaviour of device is

component reactionTimer is
	port (
		STOP, CLK, RST : in STD_LOGIC;
		IN1            : in STD_LOGIC_VECTOR(7 downto 0);
		COUNT          : out STD_LOGIC_VECTOR(15 downto 0);
		OUT1: out STD_LOGIC
	);
end component;

component BCD_converter is port (
	number : in STD_LOGIC_VECTOR(15 downto 0);
	OUT3, OUT2, OUT1, OUT0 : out STD_LOGIC_VECTOR(3 downto 0));
end component;


component hexDecoder is
	port (
		IN1       : in  STD_LOGIC_VECTOR(3 downto 0);		-- 4-bit input
		OUT1 : out STD_LOGIC_VECTOR(0 to 6)						-- Hexadecimal output
	);
end component;

signal A: std_logic_vector(15 downto 0);
signal thousand, hundred, ten, unit: std_logic_vector(3 downto 0);

begin

uut: reactionTimer
		port map(
		STOP => KEY(3),
		CLK => CLOCK_50,
		RST => KEY(0),
		IN1 => SW,
		COUNT => A,
		OUT1 => LEDR(0)
		);

	CONV: BCD_converter
	port map(
		number => A,
		OUT3 => thousand,
		OUT2 => hundred,
		OUT1 => ten,
		OUT0 => unit
		);
		
	 
	 DEC0: hexDecoder
		Port map(
        IN1 => thousand,
        OUT1 => HEX3
    );
	 DEC1: hexDecoder
		Port map(
        IN1 => hundred,
        OUT1 => HEX2
    );
	 DEC2: hexDecoder
		Port map(
        IN1 => ten,
        OUT1 => HEX1
    );
	 DEC3: hexDecoder
		Port map(
        IN1 => unit,
        OUT1 => HEX0
    );


end behaviour;