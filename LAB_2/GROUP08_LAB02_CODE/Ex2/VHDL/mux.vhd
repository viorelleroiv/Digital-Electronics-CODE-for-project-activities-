------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - Multiplexing the 7-seg output
-- VHDL code of mux
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity mux is
	port (
		SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
		OUTPUT : out STD_LOGIC_VECTOR(14 downto 0)
	);
end mux;

architecture Behavior of mux is

	constant W0 : STD_LOGIC_VECTOR(14 downto 0) := "000001010010011"; -- HELLO
	constant W1 : STD_LOGIC_VECTOR(14 downto 0) := "100001110110011"; -- CEPPO
	constant W2 : STD_LOGIC_VECTOR(14 downto 0) := "100001010010011"; -- CELLO
	constant W3 : STD_LOGIC_VECTOR(14 downto 0) := "101001110110011"; -- FEPPO

begin
	OUTPUT <= W0 when SEL = "00" else
		W1 when SEL = "01" else
		W2 when SEL = "10" else
		W3;
end Behavior;