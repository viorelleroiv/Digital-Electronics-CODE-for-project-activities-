---------------------------------
-- Group n. 08 - Laboratory n. 05
-- Exercise n. 3 - Title: Two-process FSM
-- VHDL model of "two_process_FSM_tb"
---------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY two_process_FSM_tb IS
END two_process_FSM_tb;

ARCHITECTURE testbench OF two_process_FSM_tb IS

    -- Component Declaration
    COMPONENT two_process_FSM IS
        PORT (
            SW   : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
            KEY  : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    -- Signal Declaration
    SIGNAL reset_tb, clk : STD_LOGIC;
    SIGNAL w_tb          : STD_LOGIC := '1';
    SIGNAL SW_tb, LEDR_tb : STD_LOGIC_VECTOR(9 DOWNTO 0);

BEGIN
    -- Assignments
    SW_tb(9 DOWNTO 0) <= "00000000" & w_tb & reset_tb;

    PROCESS
    BEGIN
        -- Initial 'w = 0' branch test
        w_tb <= '0';
        reset_tb <= '0'; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        reset_tb <= '1';
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;

        -- Initial 'w = 1' branch test
        reset_tb <= '0';
        clk <= '0';
        WAIT FOR 1 ns;
        reset_tb <= '1';
        clk <= '1';
        w_tb <= '1';
        WAIT FOR 1 ns; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;

        -- Mixed branches test
        w_tb <= '0';
        reset_tb <= '0'; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        reset_tb <= '1';
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        w_tb <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns; 
        clk <= '0';
        w_tb <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns; 
        clk <= '0';
        WAIT FOR 1 ns;
        clk <= '1';
        WAIT FOR 1 ns;

        WAIT;
    END PROCESS;

    -- Unit Under Test (UUT) Instantiation
    uut : two_process_FSM
    PORT MAP(
        SW(9 DOWNTO 0)       => SW_tb, 
        KEY(0)               => clk, 
        KEY(3 DOWNTO 1)      => "000", 
        LEDR(9 DOWNTO 0)     => LEDR_tb 
    );

END testbench;