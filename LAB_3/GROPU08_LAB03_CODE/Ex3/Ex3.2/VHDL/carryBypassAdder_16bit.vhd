------------------------------------
-- Group 8 - Laboratory 3
-- Exercise 3.2 - 16-bit ripple carry
-- adder with carry bypass
--
-- VHDL code of ripple carry adder with carry bypass
------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity carryBypassAdder_16bit is
	port (
		A1, A2 : in  SIGNED(15 downto 0); -- Numbers to be added
		CIN    : in  STD_LOGIC;          -- Input carry
		B1     : out SIGNED(15 downto 0); -- Sum result
		COUT    : out STD_LOGIC           -- Output carry
	);
end carryBypassAdder_16bit;

architecture structure of carryBypassAdder_16bit is

	component rippleCarryAdder4bit is
		port (
		A1, A2 : in  SIGNED(3 downto 0); -- Numbers to be added
		CIN    : in  STD_LOGIC;          -- Input carry
		B1     : out SIGNED(3 downto 0); -- Sum result
		COUT    : out STD_LOGIC           -- Output carry
	);
	end component;

	component mux is
	port (
		IN0, IN1, SEL : in  STD_LOGIC;  -- Input signals and selection signal
		OUT1          : out STD_LOGIC); -- Output signal
	end component;

	component carryPropagation is
	port (
		A, B  : in  STD_LOGIC_VECTOR(3 downto 0);	-- 4-bit wide inputs A and B of 4-bit RCA
		P_OUT : out STD_LOGIC				-- Propagation flag
	);
	end component;

	signal C : STD_LOGIC_VECTOR(4 downto 0); -- Intermediate carrys plus the carry_out
	signal D : STD_LOGIC_VECTOR(4 downto 0); -- Selected carry
	signal P : STD_LOGIC_VECTOR(3 downto 0); -- Carry propagation
begin

C(0) <= CIN;
D(0) <= CIN;
COUT <= D(4);

-- Generate multiple instances of the component
    gen_block: for i in 0 to 3 generate

        RCA_4BIT: rippleCarryAdder4bit
            port map (
                A1 => A1((4*i+3) downto (4*i)),
                A2 => A2((4*i+3) downto (4*i)),
		CIN => D(i),
		B1 => B1((4*i+3) downto (4*i)),
		COUT => C(i+1)
            );


	MUX0: mux
	port map (
		IN0 => C(i+1),
        	IN1 => D(i),
        	SEL => P(i),
        	OUT1 => D(i+1)
	);


	PGEN: carryPropagation
	port map(
		A => std_logic_vector(A1((4*i+3) downto (4*i))),
        	B => std_logic_vector(A2((4*i+3) downto (4*i))),
        	P_OUT => P(i)
	);


    end generate gen_block;
end structure;
