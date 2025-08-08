------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 2 - 7 segment decoder
-- Testbench for the 7 segment decoder
------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity decoder7_testbench is
end decoder7_testbench;

architecture Behavior of decoder7_testbench is

	component decoder7
		port (
			SW   : in  STD_LOGIC_VECTOR(2 downto 0);
			HEX0 : out STD_LOGIC_VECTOR(0 to 6)
		);
	end component;

	signal SEL : STD_LOGIC_VECTOR(2 downto 0);	-- Selection signal
	signal DIG : STD_LOGIC_VECTOR(0 to 6); 		-- Decoder output signal

begin
	process
	begin
		SEL <= "000";		-- Set SEL to 000
		wait for 20 ns;
		SEL <= "001";		-- Set SEL to 001
		wait for 20 ns;
		SEL <= "010";		-- Set SEL to 010
		wait for 20 ns;
		SEL <= "011";		-- Set SEL to 011
		wait for 20 ns;
		SEL <= "100";		-- Set SEL to 100
		wait;
	end process;
	
	-- Entity under test
	DUT : decoder7
	port map(SW => SEL, HEX0 => DIG);

end Behavior;
