------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of testbench of control unit
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath_tb is
end datapath_tb;

architecture Behavioral of datapath_tb is

    component datapath
        port (
            CNT0_ENABLE, SHIFTREG_EN  : in  STD_LOGIC;  -- Counter enable and shift register control (active low)
            END_CNT                   : out STD_LOGIC;  -- End counter signal
            DATA_IN                   : in  signed(7 downto 0);  -- Input data
            DATA_OUT                  : out signed(7 downto 0);  -- Processed output data
            CLK, RES                  : in  STD_LOGIC;  -- Clock and reset signals
            ADDA_SEL, ADDB_SEL        : in  STD_LOGIC;  -- Multiplexer selector signals
            MEMA_ADD, MEMB_ADD        : out STD_LOGIC_VECTOR(9 downto 0)  -- Memory address outputs
        );
    end component;

    signal CLK, RES, CNT0_ENABLE, SHIFTREG_EN, ADDA_SEL, ADDB_SEL : STD_LOGIC := '0';
    signal DATA_IN  : signed(7 downto 0) := (others => '0');
    signal DATA_OUT : signed(7 downto 0);
    signal MEMA_ADD, MEMB_ADD : STD_LOGIC_VECTOR(9 downto 0);
    signal END_CNT  : STD_LOGIC;

begin

    UUT: datapath
    port map(
        CNT0_ENABLE => CNT0_ENABLE,
        SHIFTREG_EN => SHIFTREG_EN,
        END_CNT     => END_CNT,
        DATA_IN     => DATA_IN,
        DATA_OUT    => DATA_OUT,
        CLK         => CLK,
        RES         => RES,
        ADDA_SEL    => ADDA_SEL,
        ADDB_SEL    => ADDB_SEL,
        MEMA_ADD    => MEMA_ADD,
        MEMB_ADD    => MEMB_ADD
    );

    -- Clock process
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus process
stim_proc : process
begin
    RES <= '0';
    wait for 20 ns;
    RES <= '1';

    CNT0_ENABLE <= '1';
    SHIFTREG_EN <= '0';
    ADDA_SEL <= '0';
    ADDB_SEL <= '0';
    DATA_IN <= to_signed(10, 8);  -- Test input 10
    wait for 20 ns;

    CNT0_ENABLE <= '1';  
    SHIFTREG_EN <= '1';
    ADDA_SEL <= '0';
    ADDB_SEL <= '1';  
    DATA_IN <= to_signed(-25, 8); -- Test input -25
    wait for 20 ns;

    DATA_IN <= to_signed(-50, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(-75, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(-100, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(-125, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(-150, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(-175, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(-200, 8);
    wait for 20 ns;

    DATA_IN <= to_signed(50, 8);  -- Test input 50
    wait for 20 ns;

    CNT0_ENABLE <= '1';
    SHIFTREG_EN <= '0';
    DATA_IN <= to_signed(-128, 8); -- Test input -128
    wait for 20 ns;

    ADDA_SEL <= '1';
    ADDB_SEL <= '0';
    DATA_IN <= to_signed(75, 8);  -- Test input 75
    wait for 20 ns;

    CNT0_ENABLE <= '0';
    SHIFTREG_EN <= '1';
    DATA_IN <= to_signed(0, 8);  -- Test input 0
    wait for 20 ns;

    CNT0_ENABLE <= '0';
    SHIFTREG_EN <= '0';
    DATA_IN <= to_signed(100, 8);  -- Test input 100
    wait for 20 ns;

    CNT0_ENABLE <= '0';
    ADDA_SEL <= '0';
    ADDB_SEL <= '1';
    DATA_IN <= to_signed(-90, 8);  -- Test input -90
    wait for 20 ns;
    wait;
end process;


end Behavioral;

