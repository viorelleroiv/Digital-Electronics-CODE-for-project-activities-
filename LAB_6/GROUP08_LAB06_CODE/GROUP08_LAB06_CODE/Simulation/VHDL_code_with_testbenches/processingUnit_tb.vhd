------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of testbench for "processing unit"
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processingUnit_tb is
end processingUnit_tb;

architecture behaviour of processingUnit_tb is

	component processingUnit is
		port (
			IN1      : in  STD_LOGIC_VECTOR(7 downto 0); -- 8-bit signed data
			CLK, RES : in  STD_LOGIC;                    -- Clock and reset signals
			OUT1     : out STD_LOGIC_VECTOR(12 downto 0) -- 13-bit signed data
		);
	end component;

	signal IN1      : STD_LOGIC_VECTOR(7 downto 0);
	signal CLK, RES : STD_LOGIC := '0';
	signal OUT_INT  : STD_LOGIC_VECTOR(10 downto 0); -- Output's integer part
	signal OUT_DEC  : STD_LOGIC_VECTOR(1 downto 0);  -- Output's decimal part

begin

	clock_gen : process
	begin
		CLK <= '0';
		wait for 10 ns;
		CLK <= '1';
		wait for 10 ns;
	end process;

	testbench : process
	begin
		wait for 5 ns;
		RES <= '1';
		IN1 <= "00001010";
		wait for 100 ns;
		IN1 <= "01100100";
		wait;
	end process;

	UUT : processingUnit
	port map(
		IN1               => IN1,
		CLK               => CLK,
		RES               => RES,
		OUT1(12 downto 2) => OUT_INT,
		OUT1(1 downto 0)  => OUT_DEC
	);

end behaviour;
