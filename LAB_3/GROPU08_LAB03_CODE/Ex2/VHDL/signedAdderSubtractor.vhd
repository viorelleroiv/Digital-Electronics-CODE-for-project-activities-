------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 2 - 4-bit ripple carry adder/subtractor
-- VHDL code of main entity
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity signedAdderSubtractor is
	port (
		IN1, IN2       : in  SIGNED(3 downto 0); -- Numbers to be added (2's complement format)
		IN3, CLK, RESN : in  STD_LOGIC;          -- Mode, Clock and Clear (Clear is active-low)
		OUT1           : out SIGNED(3 downto 0); -- Sum result (2's complement format)
		OUT2           : out STD_LOGIC           -- Overflow flag
	);
end signedAdderSubtractor;

architecture structural of signedAdderSubtractor is

	-- 4-bit register
	component regn is
		generic
			(N : INTEGER := 4);
		port (
			R             : in  SIGNED(N - 1 downto 0);  -- Register input
			Clock, Resetn : in  STD_LOGIC;               -- Clock and reset signals
			Q             : out SIGNED(N - 1 downto 0)); -- Register output
	end component;

	-- D-type flip-flop
	component flipflop is
		port (
			D, Clock, Resetn : in  STD_LOGIC;  -- D input, clock and reset signals
			Q                : out STD_LOGIC); -- Q output of FF
	end component;

	-- 4-bit ripple carry adder/subtractor
	component rippleCarryAdderSubtractor
		port (
			A1, A2 : in  SIGNED(3 downto 0); -- Numbers to be added
			P      : in  STD_LOGIC;          -- RCA mode
			B1     : out SIGNED(3 downto 0); -- Sum result
			COUT   : out STD_LOGIC           -- Output carry
		);
	end component;

	-- Overflow detector
	component ovfdetector
		port (
			A, B, S, MODE, COUT : in  STD_LOGIC;  -- Most significant bit of A, B and S, MODE and RCA output-carry
			OVF                 : out STD_LOGIC); -- Overflow flag
	end component;

	signal A, B, S    : SIGNED(3 downto 0); -- Intermediate signal between registers ans RCA
	signal COUT1, OVF : STD_LOGIC;          -- Output-carry and intermediate overflow flag
begin
	REG0 : regn
	port map(IN1, CLK, RESN, A);

	REG1 : regn
	port map(IN2, CLK, RESN, B);

	REG2 : regn
	port map(S, CLK, RESN, OUT1);

	RCA0 : rippleCarryAdderSubtractor
	port map(A, B, IN3, S, COUT1);

	DFF0 : flipflop
	port map(OVF, CLK, RESN, OUT2);

	OVFD : ovfdetector
	port map(A(3), B(3), S(3), IN3, COUT1, OVF);
end structural;