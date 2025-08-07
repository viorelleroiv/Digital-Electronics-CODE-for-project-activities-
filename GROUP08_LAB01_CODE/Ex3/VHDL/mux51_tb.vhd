------------------------------------
-- Group 8 - Laboratory 1
-- Exercise 3 - 5-to-1 multiplexer
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux5to1_tb is
end mux5to1_tb;

architecture behavior of mux5to1_tb is

	-- Component Declaration
	component mux5to1
		port (
			SW   : in  STD_LOGIC_VECTOR(8 downto 0); -- input Switches
			LEDR : out STD_LOGIC_VECTOR(2 downto 0)  -- output LEDs
		);
	end component;

	-- Signals for stimulus
	signal SW   : STD_LOGIC_VECTOR(8 downto 0);
	signal LEDR : STD_LOGIC_VECTOR(2 downto 0);

begin

	-- Instantiate the Unit Under Test (UUT)
	uut : mux5to1 port map(
		SW   => SW,
		LEDR => LEDR
	);

	-- Stimulus process
	stim_proc : process
	begin
		-- Test first input "101"
		SW <= "000000000"; -- Sel = "000", M = U = "101"
		wait for 10 ns;

		-- Test second input "010"
		SW <= "001000000"; -- Sel = "001", M = V = "010"
		wait for 10 ns;

		-- Test thirt input "111"
		SW <= "010000000"; -- Sel = "010", M = W = "111"
		wait for 10 ns;

		-- Test fourth input (X = SW(2:0))
		SW <= "011010101"; -- Sel = "011", X = SW(2:0) = "101", M = X = "101"
		wait for 10 ns;

		-- Test fifth input (Y = SW(5:3))
		SW <= "100010101"; -- Sel = "100", Y = SW(5:3) = "101", M = Y = "010"
		wait for 10 ns;

		-- Test unexpected selections (default case)
		SW <= "101010101"; -- Sel = "101", M = Y = "010" (default)
		wait for 10 ns;

		SW <= "110010101"; -- Sel = "110", M = Y = "010" (default)
		wait for 10 ns;

		SW <= "111010101"; -- Sel = "111", M = Y = "010" (default)
		wait for 10 ns;

		wait;
	end process;

end behavior;
