------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 5 - Reaction timer
-- VHDL code of BIN-to-BCD converter
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_converter_tb is
end BCD_converter_tb;

architecture behavior of BCD_converter_tb is
	component BCD_converter is port (
		number                 : in  STD_LOGIC_VECTOR(15 downto 0); -- 16-bit input
		OUT3, OUT2, OUT1, OUT0 : out STD_LOGIC_VECTOR(3 downto 0)); -- 4-digit BCD output
	end component;
	signal int_number : INTEGER;
	signal bin_number: std_logic_vector(15 downto 0);
	signal ones, tens, hundred, thousand: std_logic_vector(3 downto 0);
begin
	bin_number <= std_logic_vector(to_unsigned(int_number, 16));
	process
	begin
		int_number <= 0;
		wait for 20 ns;
		int_number <= 2;
		wait for 20 ns;
		int_number <= 99;
		wait for 20 ns;
		int_number <= 248;
		wait for 20 ns;
		int_number <= 2558;
		wait for 20 ns;
		int_number <= 9999;
		wait for 20 ns;
		int_number <= 10000;
		wait;
	end process;

	UUT: BCD_converter
        port map (
            number => bin_number,
            OUT3   => thousand,
            OUT2   => hundred,
            OUT1   => tens,
            OUT0   => ones
        );

end behavior;
