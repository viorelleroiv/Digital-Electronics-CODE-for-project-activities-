------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 4 - Flashing digits
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity digitFlashing_tb is
end digitFlashing_tb;

architecture behaviour of digitFlashing_tb is

	component digitFlashing is
		port (
			IN1, CLR : in  STD_LOGIC;                   -- Input signal: (will be conected to 50 MHz clock)
			OUT1     : out STD_LOGIC_VECTOR(3 downto 0) -- Output signal: 4-bit binary value in range 0 to 9 (in decimal)
		);
	end component;

	signal CLK, CLR : STD_LOGIC := '1'; -- Initialize CLK to '0'
	signal OUT1     : STD_LOGIC_VECTOR(3 downto 0);
begin
	clock_gen : process
	begin
		CLR <= '0';
		wait for 1 ns;
		CLR <= '1';
		wait for 9 ns;
		for i in 0 to 120 loop
			CLK <= not CLK;
			wait for 10 ns;
		end loop;
		wait;
	end process;

	UUT : digitFlashing
	port map(
		IN1  => CLK,
		CLR  => CLR,
		OUT1 => OUT1
	);

end behaviour;