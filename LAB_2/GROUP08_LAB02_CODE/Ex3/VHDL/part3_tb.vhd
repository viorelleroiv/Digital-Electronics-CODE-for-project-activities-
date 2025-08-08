------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 3 - BIN to DEC converter
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity part3_tb is
end part3_tb;

architecture Behavior of part3_tb is

	component Part3 is
		port (
			SW         : in  STD_LOGIC_VECTOR(3 downto 0);
			HEX0, HEX1 : out STD_LOGIC_VECTOR(0 to 6)
		);
	end component;

	signal INPUT      : STD_LOGIC_VECTOR(3 downto 0);
	signal HEX0, HEX1 : STD_LOGIC_VECTOR(0 to 6);
begin
	process
	begin
		INPUT <= "0000";
		wait for 20 ns;
		INPUT <= "0001";
		wait for 20 ns;
		INPUT <= "0010";
		wait for 20 ns;
		INPUT <= "1001";
		wait for 20 ns;
		INPUT <= "1010";
		wait for 20 ns;
		INPUT <= "1011";
		wait for 20 ns;
		INPUT <= "1110";
		wait;
	end process;

	DUT : Part3
	port map(
		SW(3 downto 0) => INPUT,
		HEX0           => HEX0,
		HEX1           => HEX1
	);

end Behavior;
