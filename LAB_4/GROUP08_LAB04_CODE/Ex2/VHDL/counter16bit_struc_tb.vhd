------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 2 - 16-bit counter (structural)
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter16bit_tb is
end counter16bit_tb;

architecture behaviout of counter16bit_tb is

	component counter16bit is
		port (
			EN, CLK, CLR : in  STD_LOGIC;
			COUNT        : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	signal EN, CLK, CLR : STD_LOGIC;
	signal COUNT        :  STD_LOGIC_VECTOR(15 downto 0);
	signal INT_COUNT    : INTEGER;

begin

	process
	begin
		EN  <= '0';
		CLR <= '0';
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLR <= '1';
		EN       <= '1';
		CLK      <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLR <= '0';
		EN  <= '0';
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;

		CLK <= '1';
		wait for 5 ns;
		wait;
	end process;

	INT_COUNT <= to_integer(unsigned(COUNT));
	UUT : counter16bit
	port map(
		EN    => EN,
		CLK   => CLK,
		CLR => CLR,
		COUNT => COUNT
	);

end behaviout;