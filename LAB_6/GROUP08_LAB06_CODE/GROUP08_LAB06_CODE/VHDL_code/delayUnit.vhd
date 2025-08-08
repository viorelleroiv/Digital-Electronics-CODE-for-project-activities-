------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of data delay unit
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delayUnit is
	generic (
		N_bit : INTEGER -- Number of bits of the stream
	);
	port (
		R        : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0); -- Stream input
		CLK, RES : in  STD_LOGIC;                              -- Clock, Reset, and Load signals
		OUT1     : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)  -- Delayed stream output
	);
end delayUnit;

architecture structure of delayUnit is

	-- Component declaration for register
	component regn is
		generic (
			N_bit : INTEGER -- Number of bits for the register
		);
		port (
			R            : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0); -- Register input
			CLK, RES, LD : in  STD_LOGIC;                              -- Clock, Reset, and Load signals
			Q            : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)  -- Shift register output
		);
	end component;

	type intermediateValue is array(0 to 5) of STD_LOGIC_VECTOR((N_bit - 1) downto 0);
	signal int_value : intermediateValue;

begin

	-- Generate block to instantiate multiple register units for delay functionality
	regn_generate : for i in 0 to 4 generate
		REG : regn
		generic map(
			N_bit => N_bit
		)
		port map(
			R   => int_value(i), -- Connect intermediate signals
			CLK => CLK,
			RES => RES,
			LD  => '1',
			Q   => int_value(i + 1) -- Output goes to the next stage
		);
	end generate regn_generate;

	int_value(0) <= R;            -- Input assigned to the first register in the chain
	OUT1         <= int_value(5); -- Final delayed output assigned

end structure;
