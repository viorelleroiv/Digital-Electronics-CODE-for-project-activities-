------------------------------------
-- Group 8 - Laboratory 1
-- Exercise 2 - 2-to-1 multiplexer
-- VHDL code of multiplexer (mux21)
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux21 is
	port (
		SW   : in  STD_LOGIC_VECTOR(8 downto 0);
		LEDR : out STD_LOGIC_VECTOR(3 downto 0)
	);
end mux21;

architecture dataflow of mux21 is
	signal X, Y, M : STD_LOGIC_VECTOR(3 downto 0);
	signal s       : STD_LOGIC;
begin
	X    <= SW(3 downto 0);
	Y    <= SW(7 downto 4);
	s    <= SW(8);
	M(0) <= (not (s) and X(0)) or (s and Y(0));
	M(1) <= (not (s) and X(1)) or (s and Y(1));
	M(2) <= (not (s) and X(2)) or (s and Y(2));
	M(3) <= (not (s) and X(3)) or (s and Y(3));
	LEDR <= M;
end dataflow;