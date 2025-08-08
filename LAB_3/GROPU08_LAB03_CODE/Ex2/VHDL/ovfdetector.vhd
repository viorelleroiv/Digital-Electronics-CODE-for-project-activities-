------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder/subtractor
-- VHDL code of overflow detector
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ovfdetector is
	port (
		A, B, S, MODE, COUT : in  STD_LOGIC;  -- Most significant bit of A, B and S, MODE and RCA output-carry
		OVF                 : out STD_LOGIC); -- Overflow flag
end ovfdetector;

architecture dataflow of ovfdetector is
begin
	OVF <= (A and B and not S) or (not A and not B and S) when MODE = '0' else
		(A and not B and not S) or (not A and B and S);
end dataflow;