------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of memory module
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
	port (
		CLK, CS, WR, RD : in  STD_LOGIC;                    -- Control signals
		ADDRESS         : in  STD_LOGIC_VECTOR(9 downto 0); -- Memory address
		DATA_IN         : in  signed(7 downto 0);           -- Input data
		DATA_OUT        : out signed(7 downto 0)            -- Output data
	);
end memory;

architecture bahaviour of memory is

	type mem_array is array(0 to 1023) of signed(7 downto 0);
	signal mem             : mem_array := (others => (others => '0')); -- Initialize to zero

	signal INTEGER_ADDRESS : INTEGER;

begin
	-- Address conversion
	INTEGER_ADDRESS <= to_integer(unsigned(ADDRESS));

	-- Synchronous write process
	process (CLK)
	begin
		if rising_edge(CLK) then
			if CS = '1' and WR = '1' then
				mem(INTEGER_ADDRESS) <= DATA_IN; -- Store input data
			end if;
		end if;
	end process;

	-- Asynchronous read process
	DATA_OUT <= mem(INTEGER_ADDRESS) when (CS = '1' and RD = '1') else
		(others => 'Z'); -- High impedance when inactive

end bahaviour;
