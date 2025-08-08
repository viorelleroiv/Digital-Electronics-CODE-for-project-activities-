------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of comparator
--
-- PARAMETRIC
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
	generic
	(
		N_bits : INTEGER; -- Define number of bits of the counter
		INT    : INTEGER
	);
	port (
		IN1  : in  STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Input signal
		OUT1 : out STD_LOGIC                                -- Output signal
	);
end comparator;

architecture dataflow of comparator is
begin
	OUT1 <= '1' when IN1 = STD_LOGIC_VECTOR(to_unsigned(INT, N_bits)) else
		'0';
end dataflow;
