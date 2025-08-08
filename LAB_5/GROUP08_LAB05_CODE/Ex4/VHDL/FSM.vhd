------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- VHDL code of FSM
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity FSM is
    port (
        PULSE_1Hz, CLK, RES        : in  STD_LOGIC;                -- New state, Clock, and Reset
        REG_DATA                   : out STD_LOGIC_VECTOR(0 to 6); -- Register outputs
        LOOP_EN                    : out std_logic
    );
end FSM;

architecture behaviour of FSM is

    -- State type enumeration
    type State_type is 
        (START, LOAD_H, LOAD_E, LOAD_L1, LOAD_L2, LOAD_O, LOAD_blank, LOOP_CHARACTERS);
    signal CS, FS : State_type; -- Current state and next state signals

begin

    -- State memory process
    MEM : process (CLK, RES)
    begin
        if RES = '0' then
            CS <= START; -- Reset state
        elsif rising_edge(CLK) then
            if (PULSE_1Hz = '1') then
                CS <= FS; -- Update current state
            end if;
        end if;
    end process;

    -- Next state logic
    CC1 : process (CS)
    begin
        case CS is
            when START           => FS <= LOAD_H;
            when LOAD_H          => FS <= LOAD_E;
            when LOAD_E          => FS <= LOAD_L1;
            when LOAD_L1         => FS <= LOAD_L2;
            when LOAD_L2         => FS <= LOAD_O;
            when LOAD_O          => FS <= LOAD_blank;
            when LOAD_blank      => FS <= LOOP_CHARACTERS;
            when LOOP_CHARACTERS => FS <= LOOP_CHARACTERS;
            when others          => FS <= START;
        end case;
    end process;

    CC2 : process (CS)
    begin
        case CS is
            when START =>
                LOOP_EN  <= '0';
                REG_DATA <= "1111111";
            when LOAD_H =>
                LOOP_EN  <= '0';
                REG_DATA <= "1001000";
            when LOAD_E =>
                LOOP_EN  <= '0';
                REG_DATA <= "0110000";
            when LOAD_L1 =>
                LOOP_EN  <= '0';
                REG_DATA <= "1110001";
            when LOAD_L2 =>
                LOOP_EN  <= '0';
                REG_DATA <= "1110001";
            when LOAD_O =>
                LOOP_EN  <= '0';
                REG_DATA <= "0000001";
            when LOAD_blank =>
                LOOP_EN  <= '0';
                REG_DATA <= "1111111";
            when LOOP_CHARACTERS =>
                LOOP_EN  <= '1';
                REG_DATA <= "0000000";
            when others =>
                LOOP_EN  <= '0';
                REG_DATA <= "0000000";
        end case;
    end process;

end behaviour;
