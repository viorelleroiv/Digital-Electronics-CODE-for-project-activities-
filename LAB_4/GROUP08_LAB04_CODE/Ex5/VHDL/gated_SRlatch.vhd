library ieee;
use ieee.std_logic_1164.all;

entity gated_SRlatch is
	port (
		Clk, R, S : in STD_LOGIC;
		Q : out STD_LOGIC);
end gated_SRlatch;

architecture Structural of gated_SRlatch is
	signal R_g, S_g, Qa, Qb : STD_LOGIC;
	attribute keep : BOOLEAN;
	attribute keep of R_g, S_g, Qa, Qb : signal is true;
begin
	R_g <= R and Clk;
	S_g <= S and Clk;
	Qa <= not (R_g or Qb);
	Qb <= not (S_g or Qa);
	Q <= Qa;
end Structural;