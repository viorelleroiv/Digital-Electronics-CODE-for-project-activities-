------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 4 - Flashing digits
-- VHDL code of comparator
-- 
-- PARAMETRIC
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity comparator_typeB is
	generic
	(
		N_bits : INTEGER -- Define number of bits of the counter
	);
	port (
		IN1, IN2  : in  STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Input signal
		OUT1 : out STD_LOGIC                                -- Output signal
	);
end comparator_typeB;

architecture dataflow of comparator_typeB is
begin
	OUT1 <= '1' when IN1 = IN2 else
		'0';
end dataflow;
