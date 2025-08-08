------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 4 - BIN to BCD converter
-- VHDL code of testbench
------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity TESTBENCH_4 is
end TESTBENCH_4;

architecture behavior of TESTBENCH_4 is
	signal SW         : STD_LOGIC_VECTOR(5 downto 0) := "000000";
	signal HEX1, HEX0 : STD_LOGIC_VECTOR(6 downto 0);
begin

	--(UUT)
	uut : entity work.BTD
		port map(
			SW   => SW,
			HEX1 => HEX1,
			HEX0 => HEX0
		);
	process
	begin
		-- range 0-9: 0, 4, 9
		SW <= "000000"; -- 0
		wait for 20 ns;
		SW <= "000100"; -- 4
		wait for 20 ns;
		SW <= "001001"; -- 9
		wait for 20 ns;

		-- range 10-19: 19
		SW <= "010011"; -- 19 
		wait for 20 ns;

		-- range 20-29: 20, 29
		SW <= "010100"; -- 20
		wait for 20 ns;
		SW <= "011101"; -- 29 
		wait for 20 ns;

		-- range 30-39: 30
		SW <= "011110"; -- 30
		wait for 20 ns;

		-- range 40-49: 44,

		SW <= "101100"; -- 44 
		wait for 20 ns;
		-- range 50-59: 50, 59
		SW <= "110010"; -- 50 
		wait for 20 ns;

		SW <= "111011"; -- 59 
		wait for 20 ns;

		-- range 60-63: 60, 61, 63
		SW <= "111100"; -- 60 
		wait for 20 ns;
		SW <= "111101"; -- 61 
		wait for 20 ns;
		wait; -- end test
	end process;

end behavior;