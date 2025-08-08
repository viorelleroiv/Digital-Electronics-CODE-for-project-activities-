------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of multiplier by 4
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_4 is
    port (
        IN1          : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input value
        Q1           : out STD_LOGIC_VECTOR(12 downto 0)  -- 13-bit output value
    );
end multiplier_4;

architecture structure of multiplier_4 is

    -- Resized version of the input
    signal IN1_RESIZED: STD_LOGIC_VECTOR(12 downto 0);

begin
    -- Extend the input
    IN1_resized <= (IN1(7)&IN1(7)&IN1(7)&IN1&"00");

    -- Multiply by 4 by shifting left twice
    Q1 <= (IN1_RESIZED(10 downto 0)&"00");
end structure;

