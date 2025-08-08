------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3.2 - 4-bit ripple carry
-- adder with carry bypass
--
-- VHDL code of carry progagation flag generator
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity carryPropagation is
	port (
		A, B  : in  STD_LOGIC_VECTOR(3 downto 0);	-- 4-bit wide inputs A and B of 4-bit RCA
		P_OUT : out STD_LOGIC				-- Propagation flag
	);
end carryPropagation;

architecture dataflow of carryPropagation is
begin

	P_OUT <= (A(0) xor B(0)) and (A(1) xor B(1)) and
		(A(2) xor B(2)) and (A(3) xor B(3));
end dataflow;