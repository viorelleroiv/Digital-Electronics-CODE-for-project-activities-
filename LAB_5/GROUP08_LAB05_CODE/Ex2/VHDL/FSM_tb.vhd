------------------------------------
-- Group 8 - Laboratory 5
-- Exercise 2 - One-hot FSM
-- VHDL code of FSM (main entity)
------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sequenceDetector_tb IS
END sequenceDetector_tb;

ARCHITECTURE testbench OF sequenceDetector_tb IS

	COMPONENT sequenceDetector IS
		port (
		W, CLK, RESN : in  STD_LOGIC;
		Z            : out STD_LOGIC);
	END COMPONENT;

	SIGNAL reset_tb, clk : STD_LOGIC;
	SIGNAL w_tb : STD_LOGIC := '1';
	SIGNAL LEDR_tb : std_logic;

BEGIN
	PROCESS
	BEGIN
		-- initial 'w = 0' branch test
		w_tb <= '0';
		reset_tb <= '0'; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		reset_tb <= '1';
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
 
		-- initial 'w = 1' branch test
		reset_tb <= '0';
		clk <= '0';
		WAIT FOR 1 ns;
		reset_tb <= '1';
		clk <= '1';
		w_tb <= '1';
		WAIT FOR 1 ns; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
 
		-- Mixed branches test
		w_tb <= '0';
		reset_tb <= '0'; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		reset_tb <= '1';
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		w_tb <= '1';
		WAIT FOR 1 ns;
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns; 
		clk <= '0';
		w_tb <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns; 
		clk <= '0';
		WAIT FOR 1 ns;
		clk <= '1';
		WAIT FOR 1 ns;
 
		WAIT;
	END PROCESS;
 
	uut : sequenceDetector
	PORT MAP(
		W => w_tb, 
		CLK => clk, 
		RESN => reset_tb, 
		Z => LEDR_tb 
		);
END testbench;
