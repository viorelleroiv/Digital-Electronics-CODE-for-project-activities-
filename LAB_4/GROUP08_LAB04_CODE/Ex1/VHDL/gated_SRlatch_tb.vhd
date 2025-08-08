library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gated_SRlatch_tb is
end gated_SRlatch_tb;

architecture testbench of gated_SRlatch_tb is
	component gated_SRlatch is
		port (
			clk, R, S : in STD_LOGIC;
			Q : out STD_LOGIC
		);
	end component;

	signal clk, R, S, Q : STD_LOGIC := '0';

begin
	uut : gated_SRlatch port map(
				clk => clk,
				R => R,
				S => S,
				Q => Q
			);
	
	process
	begin
		
		S <= '0';
		R <= '0';
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		-- expected: Q = previous Q (1 or 0)
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		
		S <= '0';
		R <= '1';
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		-- expected: Q = 0
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		
		S <= '1';
		R <= '0';
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		-- expected: Q = 1
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;

		S <= '0';
		R <= '0';
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		-- expected: Q = previous Q (1 or 0)
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;

		S <= '0';
		R <= '1';
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		-- expected: Q = 0
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;

		S <= '1';
		R <= '0';
		-- expected: Q = 1
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		
		S <= '1';
		R <= '1';
		-- expected: Q = indeterminate
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
		
		
		wait;
	end process;
end testbench;