------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of testbench of control unit
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit_tb is
end controlUnit_tb;

architecture Behavior of controlUnit_tb is

	component controlUnit is
	port (
		CLK, RESN                 : in  STD_LOGIC; -- Clock and reset signals
		START, CNT1               : in  STD_LOGIC; -- Start signal and counter feedback
		MEMA_CS, MEMA_RD, MEMA_WR : out STD_LOGIC; -- Memory A control signals
		MEMB_CS, MEMB_RD, MEMB_WR : out STD_LOGIC; -- Memory B control signals
		EN_CNT                    : out STD_LOGIC; -- Enable counter
		RES_REG0                  : out STD_LOGIC; -- Register reset
		ADDA_SEL, ADDB_SEL        : out STD_LOGIC; -- Address selection
		DONE                      : out STD_LOGIC  -- Completion flag
	);
end component;

-- Signals
    signal CLK     : STD_LOGIC := '0';
    signal RESN    : STD_LOGIC := '0';  -- Active low reset
    signal START   : STD_LOGIC := '0';
    signal CNT1    : STD_LOGIC := '0';

    signal MEMA_CS, MEMA_RD, MEMA_WR : STD_LOGIC;
    signal MEMB_CS, MEMB_RD, MEMB_WR : STD_LOGIC;
    signal EN_CNT                    : STD_LOGIC;
    signal RES_REG0                  : STD_LOGIC;
    signal ADDA_SEL, ADDB_SEL        : STD_LOGIC;
    signal DONE                      : STD_LOGIC;

    -- Clock generation
    constant clk_period : TIME := 10 ns;

begin

    UUT : controlUnit
    port map(
        CLK      => CLK,
        RESN     => RESN,
        START    => START,
        CNT1     => CNT1,
        MEMA_CS  => MEMA_CS,
        MEMA_RD  => MEMA_RD,
        MEMA_WR  => MEMA_WR,
        MEMB_CS  => MEMB_CS,
        MEMB_RD  => MEMB_RD,
        MEMB_WR  => MEMB_WR,
        EN_CNT   => EN_CNT,
        RES_REG0 => RES_REG0,
        ADDA_SEL => ADDA_SEL,
        ADDB_SEL => ADDB_SEL,
        DONE     => DONE
    );
	-- Clock process
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for clk_period / 2;
            CLK <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc : process
    begin

        wait for 20 ns;
        RESN  <= '1';
        
        wait for clk_period;
        START <= '1';  -- Start the process

        wait for clk_period;
        CNT1  <= '0';  -- No data ready yet

        wait for clk_period;
        CNT1  <= '1';  -- Simulate data readiness to move to PROCESS_DATA

        wait for clk_period;
        CNT1  <= '0';  -- Continue processing

        wait for clk_period;
        CNT1  <= '1';  -- Simulate end of processing

        wait for clk_period;
        START <= '0';  -- Task completed

        wait for clk_period;
        START <= '1';  -- Restart processing

        wait for clk_period;
        CNT1  <= '1';  -- Ready to process again

        -- Finish simulation
        wait;
    end process;

end Behavior;