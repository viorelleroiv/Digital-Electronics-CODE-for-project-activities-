------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - Multiplexing the 7-seg output
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Testbench for the 7 segment decoder
entity part2_tb is
end part2_tb;

architecture Behavior of part2_tb is

	component part2
		port (
			SW                           : in  STD_LOGIC_VECTOR(4 downto 0);
			HEX0, HEX1, HEX2, HEX3, HEX4 : out STD_LOGIC_VECTOR(6 downto 0)
		);
	end component;

	signal DIGIT_SELECTION              : STD_LOGIC_VECTOR(1 downto 0);
	signal SHIFT_SELECTION              : STD_LOGIC_VECTOR(2 downto 0);
	signal DIG0, DIG1, DIG2, DIG3, DIG4 : STD_LOGIC_VECTOR(6 downto 0);

begin
	process
	begin

		DIGIT_SELECTION <= "00";
		SHIFT_SELECTION <= "000";
		wait for 20 ns;
		DIGIT_SELECTION <= "01";
		SHIFT_SELECTION <= "000";
		wait for 20 ns;
		DIGIT_SELECTION <= "01";
		SHIFT_SELECTION <= "001";
		wait for 20 ns;
		DIGIT_SELECTION <= "10";
		SHIFT_SELECTION <= "011";
		wait for 20 ns;
		DIGIT_SELECTION <= "11";
		SHIFT_SELECTION <= "100";
		wait;
	end process;

	DUT : part2
	port map(
		SW(1 downto 0) => DIGIT_SELECTION,
		SW(4 downto 2) => SHIFT_SELECTION,
		HEX0           => DIG0,
		HEX1           => DIG1,
		HEX2           => DIG2,
		HEX3           => DIG3,
		HEX4           => DIG4);

end Behavior;