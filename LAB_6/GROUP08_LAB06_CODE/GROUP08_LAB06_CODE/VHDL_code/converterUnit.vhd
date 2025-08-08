------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of converter unit
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converterUnit is
	port (
		CLK       : in  STD_LOGIC;                     -- clock signal
		RES       : in  STD_LOGIC;                     -- reset signal
		INPUTA    : in  STD_LOGIC_VECTOR(12 downto 0); -- 13-bit input data
		OUTPUTREG : out STD_LOGIC_VECTOR(7 downto 0)   -- 8-bit output data
	);
end converterUnit;

architecture structural of converterUnit is

	-- 11-bit adder
	component RCA_11bit
		port (
			A1, A2 : in  STD_LOGIC_VECTOR(10 downto 0); -- numbers to be added
			P      : in  STD_LOGIC;                     -- RCA mode (addition/subtraction)
			B1     : out STD_LOGIC_VECTOR(10 downto 0); -- sum result
			COUT   : out STD_LOGIC                      -- output carry
		);
	end component;

	component mux2x1_11bit
		port (
			SEL      : in  STD_LOGIC;                     -- select signal
			IN0, IN1 : in  STD_LOGIC_VECTOR(10 downto 0); -- multiplexer inputs
			OUT_MUX  : out STD_LOGIC_VECTOR(10 downto 0)  -- multiplexer output
		);
	end component;

	component intervaldetector
		port (
			DATA_IN : in  STD_LOGIC_VECTOR(10 downto 0); -- input data for interval detection
			Z       : out STD_LOGIC_VECTOR(1 downto 0)   -- detection result
		);
	end component;

	component mux3x1_8bit
		port (
			SEL           : in  STD_LOGIC_VECTOR(1 downto 0); -- select signal
			IN0, IN1, IN2 : in  STD_LOGIC_VECTOR(7 downto 0);
			OUT_MUX       : out STD_LOGIC_VECTOR(7 downto 0) -- multiplexer output
		);
	end component;

	component regn is
		generic (
			N_bit : INTEGER
		);
		port (
			R   : in  STD_LOGIC_VECTOR((n_bit - 1) downto 0); -- register input
			CLK : in  STD_LOGIC;                              -- clock signal
			RES : in  STD_LOGIC;                              -- reset signal
			LD  : in  STD_LOGIC;                              -- load enable signal
			Q   : out STD_LOGIC_VECTOR((n_bit - 1) downto 0)  -- register output
		);
	end component;

	-- internal signals
	signal RESIZED_A : STD_LOGIC_VECTOR(10 downto 0); -- resized 11-bit version of input
	signal SUM       : STD_LOGIC_VECTOR(10 downto 0); -- summation result
	signal MUX1_OUT  : STD_LOGIC_VECTOR(10 downto 0); -- first multiplexer output
	signal Z         : STD_LOGIC_VECTOR(1 downto 0);  -- interval detection result
	signal MUX2_OUT  : STD_LOGIC_VECTOR(7 downto 0);  -- final 8-bit output data

begin

	-- resize INPUTA (take bits 12 downto 2 to form an 11-bit value)
	RESIZED_A <= INPUTA(12 downto 2);

	-- addition operation using ripple carry adder
	U1 : rca_11bit
	port map(
		A1 => RESIZED_A,
		A2 => "00000000001", -- adding 1 to input
		P  => '0',           -- addition mode
		B1 => SUM            -- output sum result
	);

	-- 2-to-1 multiplexer: select between RESIZED_A and SUM based on second LSB of INPUTA
	U2 : mux2x1_11bit
	port map(
		SEL     => INPUTA(1), -- second LSB of INPUTA as selector
		IN0     => RESIZED_A, -- first input (original resized data)
		IN1     => SUM,       -- second input (incremented result)
		OUT_MUX => MUX1_OUT   -- multiplexer output
	);

	-- interval detector: determine range category of the data
	U3 : intervaldetector
	port map(
		DATA_IN => MUX1_OUT, -- input data
		Z       => Z         -- detection result
	);

	-- 3-to-1 multiplexer: assign values based on interval detection
	U4 : mux3x1_8bit
	port map(
		SEL     => Z,                    -- interval detection result as selector
		IN0     => "01111111",           -- maximum 8-bit value
		IN1     => "10000000",           -- minimum 8-bit value
		IN2     => MUX1_OUT(7 downto 0), -- final computed result
		OUT_MUX => MUX2_OUT              -- multiplexer output
	);

	-- register to store final output data
	U5 : regn
	generic map(
		N_bit => 8
	)
	port map(
		R   => MUX2_OUT, -- data to be stored
		CLK => clk,      -- clock signal
		RES => RES,    -- reset signal
		LD  => '1',      -- load enable (always active)
		Q   => OUTPUTREG -- stored register output
	);

end structural;
