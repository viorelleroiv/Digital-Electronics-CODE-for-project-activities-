------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 4 - BIN to BCD converter
-- VHDL code of decoder
------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity segment_display is
	port (
		v_0, v_1, v_2, v_3 : in  STD_LOGIC;
		EOX                : out STD_LOGIC_VECTOR(0 to 6)
	);
end segment_display;

architecture behavioural of segment_display is
begin
	process (v_0, v_1, v_2, v_3) -- any change in the inputs activates the process
		variable bit_series : STD_LOGIC_VECTOR(3 downto 0);
	begin
		-- concatenate the bits to form the binary number (v_3 is the MSB)
		bit_series := v_3 & v_2 & v_1 & v_0;

		if (bit_series = "0000") then
			EOX <= "0000001"; -- 0
		elsif (bit_series = "0001") then
			EOX <= "1001111"; -- 1
		elsif (bit_series = "0010") then
			EOX <= "0010010"; -- 2
		elsif (bit_series = "0011") then
			EOX <= "0000110"; -- 3
		elsif (bit_series = "0100") then
			EOX <= "1001100"; -- 4
		elsif (bit_series = "0101") then
			EOX <= "0100100"; -- 5
		elsif (bit_series = "0110") then
			EOX <= "0100000"; -- 6
		elsif (bit_series = "0111") then
			EOX <= "0001111"; -- 7
		elsif (bit_series = "1000") then
			EOX <= "0000000"; -- 8
		elsif (bit_series = "1001") then
			EOX <= "0001100"; -- 9
		else
			EOX <= "1111111"; -- for invalid values: all segments off
		end if;
	end process;
end behavioural;
