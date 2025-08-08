------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity digitalFilter is
	port (
		START, CLK, RES : in  STD_LOGIC;          -- Start signal, Clock, and active-low reset
		DATA_IN         : in  signed(7 downto 0); -- Input data
		DONE            : out STD_LOGIC           -- Done signal
	);
end digitalFilter;

architecture structure of digitalFilter is
	-- Component declarations
	component datapath is
		port (
			CNT0_ENABLE, SHIFTREG_EN : in  STD_LOGIC;                   -- DP status signals
			END_CNT                  : out STD_LOGIC;                   -- DP control signal
			DATA_IN                  : in  signed(7 downto 0);          -- Input data from memory
			DATA_OUT                 : out signed(7 downto 0);          -- Output data to memory
			CLK, RES                 : in  STD_LOGIC;                   -- Clock and active-low reset signals
			ADDA_SEL, ADDB_SEL       : in  STD_LOGIC;                   -- Selector signals for memory addresses
			MEMA_ADD, MEMB_ADD       : out STD_LOGIC_VECTOR(9 downto 0) -- Memory addresses
		);
	end component;

	component controlUnit is
		port (
			CLK, RESN                 : in  STD_LOGIC; -- Clock and active-low reset signals
			START, CNT1               : in  STD_LOGIC; -- Start signal and counter status
			MEMA_CS, MEMA_RD, MEMA_WR : out STD_LOGIC; -- Memory A control signals
			MEMB_CS, MEMB_RD, MEMB_WR : out STD_LOGIC; -- Memory B control signals
			EN_CNT                    : out STD_LOGIC; -- Enable counter signal
			RES_REG0                  : out STD_LOGIC; -- Reset signal for register
			ADDA_SEL, ADDB_SEL        : out STD_LOGIC; -- Selector signals for memory addresses
			DONE                      : out STD_LOGIC  -- Done signal
		);
	end component;

	component memory is
		port (
			CLK, CS, WR, RD : in  STD_LOGIC;                    -- Clock, memory's control signals 
			ADDRESS         : in  STD_LOGIC_VECTOR(9 downto 0); -- Memory address
			DATA_IN         : in  signed(7 downto 0);           -- Input data
			DATA_OUT        : out signed(7 downto 0)            -- Output data
		);
	end component;

	signal CNT0_ENABLE               : STD_LOGIC;                    -- Counter enable signal
	signal DP_DATA_IN, DP_DATA_OUT   : SIGNED(7 downto 0);           -- Datapath input/output signals
	signal ADDA_SEL, ADDB_SEL        : STD_LOGIC;                    -- Address selector signals
	signal MEMA_ADD, MEMB_ADD        : STD_LOGIC_VECTOR(9 downto 0); -- Memory addresses
	signal END_CNT                   : STD_LOGIC;                    -- End of count signal
	signal MEMA_CS, MEMA_RD, MEMA_WR : STD_LOGIC;                    -- Memory A control signals
	signal MEMB_CS, MEMB_RD, MEMB_WR : STD_LOGIC;                    -- Memory B control signals
	signal RES_REG                   : STD_LOGIC;                    -- Reset signal for register

begin

	DP : datapath
	port map(
		CNT0_ENABLE => CNT0_ENABLE, -- Counter enable input
		SHIFTREG_EN => RES_REG,     -- Reset signal for shift register
		END_CNT     => END_CNT,     -- Signal indicating end of counting
		DATA_IN     => DP_DATA_IN,  -- Input data to datapath
		DATA_OUT    => DP_DATA_OUT, -- Output data from datapath
		CLK         => CLK,         -- Clock signal
		RES         => RES,         -- Reset signal
		ADDA_SEL    => ADDA_SEL,    -- Selector for address of memory A 
		ADDB_SEL    => ADDB_SEL,    -- Selector for address of memory B
		MEMA_ADD    => MEMA_ADD,    -- Address for Memory A
		MEMB_ADD    => MEMB_ADD     -- Address for Memory B
	);

	CU : controlUnit
	port map(
		CLK      => CLK,         -- Clock signal
		RESN     => RES,         -- Reset signal
		START    => START,       -- Start signal
		CNT1     => END_CNT,     -- Signal from counter to control unit
		MEMA_CS  => MEMA_CS,     -- Component select for Memory A
		MEMA_RD  => MEMA_RD,     -- Read signal for Memory A
		MEMA_WR  => MEMA_WR,     -- Write signal for Memory A
		MEMB_CS  => MEMB_CS,     -- Component select for Memory B
		MEMB_RD  => MEMB_RD,     -- Read signal for Memory B
		MEMB_WR  => MEMB_WR,     -- Write signal for Memory B
		EN_CNT   => CNT0_ENABLE, -- Enable counter signal
		RES_REG0 => RES_REG,     -- Reset register signal
		ADDA_SEL => ADDA_SEL,    -- Selector for address of memory A 
		ADDB_SEL => ADDB_SEL,    -- Selector for address of memory B
		DONE     => DONE         -- Done signal
	);

	MEMA : memory
	port map(
		CLK      => CLK,       -- Clock signal
		CS       => MEMA_CS,   -- Component select
		WR       => MEMA_WR,   -- Write enable
		RD       => MEMA_RD,   -- Read enable
		ADDRESS  => MEMA_ADD,  -- Address line
		DATA_IN  => DATA_IN,   -- Input data
		DATA_OUT => DP_DATA_IN -- Output data to datapath
	);

	MEMB : memory
	port map(
		CLK     => CLK,        -- Clock signal
		CS      => MEMB_CS,    -- Component select
		WR      => MEMB_WR,    -- Write enable
		RD      => MEMB_RD,    -- Read enable
		ADDRESS => MEMB_ADD,   -- Address line
		DATA_IN => DP_DATA_OUT -- Input data from datapath
	);

end structure;
