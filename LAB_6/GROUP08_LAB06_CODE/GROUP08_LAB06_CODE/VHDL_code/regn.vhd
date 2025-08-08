------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of register
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regn is
	generic (N_bit : INTEGER); -- Defines the bit-width of the register
	port (
		R            : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0); -- Register input data
		CLK, RES, LD : in  STD_LOGIC;                              -- Clock, Reset, and Load control signals
		Q            : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)  -- Register output data
	);
end regn;

architecture Behavior of regn is
begin
	process (CLK, RES, LD)
	begin
		
		if (RES = '0') then
			Q <= (others => '0'); 		-- Reset the register to all zeros

		elsif (CLK'EVENT and CLK = '1') then
			if (LD = '1') then
				Q <= R;			-- Load input data into register
			end if;
		end if;
	end process;
end Behavior;
