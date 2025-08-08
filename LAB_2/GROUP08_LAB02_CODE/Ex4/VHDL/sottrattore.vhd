------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 4 - BIN to BCD converter
-- VHDL code of Comparator
------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sottrattore is
	port (
		in_sott_1 : in  STD_LOGIC_VECTOR(2 downto 0); -- Tens digit input (LSB is bit 0)
		v_in      : in  STD_LOGIC_VECTOR(5 downto 0); -- 6-bit input value (LSB is bit 0)
		out_dis   : out STD_LOGIC_VECTOR(3 downto 0)  -- 4-bit output for units display
	);
end sottrattore;

architecture behavioural of sottrattore is
begin
	process (v_in, in_sott_1)
		variable sottrazione, minuendo, sottraendo : INTEGER;
	begin
		-- Convert the input vector to an integer value.
		minuendo    := to_integer(unsigned(v_in));

		-- Default assignment: no subtraction.
		sottrazione := minuendo;

		-- Determine the subtraction amount based on the tens digit (in_sott_1)
		if in_sott_1 = "000" then -- 0 range: No subtraction
			null;
		elsif in_sott_1 = "001" then -- 10-20 range: subtract 10
			sottraendo  := 10;
			sottrazione := minuendo - sottraendo;
		elsif in_sott_1 = "010" then -- 20-30 range: subtract 20
			sottraendo  := 20;
			sottrazione := minuendo - sottraendo;
		elsif in_sott_1 = "011" then -- 30-40 range: subtract 30
			sottraendo  := 30;
			sottrazione := minuendo - sottraendo;
		elsif in_sott_1 = "100" then -- 40-50 range: subtract 40
			sottraendo  := 40;
			sottrazione := minuendo - sottraendo;
		elsif in_sott_1 = "101" then -- 50 range: subtract 50
			sottraendo  := 50;
			sottrazione := minuendo - sottraendo;
		elsif in_sott_1 = "110" then -- Special case: no subtraction for this branch
			sottraendo  := 60;
			sottrazione := minuendo - sottraendo;
		else
			sottrazione := 10; -- Error fallback value
		end if;

		-- Map the integer result to a 4-bit binary output for the display
		if sottrazione = 0 then
			out_dis <= "0000";
		elsif sottrazione = 1 then
			out_dis <= "0001";
		elsif sottrazione = 2 then
			out_dis <= "0010";
		elsif sottrazione = 3 then
			out_dis <= "0011";
		elsif sottrazione = 4 then
			out_dis <= "0100";
		elsif sottrazione = 5 then
			out_dis <= "0101";
		elsif sottrazione = 6 then
			out_dis <= "0110";
		elsif sottrazione = 7 then
			out_dis <= "0111";
		elsif sottrazione = 8 then
			out_dis <= "1000";
		elsif sottrazione = 9 then
			out_dis <= "1001";
		else
			out_dis <= "1111"; -- Undefined: turn off display segments
		end if;
	end process;
end behavioural;
