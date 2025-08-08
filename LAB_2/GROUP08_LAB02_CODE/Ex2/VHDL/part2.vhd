------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - Multiplexing the 7-seg output
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity part2 is
	port (
		SW                           : in  STD_LOGIC_VECTOR(4 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4 : out STD_LOGIC_VECTOR(0 to 6)
	);
end part2;

architecture Behavior of part2 is
	component mux is
		port (
			SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
			OUTPUT : out STD_LOGIC_VECTOR(14 downto 0)
		);
	end component;
	component shifter is
		port (
			INPUT  : in  STD_LOGIC_VECTOR(14 downto 0);
			SEL    : in  STD_LOGIC_VECTOR(2 downto 0);
			OUTPUT : out STD_LOGIC_VECTOR(14 downto 0)
		);
	end component;
	component decoder7
		port (
			C       : in  STD_LOGIC_VECTOR(2 downto 0);
			DISPLAY : out STD_LOGIC_VECTOR(0 to 6)
		);
	end component;
	signal A1, A2 : STD_LOGIC_VECTOR(14 downto 0);
begin
	MUX0 : mux
	port map(SW(1 downto 0), A1);
	SHIFT0 : shifter
	port map(A1, SW(4 downto 2), A2);
	H0 : decoder7
	port map(A2(2 downto 0), HEX0);
	H1 : decoder7
	port map(A2(5 downto 3), HEX1);
	H2 : decoder7
	port map(A2(8 downto 6), HEX2);
	H3 : decoder7
	port map(A2(11 downto 9), HEX3);
	H4 : decoder7
	port map(A2(14 downto 12), HEX4);
end Behavior;