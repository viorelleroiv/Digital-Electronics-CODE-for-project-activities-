------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of multiplier by 0.5
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_05 is
    port (
        IN1          : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input value
        Q1           : out STD_LOGIC_VECTOR(12 downto 0)  -- 13-bit output value
    );
end multiplier_05;

architecture structure of multiplier_05 is

    -- Resized version of the input
    signal IN1_RESIZED: STD_LOGIC_VECTOR(12 downto 0);

begin

    -- Extend the input
    IN1_resized <= (IN1(7)&IN1(7)&IN1(7)&IN1&"00");

    -- Multiply by 0.5
    Q1 <= (IN1_RESIZED(12)&IN1_RESIZED(12 downto 2)&IN1_RESIZED(1));
end structure;

