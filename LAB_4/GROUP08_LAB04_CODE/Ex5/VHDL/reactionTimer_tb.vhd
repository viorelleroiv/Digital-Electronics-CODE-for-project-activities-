------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 5 - Reaction timer
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reactionTimer_tb is

end reactionTimer_tb;

architecture structure of reactionTimer_tb is

	component reactionTimer is
		port (
			STOP, CLK, RST : in  STD_LOGIC;
			IN1            : in  STD_LOGIC_VECTOR(7 downto 0);
			COUNT          : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	signal COUNT          : STD_LOGIC_VECTOR(15 downto 0);
	signal STOP, CLK, RST : STD_LOGIC;
	signal IN1            : STD_LOGIC_VECTOR(7 downto 0);

begin
	UUT : reactionTimer
	port map(
		STOP  => STOP,
		CLK   => CLK,
		RST   => RST,
		IN1   => IN1,
		COUNT => COUNT
	);

	process
	begin
		STOP <= '1';
		RST  <= '0';
		IN1  <= "00000010";
		CLK  <= '0';
		wait for 15 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		RST <= '1';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK  <= '0';
		STOP <= '0';
		wait for 20 ns;
		CLK <= '1';
		wait for 20 ns;
		CLK <= '0';
		wait for 20 ns;
		CLK <= '1';

		wait;
	end process;

end structure;
