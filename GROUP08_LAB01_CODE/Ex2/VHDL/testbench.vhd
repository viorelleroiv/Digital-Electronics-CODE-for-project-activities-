------------------------------------
-- Group 8 - Laboratory 1
-- Exercise 2 - 2-to-1 multiplexer
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity testbench_ex2 is
end testbench_ex2;

architecture Behavior of testbench_ex2 is

	component mux21
		port (
			SW   : in  STD_LOGIC_VECTOR(8 downto 0);
			LEDR : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;

	signal A, B, Z : STD_LOGIC_VECTOR(3 downto 0);
	signal SEL     : STD_LOGIC;

begin
	process
	begin
		A   <= "0101"; 		-- Set A to the value 0101
		B   <= "1111"; 		-- Set B to the value 1111

		SEL <= '0';    		-- Set SEL to the value 0
		wait for 20 ns;
		SEL <= '1';		-- Change SEL
		wait for 20 ns;
		A <= "1010"; 		-- Change A (no change in M)
		wait for 20 ns;
		B <= "0000";		-- Change B
		wait;
	end process;

	MUX_UT : mux21
	port map(SW(3 downto 0) => A, SW(7 downto 4) => B, SW(8) => SEL, LEDR => Z);

end Behavior;