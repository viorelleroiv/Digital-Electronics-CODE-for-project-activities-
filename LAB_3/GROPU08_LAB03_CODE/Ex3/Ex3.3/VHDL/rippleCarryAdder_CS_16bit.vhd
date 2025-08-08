------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3.3 - 16-bit ripple carry
-- adder with carry select
--
-- VHDL code of ripple carry adder with carry select
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity carrySelectAdder16bit is
	port (
		A1, A2 : in  SIGNED(15 downto 0); -- Numbers to be added
		CIN    : in  STD_LOGIC;           -- Input carry
		B1     : out SIGNED(15 downto 0); -- Sum result
		COUT   : out STD_LOGIC            -- Output carry
	);
end carrySelectAdder16bit;

architecture Behavior of carrySelectAdder16bit is

	component rippleCarryAdder4bit is
		port (
			A1, A2 : in  SIGNED(3 downto 0); -- Numbers to be added
			CIN    : in  STD_LOGIC;          -- Input carry
			B1     : out SIGNED(3 downto 0); -- Sum result
			COUT   : out STD_LOGIC           -- Output carry
		);
	end component;

	component mux is
		port (
			IN0, IN1, SEL : in  STD_LOGIC;  -- Input signals and selection signal
			OUT1          : out STD_LOGIC); -- Output signal
	end component;
	component mux4bit is
		port (
			IN0, IN1 : in  STD_LOGIC_VECTOR(3 downto 0);  -- Input signals
			SEL      : in  STD_LOGIC;                     -- Selection signal
			OUT1     : out STD_LOGIC_VECTOR(3 downto 0)); -- Output signal
	end component;

	signal C0, C1 : STD_LOGIC_VECTOR(3 downto 1);       -- Intermediate carrys from carry in=0 RCA and from carry in=1 RCA

	type matrix is array(1 to 3) of SIGNED(3 downto 0); -- A 3x4 matrix (3 rows, 4 columns)
	signal S0, S1     : matrix;                         -- Variable index: carry_out value, Rows: RCA number i

	signal C          : STD_LOGIC_VECTOR(3 downto 0);   -- Carry select multiplexer outputs

	signal S_stdlogic : STD_LOGIC_VECTOR(15 downto 4);
begin

	B1(15 downto 4) <= signed(S_stdlogic);
	COUT            <= C(3);

	-- First RCA
	RCA_4BIT : rippleCarryAdder4bit
	port map(
		A1   => A1(3 downto 0),
		A2   => A2(3 downto 0),
		CIN  => CIN,
		B1   => B1(3 downto 0),
		COUT => C(0)
	);

	-- Generate multiple instances of the component
	gen_block : for i in 1 to 3 generate
		-- RCA with carry_in = 0		
		RCA_4BIT_C0 : rippleCarryAdder4bit
		port map(
			A1   => A1((4 * i + 3) downto (4 * i)),
			A2   => A2((4 * i + 3) downto (4 * i)),
			CIN  => '0',
			B1   => S0(i),
			COUT => C0(i)
		);

		-- RCA with carry_in = 1
		RCA_4BIT_C01 : rippleCarryAdder4bit
		port map(
			A1   => A1((4 * i + 3) downto (4 * i)),
			A2   => A2((4 * i + 3) downto (4 * i)),
			CIN  => '1',
			B1   => S1(i),
			COUT => C1(i)
		);

		MUX_4BIT : mux4bit
		port map(
			IN0  => STD_LOGIC_VECTOR(S0(i)),
			IN1  => STD_LOGIC_VECTOR(S1(i)),
			SEL  => C(i - 1),
			OUT1 => S_stdlogic((4 * i + 3) downto (4 * i))
		);

		MUX_1BIT : mux
		port map(
			IN0  => C0(i),
			IN1  => C1(i),
			SEL  => C(i - 1),
			OUT1 => C(i)
		);

	end generate gen_block;

end Behavior;
