------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 4 - Array multiplier
-- VHDL code of multiplier
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier4bit is
	port (
		IN1, IN2 : in  STD_LOGIC_VECTOR(3 downto 0); -- Input values
		OUT1     : out STD_LOGIC_VECTOR(7 downto 0)  -- Output value
	);
end multiplier4bit;

architecture structural of multiplier4bit is

	-- Include full-adder as elementary component
	component fullAdder is
		port (
			A, B, CI : in  STD_LOGIC; -- Input A, B and input-carry
			S, Cout  : out STD_LOGIC  -- Sum result, output-carry
		);
	end component;

	type matrix3x4 is array(0 to 2) of STD_LOGIC_VECTOR(3 downto 0); -- A 3x4 matrix (3 rows, 4 columns)
	signal A1, B1, S1 : matrix3x4;
	-- Every row of A1 is the input bit-vector value A of the full-adders row at the corresponding row
	-- Every row of B1 is the input bit-vector value B of the full-adders row at the corresponding row
	-- Every row of S1 is the output bit-vector value S of the full-adders row at the corresponding row

	type matrix3x5 is array(0 to 2) of STD_LOGIC_VECTOR(4 downto 0); -- A 3x5 matrix (3 rows, 5 columns)
	signal C1 : matrix3x5;
	-- Every cell of C1 is the carry value in/out of the full-adder at the corresponding row and coloumn
begin
	-- Initialize the input carry of every row at '0'
	C1(0)(0) <= '0';
	C1(1)(0) <= '0';
	C1(2)(0) <= '0';

	-- Generate multiple instances of the full-adder
	gen_block_row : for i in 1 to 3 generate
		gen_block_col : for j in 0 to 3 generate

			-- The input B of every full-adder is given by this assignment
			B1(i - 1)(j) <= IN1(j) and IN2(i);

			FA : fullAdder
			port map(
				A    => A1(i - 1)(j),
				B    => B1(i - 1)(j),
				CI   => C1(i - 1)(j),
				S    => S1(i - 1)(j),
				COUT => C1(i - 1)(j + 1)
			);

		end generate gen_block_col;
	end generate gen_block_row;

	-- Generate the first row of matrix A1
	A1_generate : for j in 0 to 2 generate
		A1 (0)(j) <= IN1(j + 1) and IN2(0);
	end generate A1_generate;

	-- Assign other inputs and intermediate signals 
	A1(0)(3)          <= '0';

	A1(1)(2 downto 0) <= S1(0)(3 downto 1);
	A1(1)(3)          <= C1(0)(4);

	A1(2)(2 downto 0) <= S1(1)(3 downto 1);
	A1(2)(3)          <= C1(1)(4);

	-- Assign the column results at the output vector
	OUT1(0)           <= IN1(0) and IN2(0);
	OUT1(1)           <= S1(0)(0);
	OUT1(2)           <= S1(1)(0);
	OUT1(6 downto 3)  <= S1(2);
	OUT1(7)           <= C1(2)(4);

end structural;
