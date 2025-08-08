------------------------------------
-- Group 8 - Laboratory 6
-- Simple digital filter
-- VHDL code of control unit
------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit is
	port (
		CLK, RESN                 : in  STD_LOGIC; -- Clock and reset signals
		START, CNT1               : in  STD_LOGIC; -- Start signal and counter feedback
		MEMA_CS, MEMA_RD, MEMA_WR : out STD_LOGIC; -- Memory A control signals
		MEMB_CS, MEMB_RD, MEMB_WR : out STD_LOGIC; -- Memory B control signals
		EN_CNT                    : out STD_LOGIC; -- Enable counter
		RES_REG0                  : out STD_LOGIC; -- Register reset
		ADDA_SEL, ADDB_SEL        : out STD_LOGIC; -- Address selection
		DONE                      : out STD_LOGIC  -- Completion flag
	);
end controlUnit;

architecture Behavior of controlUnit is

	type State_type is (RESET, IDLE, GET_DATA, PROCESS_DATA, ENDOFTASK);
	signal FSM_CS, FSM_NS : State_type; -- Current and next state

begin

	CC1 : process (START, CNT1, FSM_CS)
	begin
		case FSM_CS is
			when RESET => FSM_NS <= IDLE;
			when IDLE  =>
				if (START = '1') then
					FSM_NS <= GET_DATA;
				else
					FSM_NS <= IDLE;
				end if;

			when GET_DATA =>
				if (CNT1 = '1') then
					FSM_NS <= PROCESS_DATA;
				else
					FSM_NS <= GET_DATA;
				end if;

			when PROCESS_DATA =>
				if (CNT1 = '1') then
					FSM_NS <= ENDOFTASK;
				else
					FSM_NS <= PROCESS_DATA;
				end if;

			when ENDOFTASK =>
				if (START = '1') then
					FSM_NS <= GET_DATA;
				else
					FSM_NS <= ENDOFTASK;
				end if;
			when others =>
				FSM_NS <= RESET;
		end case;
	end process;


	MEM : process (CLK, RESN)
	begin
		if (RESN = '0') then
			FSM_CS <= RESET; -- Reset state
		elsif rising_edge(CLK) then
			FSM_CS <= FSM_NS; -- Update FSM state
		end if;
	end process;


	CC2 : process (FSM_CS)
	begin
		case FSM_CS is
			when RESET =>
				MEMA_CS  <= '0';
				MEMA_RD  <= '0';
				MEMA_WR  <= '0';
				MEMB_CS  <= '0';
				MEMB_RD  <= '0';
				MEMB_WR  <= '0';
				EN_CNT   <= '0';
				RES_REG0 <= '0';
				ADDA_SEL <= '0';
				ADDB_SEL <= '0';
				DONE     <= '0';

			when IDLE =>
				MEMA_CS  <= '0';
				MEMA_RD  <= '0';
				MEMA_WR  <= '0';
				MEMB_CS  <= '0';
				MEMB_RD  <= '0';
				MEMB_WR  <= '0';
				EN_CNT   <= '0';
				RES_REG0 <= '0';
				ADDA_SEL <= '0';
				ADDB_SEL <= '0';
				DONE     <= '0';

			when GET_DATA =>
				MEMA_CS  <= '1';
				MEMA_RD  <= '0';
				MEMA_WR  <= '1';
				MEMB_CS  <= '0';
				MEMB_RD  <= '0';
				MEMB_WR  <= '0';
				EN_CNT   <= '1';
				RES_REG0 <= '0';
				ADDA_SEL <= '0';
				ADDB_SEL <= '0';
				DONE     <= '0';

			when PROCESS_DATA =>
				MEMA_CS  <= '1';
				MEMA_RD  <= '1';
				MEMA_WR  <= '0';
				MEMB_CS  <= '1';
				MEMB_RD  <= '0';
				MEMB_WR  <= '1';
				EN_CNT   <= '1';
				RES_REG0 <= '1';
				ADDA_SEL <= '0';
				ADDB_SEL <= '1';
				DONE     <= '0';

			when ENDOFTASK =>
				MEMA_CS  <= '0';
				MEMA_RD  <= '0';
				MEMA_WR  <= '0';
				MEMB_CS  <= '0';
				MEMB_RD  <= '0';
				MEMB_WR  <= '0';
				EN_CNT   <= '0';
				RES_REG0 <= '0';
				ADDA_SEL <= '0';
				ADDB_SEL <= '0';
				DONE     <= '1';

			when others =>
				MEMA_CS  <= '0';
				MEMA_RD  <= '0';
				MEMA_WR  <= '0';
				MEMB_CS  <= '0';
				MEMB_RD  <= '0';
				MEMB_WR  <= '0';
				EN_CNT   <= '0';
				RES_REG0 <= '1';
				ADDA_SEL <= '0';
				ADDB_SEL <= '0';
				DONE     <= '0';
		end case;
	end process;

end Behavior;
