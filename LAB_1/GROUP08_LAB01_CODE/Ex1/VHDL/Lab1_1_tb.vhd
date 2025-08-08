------------------------------------
-- Group 8 - Laboratory 1
-- Exercise 1 - Controlling the LEDs
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity testbench is
end testbench;

architecture Behavior of testbench is
	component part1
		port (
			SW   : in  STD_LOGIC_VECTOR (9 downto 0);
			LEDR : out STD_LOGIC_VECTOR (9 downto 0));
	end component;

	signal INPUTS  : STD_LOGIC_VECTOR(9 downto 0);
	signal OUTPUTS : STD_LOGIC_VECTOR(9 downto 0);
begin
	process
	begin
		INPUTS <= "0011001100";
		wait for 20 ns;
		INPUTS <= "1100110011";
		wait for 20 ns;
		INPUTS <= "1010101010";
		wait for 20 ns;
		INPUTS <= "1111100000";
		wait;
	end process;

	DUT : part1 port map(SW => INPUTS, LEDR => OUTPUTS);

end Behavior;