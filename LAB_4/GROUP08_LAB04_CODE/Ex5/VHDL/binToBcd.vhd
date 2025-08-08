------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 5 - Reaction timer
-- VHDL code of BIN-to-BCD converter
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_converter is port (
	number                 : in  STD_LOGIC_VECTOR(15 downto 0);	-- 16-bit input
	OUT3, OUT2, OUT1, OUT0 : out STD_LOGIC_VECTOR(3 downto 0));	-- 4-digit BCD output
end BCD_converter;

architecture behavior of BCD_converter is

	signal int_number, thousand, hundred, tens, ones             : INTEGER;			-- Integer version of the digits
	signal thousand_digit, hundred_digit, tens_digit, ones_digit : unsigned(3 downto 0);	-- Binary code of the digits
	signal outOfScale                                            : BOOLEAN;			-- Out of scale flag (1 when input > 9999)

begin

	int_number <= to_integer(unsigned(number));

	thousand   <= int_number;
	outOfScale <= true when (int_number > 9999) else
		false;

	-- Thousand digit evaluation
	thousand_digit <= "0000" when ((thousand < 1000) and (thousand >- 1) and not(outOfScale)) else
		"0001" when ((thousand < 2000) and (thousand > 999) and not(outOfScale)) else
		"0010" when ((thousand < 3000) and (thousand > 1999) and not(outOfScale)) else
		"0011" when ((thousand < 4000) and (thousand > 2999) and not(outOfScale)) else
		"0100" when ((thousand < 5000) and (thousand > 3999) and not(outOfScale)) else
		"0101" when ((thousand < 6000) and (thousand > 4999) and not(outOfScale)) else
		"0110" when ((thousand < 7000) and (thousand > 5999) and not(outOfScale)) else
		"0111" when ((thousand < 8000) and (thousand > 6999) and not(outOfScale)) else
		"1000" when ((thousand < 9000) and (thousand > 7999) and not(outOfScale)) else
		"1001" when ((thousand < 10000) and (thousand > 8999) and not(outOfScale)) else
		"1111";

	OUT3    <= STD_LOGIC_VECTOR(thousand_digit);

	-- Hundred digit evaluation
	hundred <= (int_number) when (thousand_digit = "0000") else
		(int_number - 1000) when (thousand_digit = "0001") else
		(int_number - 2000) when (thousand_digit = "0010") else
		(int_number - 3000) when (thousand_digit = "0011") else
		(int_number - 4000) when (thousand_digit = "0100") else
		(int_number - 5000) when (thousand_digit = "0101") else
		(int_number - 6000) when (thousand_digit = "0110") else
		(int_number - 7000) when (thousand_digit = "0111") else
		(int_number - 8000) when (thousand_digit = "1000") else
		(int_number - 9000) when (thousand_digit = "1001") else
		1000;

	hundred_digit <= "0000" when ((hundred < 100) and (hundred >- 1)) else
		"0001" when ((hundred < 200) and (hundred > 99)) else
		"0010" when ((hundred < 300) and (hundred > 199)) else
		"0011" when ((hundred < 400) and (hundred > 299)) else
		"0100" when ((hundred < 500) and (hundred > 399)) else
		"0101" when ((hundred < 600) and (hundred > 499)) else
		"0110" when ((hundred < 700) and (hundred > 599)) else
		"0111" when ((hundred < 800) and (hundred > 699)) else
		"1000" when ((hundred < 900) and (hundred > 799)) else
		"1001" when ((hundred < 1000) and (hundred > 899))else
		"1111";

	OUT2 <= STD_LOGIC_VECTOR(hundred_digit);

	-- Tens digit evaluation
	tens <= (hundred) when (hundred_digit = "0000") else
		(hundred - 100) when (hundred_digit = "0001") else
		(hundred - 200) when (hundred_digit = "0010") else
		(hundred - 300) when (hundred_digit = "0011") else
		(hundred - 400) when (hundred_digit = "0100") else
		(hundred - 500) when (hundred_digit = "0101") else
		(hundred - 600) when (hundred_digit = "0110") else
		(hundred - 700) when (hundred_digit = "0111") else
		(hundred - 800) when (hundred_digit = "1000") else
		(hundred - 900) when (hundred_digit = "1001") else
		100;

	tens_digit <= "0000" when ((tens < 10) and (tens >- 1)) else
		"0001" when ((tens < 20) and (tens > 9)) else
		"0010" when ((tens < 30) and (tens > 19)) else
		"0011" when ((tens < 40) and (tens > 29)) else
		"0100" when ((tens < 50) and (tens > 39)) else
		"0101" when ((tens < 60) and (tens > 49)) else
		"0110" when ((tens < 70) and (tens > 59)) else
		"0111" when ((tens < 80) and (tens > 69)) else
		"1000" when ((tens < 90) and (tens > 79)) else
		"1001" when ((tens < 100) and (tens > 89)) else
		"1111";

	OUT1 <= STD_LOGIC_VECTOR(tens_digit);

	-- Ones digit evaluation
	ones <= (tens) when (tens_digit = "0000") else
		(tens - 10) when (tens_digit = "0001") else
		(tens - 20) when (tens_digit = "0010") else
		(tens - 30) when (tens_digit = "0011") else
		(tens - 40) when (tens_digit = "0100") else
		(tens - 50) when (tens_digit = "0101") else
		(tens - 60) when (tens_digit = "0110") else
		(tens - 70) when (tens_digit = "0111") else
		(tens - 80) when (tens_digit = "1000") else
		(tens - 90) when (tens_digit = "1001") else
		10;

	OUT0 <= "0000" when (ones = 0) else
		"0001" when (ones = 1) else
		"0010" when (ones = 2) else
		"0011" when (ones = 3) else
		"0100" when (ones = 4) else
		"0101" when (ones = 5) else
		"0110" when (ones = 6) else
		"0111" when (ones = 7) else
		"1000" when (ones = 8) else
		"1001" when (ones = 9) else
		"1111";

end behavior;