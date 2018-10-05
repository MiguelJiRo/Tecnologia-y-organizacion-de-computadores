LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_registro_sp IS
END tb_registro_sp;
 
ARCHITECTURE behavior OF tb_registro_sp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registro_sp
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         es : IN  std_logic;
         sp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal es : std_logic := '0';

 	--Outputs
   signal sp : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro_sp PORT MAP (
          rst => rst,
          clk => clk,
          es => es,
          sp => sp
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
	 rst <= '1';
	 es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '1';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait for 50 ns;
    rst <= '0';
    es  <= '0';
    wait;
   end process;

END;
