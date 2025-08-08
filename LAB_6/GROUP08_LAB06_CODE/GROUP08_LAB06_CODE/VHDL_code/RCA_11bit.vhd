------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of 11-bit RCA
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCA_11bit is
	port (
		A1, A2 : in  STD_LOGIC_VECTOR(10 downto 0); -- Numbers to be added
		P      : in  STD_LOGIC;                     -- RCA mode
		B1     : out STD_LOGIC_VECTOR(10 downto 0); -- Sum result
		COUT   : out STD_LOGIC                      -- Output carry
	);
end RCA_11bit;

architecture structural of RCA_11bit is
	component fullAdder is
		port (
			A, B, P, CIN : in  STD_LOGIC; -- Input A, B, RCA mode and input-carry
			S, COUT      : out STD_LOGIC  -- Sum result, output-carry
		);
	end component;

	signal C : STD_LOGIC_VECTOR((10 + 1) downto 0); -- 11 intermediate carry plus the carry_out
begin
	C(0) <= P;
	COUT <= C(11);

	-- Generate multiple instances of the full-adder
	gen_block : for i in 0 to 10 generate
		FA : fullAdder
		port map(
			A    => A1(i),
			B    => A2(i),
			P    => P,
			CIN  => C(i),
			S    => B1(i),
			COUT => C(i + 1)
		);
	end generate gen_block;

end structural;
