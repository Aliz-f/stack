
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity stack is
	port(
		clk, res : in std_logic;
		data_in : in std_logic_vector (3 downto 0);
		push, pop : in std_logic;
		data_out : out std_logic_vector (3 downto 0);
		full, empty : out std_logic
	);
end stack;

architecture stack_arch of stack is

type mem_type is array (0 to 7) of std_logic_vector(3 downto 0);
signal stack_mem : mem_type := (others => (others => '0'));
signal status_full, status_empty : std_logic := '0';
signal pre_pp : std_logic := '0';

begin

	stack_process : process(clk, res)

		variable stack_ptr : integer range 0 to 7 := 7;

		begin
			if (rising_edge(clk))then 
				if (res = '1') then
					stack_ptr :=7;
					full <='0';
					status_full <= '0';
					empty <= '1';
					status_empty <= '1';
					stack_mem <= (others => (others => '0'));
					data_out <="0000";

				elsif (push = '1' and status_full = '0') then
					--push
						if (stack_ptr = 0) then
							full <= '1';
							status_full <='1';
							empty <= '0';
							status_empty <='0';
						elsif(stack_ptr > 0 or stack_ptr <= 7) then
							full <= '0';
							status_full <='0';
							stack_mem(stack_ptr) <= data_in;
							if (stack_ptr /= 0) then
								stack_ptr := stack_ptr -1;
							end if;--ptr
							if(stack_ptr = 7)then
								empty <= '1';
								status_empty <='1';
							else
								empty <= '0';
								status_empty <='0';
							end if;
						end if;					
				elsif(pop = '1' and status_empty = '0') then
						--pop
						if (stack_ptr = 7) then
							full <= '0';
							status_full <='0';
							empty <= '1';
							status_empty <='1';
						elsif(stack_ptr >= 0 or stack_ptr < 7 )then
							empty <= '0';
							status_empty <='0';
							Data_Out <= stack_mem(stack_ptr+1);
							if (stack_ptr /= 7) then
								stack_ptr := stack_ptr +1;
							end if;
							if(stack_ptr = 0)then
								full <= '1';
								status_full <='1';
							else
								full <= '0';
								status_full <='0';
							end if;
						end if;
				end if;--pop or push or reset
			end if;--clk

	end process;

end stack_arch;

