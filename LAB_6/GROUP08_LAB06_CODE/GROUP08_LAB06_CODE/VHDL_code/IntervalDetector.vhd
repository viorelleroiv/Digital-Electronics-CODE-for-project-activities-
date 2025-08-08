------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL model of "intervaldetector"
------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IntervalDetector is
    port (
        data_in : in  STD_LOGIC_VECTOR(10 downto 0); -- 11-bit input data
        Z       : out STD_LOGIC_VECTOR(1 downto 0)   -- 2-bit output representing the detected range
    );
end IntervalDetector;

architecture Behavioral of IntervalDetector is
begin
    process(data_in)
    begin
        -- Check if the input value is less than -128
        if signed(data_in) < -128 then
            Z <= "01";  -- output "01" indicates an underflow condition
        
        -- Check if the input value is greater than 127
        elsif signed(data_in) > 127 then
            Z <= "10";  -- output "10" indicates an overflow condition
        
        -- Input value is within the valid range (-128 to 127)
        else
            Z <= "00";  -- output "00" Indicates a valid range
        end if;
    end process;
end Behavioral;

