------------------------------------
-- Group 8 - Laboratory 4
-- Exercise 4 - Digit flashing
-- VHDL code of modulo-counter
--
-- PARAMETRIC
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity moduloCounter is
	generic
	(
		N_bits : INTEGER; -- Define number of bits of the counter
		MODULO : INTEGER
	);
	port (
		EN, CLK, CLR : in  STD_LOGIC;                              -- Input signals: Enable, Clock and Clear (CLR is active-low)
		COUNT        : out STD_LOGIC_VECTOR((N_bits - 1) downto 0); -- Output signal
		MOD_REACHED  : out STD_LOGIC
	);
end moduloCounter;

architecture structure of moduloCounter is

	component elemCounter is
		port (
			prev_Q, prev_A : in  STD_LOGIC; -- Input signals: Enable, Clock and Clear (CLR is active-low)
			next_Q, next_A : out STD_LOGIC; -- Output signal
			CLK, CLR       : in  STD_LOGIC;
			LD, P          : in  STD_LOGIC
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

	signal Q, A       : STD_LOGIC_VECTOR((N_bits - 1) downto 0);
	signal LD, CMP_OUT         : STD_LOGIC;
	constant P        : STD_LOGIC_VECTOR((N_bits - 1) downto 0) := (others => '0');
	constant TRESHOLD : INTEGER                                 := MODULO - 1;
begin

	LD <= CMP_OUT and EN;
	CNT : elemCounter
	port map(
		prev_Q => EN,
		prev_A => EN,
		next_Q => Q(0),
		next_A => A(0),
		CLK    => CLK,
		CLR    => CLR,
		LD     => LD,
		P      => P(0)
	);

	cnt_generate : for i in 1 to (N_bits - 1) generate
		CNT : elemCounter
		port map(
			prev_Q => Q(i - 1),
			prev_A => A(i - 1),
			next_Q => Q(i),
			next_A => A(i),
			CLK    => CLK,
			CLR    => CLR,
			LD     => LD,
			P      => P(i)
		);

	end generate cnt_generate;

	CMP : comparator
	generic
	map(
	N_bits => N_bits,
	INT    => TRESHOLD
	)
	port map(
		IN1  => Q,
		OUT1 => CMP_OUT
	);

	MOD_REACHED <= LD;
	COUNT <= Q;

end structure;
