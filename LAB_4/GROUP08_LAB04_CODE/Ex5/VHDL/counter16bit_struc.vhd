------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 2 - 16-bit counter (structural)
-- VHDL code of 16-bit counter
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity counter16bit is
	port (
		EN, CLK, CLR : in  STD_LOGIC;
		COUNT        : out STD_LOGIC_VECTOR(15 downto 0)
	);
end counter16bit;

architecture structure of counter16bit is

	component T_FlipFlop is
		port (
		CLK : in  STD_LOGIC;
		CLR : in  STD_LOGIC; -- Active-low asynchronous clear input
		T   : in  STD_LOGIC;
		Q   : out STD_LOGIC
	);
	end component;

	signal A, T, C : STD_LOGIC_VECTOR(15 downto 0);
	
begin
	T(0) <= EN;
	A(0) <= EN;

	TFF : T_FlipFlop
		port map(
			CLK => CLK,
			CLR => CLR,
			T   => EN,
			Q   => C(0)
		);
	
	ff_generate : for i in 1 to 15 generate
		A(i) <= T(i-1);
		T(i) <= A(i) and C(i-1);

		TFF : T_FlipFlop
		port map(
			CLK => CLK,
			CLR => CLR,
			T   => T(i),
			Q   => C(i)
		);

	end generate ff_generate;

	COUNT <= C;

end structure;