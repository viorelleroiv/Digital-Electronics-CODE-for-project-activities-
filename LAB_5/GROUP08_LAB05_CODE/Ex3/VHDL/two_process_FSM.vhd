---------------------------------
-- Group n. 08 - Laboratory n. 05
-- Exercise n. 3 - Title: Two-process FSM
-- VHDL model of "two_process_FSM"
---------------------------------

library ieee;
use ieee.std_logic_1164.all;

-- Definition of Input and Output ports
entity two_process_FSM is
    port (
        SW   : in  STD_LOGIC_VECTOR(9 downto 0);
        LEDR : out STD_LOGIC_VECTOR(9 downto 0);
        KEY  : in  STD_LOGIC_VECTOR(3 downto 0)
    );
end two_process_FSM;

-- Declaration of signals
architecture behaviour of two_process_FSM is
    signal w, reset, clk, z : STD_LOGIC;
    type State_type is (A, B, C, D, E, F, G, H, I);
    signal y_Q, y_D : State_type; -- y_Q is the current state, y_D is the next state

begin
    -- State table process
    process (w, y_Q)
    begin
        case y_Q is
            when A => 
                if w = '0' then
                    y_D <= B;
                else
                    y_D <= F;
                end if;
            when B => 
                if w = '0' then
                    y_D <= C;
                else
                    y_D <= F;
                end if;
            when C => 
                if w = '0' then
                    y_D <= D;
                else
                    y_D <= F;
                end if;
            when D => 
                if w = '0' then
                    y_D <= E;
                else
                    y_D <= F;
                end if;
            when E => 
                if w = '0' then
                    y_D <= E;
                else
                    y_D <= F;
                end if;
            when F => 
                if w = '0' then
                    y_D <= B;
                else
                    y_D <= G;
                end if;
            when G => 
                if w = '0' then
                    y_D <= B;
                else
                    y_D <= H;
                end if;
            when H => 
                if w = '0' then
                    y_D <= B;
                else
                    y_D <= I;
                end if;
            when I => 
                if w = '0' then
                    y_D <= B;
                else
                    y_D <= I;
                end if;
            when others => 
                y_D <= A;
        end case;
    end process;

    -- Output process
    process (y_Q)
    begin
        z <= '0';
        case y_Q is
            when E | I => 
                z <= '1';
            when others => 
                z <= '0';
        end case;
    end process;

    -- Clock process
    process (clk)
    begin
        if (reset = '0' and rising_edge(clk)) then
            y_Q <= A;
        else
            if (clk = '1' and clk'EVENT) then
                y_Q <= y_D;
            end if;
        end if;
    end process;

    -- Assignment for output z and the LEDs
    w                <= SW(1);       -- FSM input signal
    reset            <= SW(0);       -- FSM reset signal
    clk              <= KEY(0);      -- clock of the FSM
    LEDR(0)          <= z;           -- FSM output signal (LEDR0)
    LEDR(9 downto 1) <= "000000000"; -- turn off all other LEDs

end behaviour;