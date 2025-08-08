------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of testbench
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity digitalFilter_tb is
end digitalFilter_tb;

architecture behaviour of digitalFilter_tb is
	component digitalFilter is
		port (
			START, CLK, RES : in  STD_LOGIC;
			DATA_IN         : in  signed(7 downto 0);
			DONE            : out STD_LOGIC
		);
	end component;

	signal START, CLK, RES, DONE : STD_LOGIC;
	signal DATA_IN               : SIGNED(7 downto 0);
	signal DATA_IN_INTEGER       : INTEGER;

begin
	-- Clock process
	process
	begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
	end process;

	-- Convert integer to signed
	DATA_IN <= to_signed(DATA_IN_INTEGER, 8);

	-- Stimulus process
	process
	begin
		RES   <= '0';
		START <= '0';
		wait for 5 ns;
		RES             <= '1';
		START           <= '1';
		DATA_IN_INTEGER <= - 25;
		wait for 55 ns;
		DATA_IN_INTEGER <= 98;
		START <= '0';
		wait for 20 ns;
		DATA_IN_INTEGER <= 51;
		wait for 20 ns;
		DATA_IN_INTEGER <= - 67;
		wait for 20 ns;
		DATA_IN_INTEGER <= 66;
		wait for 20 ns;
		DATA_IN_INTEGER <= - 54;
		wait for 20 ns;
		DATA_IN_INTEGER <= - 57;
		wait for 20 ns;
		DATA_IN_INTEGER <= - 127;
		wait for 20 ns;
		DATA_IN_INTEGER <= - 33;
		wait for 20 ns;
		DATA_IN_INTEGER <= - 17;
		wait for 20 ns;
		wait;
	end process;

	-- Instantiate Unit Under Test (UUT)
	UUT : digitalFilter
	port map(
		START   => START,
		CLK     => CLK,
		RES     => RES,
		DATA_IN => DATA_IN
	);

end behaviour;
