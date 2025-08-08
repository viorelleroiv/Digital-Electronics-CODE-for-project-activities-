------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3.1 - 16-bit ripple carry adder
-- VHDL code of overflow detector
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ovfdetector is
	port (
		A, B, S : in  STD_LOGIC;  -- Most significant bit of A, B and S
		OVF     : out STD_LOGIC); -- Overflow detected
end ovfdetector;

architecture dataflow of ovfdetector is
begin
	OVF <= (A xnor B) and (A xor S);
end dataflow;
