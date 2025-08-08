------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Part3 is
	port (
		SW         : in  STD_LOGIC_VECTOR(3 downto 0);
		HEX0, HEX1 : out STD_LOGIC_VECTOR(0 to 6)
	);
end Part3;

architecture Behavior of Part3 is
	component mux is
		port (
			A1, A2 : in  STD_LOGIC;
			sel    : in  STD_LOGIC;
			output : out STD_LOGIC
		);
	end component;

	component comparator is
		port (
			input  : in  STD_LOGIC_VECTOR(3 downto 0);
			output : out STD_LOGIC
		);
	end component;

	component decoder7 is
		port (
			C       : in  STD_LOGIC_VECTOR(3 downto 0);
			Display : out STD_LOGIC_VECTOR(0 to 6)
		);
	end component;

	component circuitA is
		port (
			input  : in  STD_LOGIC_VECTOR(2 downto 0);
			output : out STD_LOGIC_VECTOR(2 downto 0)
		);
	end component;

	component circuitB is
		port (
			input   : in  STD_LOGIC;
			Display : out STD_LOGIC_VECTOR(0 to 6)
		);
	end component;

	signal z, m0, m1, m2, m3, a1, a2, a3 : STD_LOGIC;
	constant a4                          : STD_LOGIC := '0';
begin
	MUX0 : mux
	port map(SW(0), a1, z, m0);
	MUX1 : mux
	port map(SW(1), a2, z, m1);
	MUX2 : mux
	port map(SW(2), a3, z, m2);
	MUX3 : mux
	port map(SW(3), a4, z, m3);
	COMP : comparator
	port map(SW(3 downto 0), z);
	DEC1 : decoder7
	port map(C(3) => m3, C(2) => m2, C(1) => m1, C(0) => m0, DISPLAY => HEX0);
	DEC2 : circuitB
	port map(z, HEX1);
	DRIV : circuitA
	port map(SW(2 downto 0), OUTPUT(2) => a3, OUTPUT(1) => a2, OUTPUT(0) => a1);
end Behavior;