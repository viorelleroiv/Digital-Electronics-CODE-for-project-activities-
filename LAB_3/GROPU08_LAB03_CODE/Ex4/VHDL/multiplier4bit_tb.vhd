------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 4 - 4-bit multiplier
-- VHDL code of testbench
------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier4bit_tb is
end multiplier4bit_tb;

architecture behavior of multiplier4bit_tb is

	component multiplier4bit
		port (
			IN1, IN2 : in  STD_LOGIC_VECTOR(3 downto 0); -- Input values
			OUT1     : out STD_LOGIC_VECTOR(7 downto 0)  -- Output value
		);
	end component;

	signal IN1, IN2 : STD_LOGIC_VECTOR(3 downto 0);
	signal OUT1     : STD_LOGIC_VECTOR(7 downto 0);
	signal A, B, P  : INTEGER;

begin

	IN1 <= STD_LOGIC_VECTOR(to_unsigned(A, IN1'length));
	IN2 <= STD_LOGIC_VECTOR(to_unsigned(B, IN2'length));
	P   <= to_integer(unsigned(OUT1));

	process
	begin

		A <= 7;
		B <= 11;
		wait for 20 ns;
		A <= 10;
		B <= 14;
		wait for 20 ns;
		A <= 14;
		B <= 10;
		wait for 20 ns;
		A <= 0;
		B <= 8;
		wait;
	end process;

	DUT : multiplier4bit
	port map(
		IN1  => IN1,
		IN2  => IN2,
		OUT1 => OUT1
	);

end behavior;