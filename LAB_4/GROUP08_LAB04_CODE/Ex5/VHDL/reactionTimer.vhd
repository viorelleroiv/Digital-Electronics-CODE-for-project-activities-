------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 5 - Reaction timer
-- VHDL code of timer
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reactionTimer is
	port (
		STOP, CLK, RST : in  STD_LOGIC;                     -- Stop button, clock signal and reset signal (RST active-low)
		IN1            : in  STD_LOGIC_VECTOR(7 downto 0);  -- IDLE time before LEDR 
		COUNT          : out STD_LOGIC_VECTOR(15 downto 0); -- Reaction result (in ms)
		OUT1           : out STD_LOGIC                      -- Led output
	);
end reactionTimer;

architecture structure of reactionTimer is

	component counter16bit is
		port (
			EN, CLK, CLR : in  STD_LOGIC;
			COUNT        : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

	component comparator is
		generic
		(
			N_bits : INTEGER; -- Define number of bits of the counter
			INT    : INTEGER
		);
		port (
			IN1  : in  STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Input signal
			OUT1 : out STD_LOGIC                                -- Output signal
		);
	end component;

	component comparator_typeB is
		generic
		(
			N_bits : INTEGER -- Define number of bits of the counter
		);
		port (
			IN1, IN2 : in  STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Input signal
			OUT1     : out STD_LOGIC                                -- Output signal
		);
	end component;

	component moduloCounter is
		generic
		(
			N_bits : INTEGER; -- Define number of bits of the counter
			MODULO : INTEGER
		);
		port (
			EN, CLK, CLR : in  STD_LOGIC;                              -- Input signals: Enable, Clock and Clear (CLR is active-low)
			COUNT        : out STD_LOGIC_VECTOR((N_bits - 1) downto 0) -- Output signal
		);
	end component;

	component gated_SRlatch is
		port (
			Clk, R, S : in  STD_LOGIC;
			Q         : out STD_LOGIC);
	end component;

	signal WAIT_CNT, PULSE1kHz_CNT                                                                       : STD_LOGIC_VECTOR(15 downto 0);
	signal IDLE_TIME_ELAPSED, STOP_PRESSED, ENABLE_REACT_CNT, NOT_STOP, NOT_RST, WAIT_CNT_EN, PULSE_1kHz : STD_LOGIC;
	signal IN1_INTEGER                                                                                   : INTEGER;

begin
	IN1_INTEGER <= to_integer(unsigned(IN1));
	NOT_STOP    <= not(STOP);
	NOT_RST     <= not(RST);

	WAIT_CNT_EN <= PULSE_1kHz and not(IDLE_TIME_ELAPSED);

	CNT0 : counter16bit
	port map(
		EN    => WAIT_CNT_EN,
		CLK   => CLK,
		CLR   => RST,
		COUNT => WAIT_CNT
	);

	CMP : comparator_typeB
	generic
	map(
	N_bits => 8
	)
	port map(
		IN1  => WAIT_CNT(7 downto 0),
		IN2  => IN1,
		OUT1 => IDLE_TIME_ELAPSED
	);

	ENABLE_REACT_CNT <= not(STOP_PRESSED) and IDLE_TIME_ELAPSED and PULSE_1kHz;

	CNT1 : counter16bit
	port map(
		EN    => ENABLE_REACT_CNT,
		CLK   => CLK,
		CLR   => RST,
		COUNT => COUNT
	);

	FF0 : gated_SRlatch
	port map(
		Clk => CLK,
		R   => NOT_RST, -- Active-high reset
		S   => NOT_STOP,
		Q   => STOP_PRESSED
	);

	MOD50k : moduloCounter
	generic
	map(
	N_bits => 16,
	MODULO => 2 -- 50000 in FPGA
	)
	port map(
		EN    => '1',
		CLK   => CLK,
		CLR   => RST,
		COUNT => PULSE1kHz_CNT
	);

	CMP1 : comparator
	generic
	map(
	N_bits => 16,
	INT    => 1 -- 50000 in FPGA
	)
	port map(
		IN1  => PULSE1kHz_CNT,
		OUT1 => PULSE_1kHz
	);

	
	OUT1             <= IDLE_TIME_ELAPSED and not(STOP_PRESSED);

end structure;
