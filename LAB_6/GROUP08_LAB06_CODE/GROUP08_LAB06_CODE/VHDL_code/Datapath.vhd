------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of datapath
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Datapath entity for handling arithmetic operations and memory addresses
entity datapath is
    port (
        CNT0_ENABLE, SHIFTREG_EN  : in  STD_LOGIC;  -- Counter enable and shift register control (active low)
        END_CNT                   : out STD_LOGIC;  -- End counter signal
        DATA_IN                   : in  signed(7 downto 0);  -- Input data
        DATA_OUT                  : out signed(7 downto 0);  -- Processed output data
        CLK, RES                  : in  STD_LOGIC;  -- Clock and reset signals
        ADDA_SEL, ADDB_SEL        : in  STD_LOGIC;  -- Multiplexer selector signals
        MEMA_ADD, MEMB_ADD        : out STD_LOGIC_VECTOR(9 downto 0)  -- Memory address outputs
    );
end datapath;

architecture structure of datapath is

    -- Modulo counter for memory addressing
    component moduloCounter
        generic (
            N_bits : INTEGER; -- Number of bits in the counter
            MODULO : INTEGER  -- Counter limit
        );
        port (
            EN, CLK, CLR   : in  STD_LOGIC;  -- Enable, clock, and clear (active low)
            COUNT          : out STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Current count
            MOD_REACHED    : out STD_LOGIC
        );
    end component;

    -- Processing unit for arithmetic operations
    component processingUnit
        port (
            IN1      : in  STD_LOGIC_VECTOR(7 downto 0);  -- Input data
            CLK, RES : in  STD_LOGIC;  -- Clock and reset
            OUT1     : out STD_LOGIC_VECTOR(12 downto 0)  -- Intermediate output data
        );
    end component;

    -- Converter for signed 13-bit to 8-bit values
    component converterUnit is
        port (
            CLK        : in  STD_LOGIC;
            RES      : in  STD_LOGIC;
            inputA     : in  STD_LOGIC_VECTOR(12 downto 0);
            outputREG  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- 10-bit multiplexer for memory addressing
    component mux10bit is
        port (
            IN0, IN1  : in  STD_LOGIC_VECTOR(9 downto 0); -- Inputs
            SEL       : in  STD_LOGIC;  -- Selector signal
            OUT1      : out STD_LOGIC_VECTOR(9 downto 0) -- Output
        );
    end component;

    -- Delay unit for synchronization
    component delayUnit is
        generic (
            N_bit : INTEGER
        );
        port (
            R      : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0);  -- Input
            CLK, RES: in  STD_LOGIC;  -- Clock, reset, and load control
            OUT1   : out STD_LOGIC_VECTOR((N_bit - 1) downto 0) -- Delayed output
        );
    end component;

    -- Comparator for address boundaries
    component comparator is
        generic (
            N_bits : INTEGER; -- Bit width
            INT    : INTEGER  -- Comparison value
        );
        port (
            IN1  : in  STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Input
            OUT1 : out STD_LOGIC -- Output status
        );
    end component;

    signal STD_DATA_IN, STD_DATA_OUT : std_logic_vector(7 downto 0);
    signal CNT0_OUT, CNT0_DELAYED    : STD_LOGIC_VECTOR(9 downto 0);
    signal INTERMEDIATE_DATA         : std_logic_vector(12 downto 0);
    signal MEMB_INTERMEDIATE         : STD_LOGIC_VECTOR(9 downto 0);

begin

    -- Modulo counter for memory address handling
    CNT0: moduloCounter
    generic map(
        N_bits => 10,
        MODULO => 10  -- 1024 in the final version
    )
    port map(
        EN     => CNT0_ENABLE,
        CLK    => CLK,
        CLR    => RES,
        COUNT  => CNT0_OUT
    );

    -- Delay component
    DEL: delayUnit
    generic map(
        N_bit => 10
    )
    port map(
        R      => CNT0_OUT,
        CLK    => CLK,
        RES    => SHIFTREG_EN,
        OUT1   => CNT0_DELAYED
    );

    -- Convert input data from signed to standard logic vector
    STD_DATA_IN <= std_logic_vector(DATA_IN);

    -- Processing unit for arithmetic operations
    U1: processingUnit
    port map(
        IN1    => STD_DATA_IN,
        CLK    => CLK,
        RES    => SHIFTREG_EN,  -- Active-low reset
        OUT1   => INTERMEDIATE_DATA
    );

    -- Convert processed data back to signed format
    DATA_OUT <= signed(STD_DATA_OUT);

    -- Conversion module from 13-bit to 8-bit output
    U2: converterUnit
    port map(
        clk       => CLK,
        RES     => '1',
        inputA    => INTERMEDIATE_DATA,
        outputREG => STD_DATA_OUT
    );

    -- Multiplexer for Memory A address selection
    MUX0: mux10bit
    port map(
        IN0  => CNT0_OUT,
        IN1  => CNT0_DELAYED,
        SEL  => ADDA_SEL,
        OUT1 => MEMA_ADD
    );

    -- Multiplexer for Memory B address selection
    MUX1: mux10bit
    port map(
        IN0  => CNT0_OUT,
        IN1  => CNT0_DELAYED,
        SEL  => ADDB_SEL,
        OUT1 => MEMB_INTERMEDIATE
    );

    -- Assign Memory B address
    MEMB_ADD <= MEMB_INTERMEDIATE;

    -- Comparator for signaling end of memory addressing
    CMP: comparator
    generic map(
        N_bits => 10,
        INT    => 9  -- 1023 in final version
    )
    port map(
        IN1  => MEMB_INTERMEDIATE,
        OUT1 => END_CNT
    );

end structure;

