------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 4 - "HELLO" FSM
-- VHDL code of 1 Hz pulse generator
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity pulse1Hz is
	port(
		CLK, RES: in STD_LOGIC;
		PULSE_1Hz: out STD_LOGIC
	);
end pulse1Hz;

architecture structural of pulse1Hz is
component moduloCounter is
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
end component;
	
begin
	MOD50M_COUNTER: moduloCounter
	generic map(
		N_bits => 26,
		MODULO => 3		-- 50000000 in FPGA
	)
	port map(
		EN => '1',
		CLK => CLK,
		CLR => RES,
		MOD_REACHED => PULSE_1Hz
	);

	
end structural;
