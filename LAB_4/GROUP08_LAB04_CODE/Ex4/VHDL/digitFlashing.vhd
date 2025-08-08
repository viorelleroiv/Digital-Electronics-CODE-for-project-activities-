------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 4 - Digit flashing
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity digitFlashing is
	port (
		IN1, CLR : in  STD_LOGIC;                   -- Input signal: (will be conected to 50 MHz clock)
		OUT1     : out STD_LOGIC_VECTOR(3 downto 0) -- Output signal: 4-bit binary value in range 0 to 9 (in decimal)
	);
end digitFlashing;

architecture structure of digitFlashing is

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

	signal A          : STD_LOGIC_VECTOR(25 downto 0);
	signal B          : STD_LOGIC;
	signal C          : STD_LOGIC_VECTOR(3 downto 0);
	constant TRESHOLD : INTEGER := 3 - 1;
begin
	MOD50M_26BIT_CNT : moduloCounter
	generic
	map(
	N_bits => 26,
	MODULO => 3
	)
	port map(
		EN    => '1',
		CLK   => IN1,
		CLR   => CLR,
		COUNT => A
	);

	CMP : comparator
	generic
	map(
	N_bits => 26,
	INT    => TRESHOLD
	)
	port map(
		IN1  => A,
		OUT1 => B
	);
	
	MOD10_4BIT_CNT : moduloCounter
	generic
	map(
	N_bits => 4,
	MODULO => 10
	)
	port map(
		EN    => B,
		CLK   => IN1,
		CLR   => CLR,
		COUNT => C
	);

	OUT1 <= C;
end structure;
