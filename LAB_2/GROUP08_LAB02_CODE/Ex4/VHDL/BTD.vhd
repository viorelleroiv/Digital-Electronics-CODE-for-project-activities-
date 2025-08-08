------------------------------------
-- Group 8 - Laboratory 2
-- Exercise 4 - BIN to BCD converter
-- VHDL code of main entity
------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity BTD is
	port (
		SW         : in  STD_LOGIC_VECTOR(5 downto 0);
		HEX1, HEX0 : out STD_LOGIC_VECTOR(0 to 6) -- 7-segment display outputs
	);
end BTD;

architecture structural of BTD is

	-- Component Declarations

	-- Comparator: extracts the tens digit (values 0 to 6) from a 6-bit input.
	component comparator is
		port (
			in_c  : in  STD_LOGIC_VECTOR(5 downto 0); -- 6-bit input (MSB = in_c(5))
			out_c : out STD_LOGIC_VECTOR(2 downto 0)  -- 3-bit output for tens digit
		);
	end component;

	-- Subtractor (sottrattore): combines the tens digit and the units to produce the final output
	-- for the units display.
	component sottrattore is
		port (
			in_sott_1 : in  STD_LOGIC_VECTOR(2 downto 0); -- tens digit input (LSB is bit 0)
			v_in      : in  STD_LOGIC_VECTOR(5 downto 0); -- 6-bit input (LSB is bit 0)
			out_dis   : out STD_LOGIC_VECTOR(3 downto 0)  -- 4-bit output for units display
		);
	end component;

	-- Circuit_B: drives the tens display. Active low with bit 6 as MSB.
	component circuit_b is
		port (
			in_b  : in  STD_LOGIC_VECTOR(2 downto 0);
			EOX_1 : out STD_LOGIC_VECTOR(6 downto 0) -- 7-segment display output for tens digit
		);
	end component;

	-- 7-Segment Display: converts a 4-bit input to the display segments.
	component segment_display is
		port (
			v_0, v_1, v_2, v_3 : in  STD_LOGIC;
			EOX                : out STD_LOGIC_VECTOR(6 downto 0)
		);
	end component;

	-- Internal Signals

	-- Individual bits of SW (x = LSB, k = MSB)
	signal x, y, z, w, g, k             : STD_LOGIC;

	-- Output of the comparator: represents the tens digit (0 to 6)
	signal selection                    : STD_LOGIC_VECTOR(2 downto 0);

	-- Outputs to the 7-segment displays
	signal disp_0, disp_1               : STD_LOGIC_VECTOR(6 downto 0);

	-- Concatenated 6-bit signal used for computing the units digit
	signal sottrattore_comparator_input : STD_LOGIC_VECTOR(5 downto 0);

	-- Output from the subtractor (sottrattore) for the units display
	signal indisp                       : STD_LOGIC_VECTOR(3 downto 0);

begin

	-- Map bits of SW to internal signals (SW(0) is LSB, SW(5) is MSB)
	x                            <= SW(0);
	y                            <= SW(1);
	z                            <= SW(2);
	w                            <= SW(3);
	g                            <= SW(4);
	k                            <= SW(5);

	-- Concatenate bits to form the input for the comparator
	sottrattore_comparator_input <= k & g & w & z & y & x; -- k is assigned as the MSB

	-- Instantiate the comparator to extract the tens digit from the 6-bit input
	u1 : comparator port map(
		in_c  => sottrattore_comparator_input,
		out_c => selection
	);

	-- Instantiate the subtractor to combine the tens digit and the units for final units display output
	u10 : sottrattore port map(
		in_sott_1 => selection,
		v_in      => sottrattore_comparator_input,
		out_dis   => indisp
	);

	-- Instantiate the 7-segment display for the units digit
	u11 : segment_display port map(
		v_0 => indisp(0),
		v_1 => indisp(1),
		v_2 => indisp(2),
		v_3 => indisp(3),
		EOX => disp_0
	);

	-- Instantiate circuit_b to drive the tens digit display (values 0 to 6)
	u12 : circuit_b port map(
		in_b  => selection,
		EOX_1 => disp_1
	);

	-- Final assignment of display outputs
	HEX0 <= disp_0; -- Units display
	HEX1 <= disp_1; -- Tens display

end structural;
