------------------------------------
-- Group 8 - Laboratory 1
-- Exercise 3 - 5-to-1 multiplexer
-- VHDL code of mux5to1
------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux5to1 is
	port (
		SW   : in  STD_LOGIC_VECTOR(8 downto 0);
		LEDR : out STD_LOGIC_VECTOR(2 downto 0)
	);
end mux5to1;

architecture Behavioral of mux5to1 is
	signal M   : STD_LOGIC_VECTOR(2 downto 0);
	signal Sel : STD_LOGIC_VECTOR(2 downto 0);
	signal X   : STD_LOGIC_VECTOR(2 downto 0);
	signal Y   : STD_LOGIC_VECTOR(2 downto 0);
begin
	LEDR <= M;
	process (Sel, SW, X, Y)
	begin
		Sel <= SW(8 downto 6);
		X   <= SW(2 downto 0);
		Y   <= SW(5 downto 3);

		case Sel is
			when "000"  => M  <= "101"; -- U
			when "001"  => M  <= "010"; -- V
			when "010"  => M  <= "111"; -- W
			when "011"  => M  <= X;
			when "100"  => M  <= Y;
			when others => M <= Y;
		end case;
	end process;
end Behavioral;