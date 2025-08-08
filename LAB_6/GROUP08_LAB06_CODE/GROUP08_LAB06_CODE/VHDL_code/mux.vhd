------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of multiplexer
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port (
        IN0, IN1, SEL : in  STD_LOGIC;  -- Two inputs and selection signal
        OUT1          : out STD_LOGIC   -- Output of the multiplexer
    );
end mux;

architecture structural of mux is
begin

    OUT1 <= (IN0 and not(SEL)) or (IN1 and SEL);
end structural;

