------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of processing unit
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity processingUnit is
    port (
        IN1      : in  STD_LOGIC_VECTOR(7 downto 0);  -- Input data
        CLK, RES : in  STD_LOGIC;                     -- Clock and reset
        OUT1     : out STD_LOGIC_VECTOR(12 downto 0)  -- Processed data
    );
end processingUnit;

architecture structural of processingUnit is

    -- Shift register to store previous values
    component shiftRegn is
        generic (
            N_bit : INTEGER
        );
        port (
            R    : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0);
            CLK  : in  STD_LOGIC;
            RES  : in  STD_LOGIC;
            LD   : in  STD_LOGIC;
            Q0   : out STD_LOGIC_VECTOR((N_bit - 1) downto 0);
            Q1   : out STD_LOGIC_VECTOR((N_bit - 1) downto 0);
            Q2   : out STD_LOGIC_VECTOR((N_bit - 1) downto 0);
            Q3   : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)
        );
    end component;

    -- Multipliers
    component multiplier_025 is
        port (
            IN1  : in  STD_LOGIC_VECTOR(7 downto 0);
            Q1   : out STD_LOGIC_VECTOR(12 downto 0)
        );
    end component;

    component multiplier_05 is
        port (
            IN1  : in  STD_LOGIC_VECTOR(7 downto 0);
            Q1   : out STD_LOGIC_VECTOR(12 downto 0)
        );
    end component;

    component multiplier_2 is
        port (
            IN1  : in  STD_LOGIC_VECTOR(7 downto 0);
            Q1   : out STD_LOGIC_VECTOR(12 downto 0)
        );
    end component;

    component multiplier_4 is
        port (
            IN1  : in  STD_LOGIC_VECTOR(7 downto 0);
            Q1   : out STD_LOGIC_VECTOR(12 downto 0)
        );
    end component;

    -- Registers for intermediate results
    component regn is
        generic (
            N_bit : INTEGER
        );
        port (
            R    : in  STD_LOGIC_VECTOR((N_bit - 1) downto 0);
            CLK  : in  STD_LOGIC;
            RES  : in  STD_LOGIC;
            LD   : in  STD_LOGIC;
            Q    : out STD_LOGIC_VECTOR((N_bit - 1) downto 0)
        );
    end component;

    -- 13-bit Ripple Carry Adder for summation and subtraction
    component RCA_13bit is
        port (
            A1   : in  STD_LOGIC_VECTOR(12 downto 0);
            A2   : in  STD_LOGIC_VECTOR(12 downto 0);
            P    : in  STD_LOGIC;  -- Mode (Addition/Subtraction)
            B1   : out STD_LOGIC_VECTOR(12 downto 0);
            COUT : out STD_LOGIC
        );
    end component;

    -- Signal declarations
    signal DATA0, DATA1, DATA2, DATA3                      : STD_LOGIC_VECTOR(7 downto 0);
    signal DATA0_MUL, DATA1_MUL, DATA2_MUL, DATA3_MUL      : STD_LOGIC_VECTOR(12 downto 0);
    signal OPD0, OPD1, OPD2, OPD3                          : STD_LOGIC_VECTOR(12 downto 0);
    signal INT_RES0, INT_RES1, INT_RES0_REG, INT_RES1_REG  : STD_LOGIC_VECTOR(12 downto 0);
    signal OUT_REG                                         : STD_LOGIC_VECTOR(12 downto 0);

begin

    -- Shift register component
    REG0 : shiftRegn
    generic map (
        N_bit => 8
    )
    port map (
        R   => IN1,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q0  => DATA0,
        Q1  => DATA1,
        Q2  => DATA2,
        Q3  => DATA3
    );

    -- Multipliers
    MUL_05  : multiplier_05
    port map (
        IN1 => DATA0,
        Q1  => DATA0_MUL
    );

    MUL_2   : multiplier_2
    port map (
        IN1 => DATA1,
        Q1  => DATA1_MUL
    );

    MUL_4   : multiplier_4
    port map (
        IN1 => DATA2,
        Q1  => DATA2_MUL
    );

    MUL_025 : multiplier_025
    port map (
        IN1 => DATA3,
        Q1  => DATA3_MUL
    );

    -- Registers to store multiplication results
    REG1_0  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => DATA0_MUL,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => OPD0
    );

    REG1_1  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => DATA1_MUL,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => OPD1
    );

    REG1_2  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => DATA2_MUL,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => OPD2
    );

    REG1_3  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => DATA3_MUL,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => OPD3
    );

    -- Adder blocks
    ADD0    : RCA_13bit
    port map (
        A1 => OPD0,
        A2 => OPD1,
        P  => '0',
        B1 => INT_RES0
    );

    ADD1    : RCA_13bit
    port map (
        A1 => OPD2,
        A2 => OPD3,
        P  => '0',
        B1 => INT_RES1
    );

    -- Registers to store sum results
    REG2_0  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => INT_RES0,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => INT_RES0_REG
    );

    REG2_1  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => INT_RES1,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => INT_RES1_REG
    );

    -- Final subtraction of sums
    ADD2    : RCA_13bit
    port map (
        A1 => INT_RES1_REG,
        A2 => INT_RES0_REG,
        P  => '1',
        B1 => OUT_REG
    );

    -- Output final processed data
    REG3_0  : regn
    generic map (
        N_bit => 13
    )
    port map (
        R   => OUT_REG,
        CLK => CLK,
        RES => RES,
        LD  => '1',
        Q   => OUT1
    );

end structural;

