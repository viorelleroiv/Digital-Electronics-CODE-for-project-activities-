------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL model of "mux2x1_11bit"
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_11bit is
	port (
		SEL      : in  STD_LOGIC;                     -- selection signal
		IN0, IN1 : in  STD_LOGIC_VECTOR(10 downto 0); -- two input options
		OUT_MUX  : out STD_LOGIC_VECTOR(10 downto 0)  -- selected output
	);
end mux2x1_11bit;

architecture behavioral of mux2x1_11bit is
begin
	-- select between IN0 and IN1 based on SEL signal
	OUT_MUX <= IN1 when SEL = '1' else
		IN0;
end behavioral;
