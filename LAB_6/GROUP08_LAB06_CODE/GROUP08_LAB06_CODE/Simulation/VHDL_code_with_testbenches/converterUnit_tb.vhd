------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of testbench for converter unit
------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity converterUnit_tb is
end converterUnit_tb;

architecture Behavioral of converterUnit_tb is

	-- Component under test
	component converterUnit is
        port (
            CLK        : in  STD_LOGIC;
            RES      : in  STD_LOGIC;
            inputA     : in  STD_LOGIC_VECTOR(12 downto 0);
            outputREG  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

	-- Signals
	signal clk          : STD_LOGIC                     := '0';
	signal reset        : STD_LOGIC                     := '0';
	signal inputA       : STD_LOGIC_VECTOR(12 downto 0) := (others => '0');
	signal outputREG    : STD_LOGIC_VECTOR(7 downto 0);
	signal integerPart  : STD_LOGIC_VECTOR(10 downto 0);

	-- Clock generation
	constant clk_period : TIME := 10 ns;
begin

	integerPart <= inputA(12 downto 2);

	-- Instantiate the Unit Under Test (UUT)
	UUT : converterUnit
	port map(
		CLK       => clk,
		RES     => reset,
		INPUTA    => inputA,
		OUTPUTREG => outputREG
	);

	-- Clock process
	clk_process : process
	begin
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
	end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Hold reset for some time
        wait for 20 ns;
        reset  <= '1';

        inputA <= std_logic_vector(to_signed(-861, 11)) & "10"; -- -861.50
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-750, 11)) & "01"; -- -750.25
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-500, 11)) & "11"; -- -500.75
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-250, 11)) & "00"; -- -250.00
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-125, 11)) & "01"; -- -125.25
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-60, 11)) & "10"; -- -60.50
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-30, 11)) & "00"; -- -30.00
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(-15, 11)) & "11"; -- -15.75
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(0, 11)) & "00"; -- 0.00
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(10, 11)) & "01"; -- 10.25
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(25, 11)) & "11"; -- 25.75
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(50, 11)) & "10"; -- 50.50
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(125, 11)) & "00"; -- 125.00
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(250, 11)) & "01"; -- 250.25
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(500, 11)) & "10"; -- 500.50
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(750, 11)) & "11"; -- 750.75
        wait for clk_period;

        inputA <= std_logic_vector(to_signed(859, 11)) & "00"; -- 859.00
        wait for clk_period;

        -- Finish simulation
        wait;
    end process;

end Behavioral;
