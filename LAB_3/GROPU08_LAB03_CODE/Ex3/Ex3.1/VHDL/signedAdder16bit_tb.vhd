------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3.1 - 16-bit ripple carry adder
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signedAdder16bit_tb is
end signedAdder16bit_tb;

architecture Behavior of signedAdder16bit_tb is

	component signedAdder16bit is
		port (
			IN1, IN2       : in  SIGNED(15 downto 0); -- Numbers to be added (2's complement format)
			IN3, CLK, RESN : in  STD_LOGIC;           -- Input-carry, Clock and Clear (Clear is active-low)
			OUT1           : out SIGNED(15 downto 0); -- Sum result (2's complement format)
			OUT2           : out STD_LOGIC            -- Overflow flag
		);
	end component;

	signal A, B, S               : SIGNED(15 downto 0);
	signal A1, B1, S1            : INTEGER;
	signal OVF, Clock, ResetN, C : STD_LOGIC;
begin
	A  <= to_signed(A1, A'length);
	B  <= to_signed(B1, B'length);
	S1 <= to_integer(S);
	process
	begin
		A1     <= 10;
		B1     <= 90;
		C      <= '0';
		ResetN <= '1';
		Clock  <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock     <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		A1    <= 30000;
		B1    <= 10000;
		C     <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock     <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		A1    <= 10200;
		B1    <= 15000;
		C     <= '1';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock     <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait for 20 ns;
		Clock  <= '0';
		ResetN <= '0';
		wait for 20 ns;
		Clock <= '1';
		wait;
	end process;

	DUT : signedAdder16bit
	port map(A, B, C, Clock, ResetN, S, OVF);

end Behavior;
