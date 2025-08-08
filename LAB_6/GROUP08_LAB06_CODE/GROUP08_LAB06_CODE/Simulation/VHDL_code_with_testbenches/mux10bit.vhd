------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of 10-bit multiplexer
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux10bit is
	port (
		IN0, IN1 : in  STD_LOGIC_VECTOR(9 downto 0); -- two 10-bit input values
		SEL      : in  STD_LOGIC;                    -- selection signal
		OUT1     : out STD_LOGIC_VECTOR(9 downto 0)  -- 10-bit output
	);
end mux10bit;

architecture structural of mux10bit is
begin
	OUT1(0) <= (IN0(0) and not(SEL)) or (IN1(0) and SEL);
	OUT1(1) <= (IN0(1) and not(SEL)) or (IN1(1) and SEL);
	OUT1(2) <= (IN0(2) and not(SEL)) or (IN1(2) and SEL);
	OUT1(3) <= (IN0(3) and not(SEL)) or (IN1(3) and SEL);
	OUT1(4) <= (IN0(4) and not(SEL)) or (IN1(4) and SEL);
	OUT1(5) <= (IN0(5) and not(SEL)) or (IN1(5) and SEL);
	OUT1(6) <= (IN0(6) and not(SEL)) or (IN1(6) and SEL);
	OUT1(7) <= (IN0(7) and not(SEL)) or (IN1(7) and SEL);
	OUT1(8) <= (IN0(8) and not(SEL)) or (IN1(8) and SEL);
	OUT1(9) <= (IN0(9) and not(SEL)) or (IN1(9) and SEL);

end structural;
