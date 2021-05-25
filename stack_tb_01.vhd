LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY stack_tb_01 IS
END stack_tb_01;
 
ARCHITECTURE behavior OF stack_tb_01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT stack
    PORT(
         clk : IN  std_logic;
         res : IN  std_logic;
         data_in : IN  std_logic_vector(3 downto 0);
         push : IN  std_logic;
         pop : IN  std_logic;
         data_out : OUT  std_logic_vector(3 downto 0);
         full : OUT  std_logic;
         empty : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal res : std_logic := '0';
   signal data_in : std_logic_vector(3 downto 0) := (others => '0');
   signal push : std_logic := '0';
   signal pop : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(3 downto 0);
   signal full : std_logic;
   signal empty : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stack PORT MAP (
          clk => clk,
          res => res,
          data_in => data_in,
          push => push,
          pop => pop,
          data_out => data_out,
          full => full,
          empty => empty
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			res <= '0';
			data_in <= "0001";
			push <= '1';
         pop <= '0';
      wait for 100 ns;	
			res <= '0';
			data_in <= "0010";
			push <= '1';
         pop <= '0';
      wait for 100 ns;	
			res <= '0';
			data_in <= "0011";
			push <= '1';
         pop <= '0';
      wait for 100 ns;	
			res <= '0';
			data_in <= "0100";
			push <= '1';
         pop <= '0';
      wait for 100 ns;	
			res <= '0';
			push <= '0';
         pop <= '1';
      wait for 100 ns;	
			res <= '0';
			push <= '0';
         pop <= '1';
      wait for 100 ns;	
			res <= '0';
			push <= '0';
         pop <= '1';

      wait;
   end process;

END;
