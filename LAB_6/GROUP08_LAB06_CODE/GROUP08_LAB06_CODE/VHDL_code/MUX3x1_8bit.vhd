------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL model of "mux3x1_8bit"
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- entity declaration for a 3-to-1 multiplexer
entity mux3x1_8bit is
    port (
        SEL   : in  std_logic_vector(1 downto 0); -- selection signal (2 bits)
        IN0, IN1, IN2 : in  std_logic_vector(7 downto 0); -- three input options
        OUT_MUX : out std_logic_vector(7 downto 0)  -- selected output
    );
end mux3x1_8bit;

architecture behavioral of mux3x1_8bit is
begin
    -- select between IN0, IN1, and IN2 based on SEL signal
    with SEL select
        OUT_MUX <= IN0 when "10", -- selects IN0 when SEL is "10"
                   IN1 when "01", -- selects IN1 when SEL is "01"
                   IN2 when others; -- selects IN2 for all other cases
end behavioral;
