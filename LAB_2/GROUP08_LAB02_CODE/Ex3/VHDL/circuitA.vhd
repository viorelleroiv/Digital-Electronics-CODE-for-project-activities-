------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of Circuit A
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity circuitA is
	port (
		INPUT  : in  STD_LOGIC_VECTOR(2 downto 0);
		OUTPUT : out STD_LOGIC_VECTOR(2 downto 0)
	);
end circuitA;

architecture Behavior of circuitA is
begin
	OUTPUT <= "000" when INPUT = "010" else
		"001" when INPUT = "011" else
		"010" when INPUT = "100" else
		"011" when INPUT = "101" else
		"100" when INPUT = "110" else
		"101" when INPUT = "111";
end Behavior;