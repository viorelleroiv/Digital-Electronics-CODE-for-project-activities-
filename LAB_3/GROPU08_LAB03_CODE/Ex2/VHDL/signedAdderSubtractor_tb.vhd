------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder/subtractor
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signedAdderSubtractor_tb is
end signedAdderSubtractor_tb;

architecture Behavior of signedAdderSubtractor_tb is

	component signedAdderSubtractor is
		port (
			IN1, IN2       : in  SIGNED(3 downto 0); -- Numbers to be added (2's complement format)
			IN3, CLK, RESN : in  STD_LOGIC;          -- Mode, Clock and Clear (Clear is active-low)
			OUT1           : out SIGNED(3 downto 0); -- Sum result (2's complement format)
			OUT2           : out STD_LOGIC           -- Overflow flag
		);
	end component;

	signal A, B, S               : SIGNED(3 downto 0); -- input and output numbers
	signal OVF, Clock, ResetN, C : STD_LOGIC;          -- Overflow flag, clock and reset signals
begin

	process
	begin
		A      <= "0001";
		B      <= "0001";
		C      <= '0';
		ResetN <= '1';
		Clock  <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		A     <= "0111";
		B     <= "0010";
		C     <= '1';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		A     <= "1000";
		B     <= "1011";
		C     <= '1';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		A     <= "1000";
		B     <= "0000";
		wait for 15 ns;
		ResetN <= '0';
		wait for 5 ns;
		Clock <= '1';
		wait;
	end process;

	DUT : signedAdderSubtractor
	port map(A, B, C, Clock, ResetN, S, OVF);

end Behavior;
