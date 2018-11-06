--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:27:51 10/11/2018
-- Design Name:   
-- Module Name:   C:/hlocal/Pr2/cerrojo_tb.vhd
-- Project Name:  Pr2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cerrojo
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cerrojo_tb IS
END cerrojo_tb;
 
ARCHITECTURE behavior OF cerrojo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cerrojo
    PORT(
         clk : in std_logic;
			rst : in std_logic;
			intro : in std_logic_vector(7 downto 0);
			eq : in std_logic;	
			intentos_cerrojo : out std_logic_vector(6 downto 0);
			leds : out std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    
   --Inputs
	signal intro : std_logic_vector(7 downto 0) := (others => '0');
   signal clk , rst, eq: std_logic := '0';
	
 	--Outputs
   signal intentos_cerrojo : std_logic_vector(6 downto 0);
   signal leds : std_logic_vector(9 downto 0);
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cerrojo PORT MAP (
          clk => clk,
          rst => rst,
          intro => intro,
          eq => eq,
          intentos_cerrojo => intentos_cerrojo,
			 leds => leds
        );

 -----------------------------------------------------------------------------
 -- Process declaration
 -----------------------------------------------------------------------------  

-- clock
p_clk : process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process p_clk;

-- reset
p_rst : process
begin
	rst <= '0';
	wait for 250 ns;
	rst <= '1';
	wait;
end process p_rst;

-- principal

p_principal : process
begin
	-- inicial
	intro <= "01001111";
	eq <= '1';
	rst <= '1';
	wait for 100 ms;
	-- inicial - tres
	intro <= "01001111";
	eq <= '1';	
	rst <= '1';
	wait for 100 ms;
	-- tres - inicial
	intro <= "01001111";
	eq <= '1';
	rst <= '1';
	wait for 100 ms;
	-- inicial - tres
	intro <= "01001111";
	eq <= '0';
	rst <= '1';
	wait for 100 ms;
	-- tres - dos
	intro <= "01011011";
	eq <= '1';	
	rst <= '1';
	wait for 100 ms;
	-- dos - inicial
	intro <= "01001111";
	eq <= '1';	
	rst <= '1';
	wait for 100 ms;
	-- inicial - tres
	intro <= "01001111";
	eq <= '0';
	rst <= '1';
	wait for 100 ms;
	-- tres - dos
	intro <= "01011011";
	eq <= '0';	
	rst <= '1';
	wait for 100 ms;
	-- dos - uno
	intro <= "00000110";
	eq <= '1';
	rst <= '1';
	wait for 100 ms;
	-- uno - inicial
	intro <= "01001111";
	eq <= '1';
	rst <= '1';
	wait for 100 ms;
	-- inicial - tres
	intro <= "01001111";
	eq <= '0';	
	rst <= '1';
	wait for 100 ms;
	-- tres - dos
	intro <= "01011011";
	eq <= '0';
	rst <= '1';
	wait for 100 ms;
	-- dos - uno
	intro <= "00000110";
	eq <= '0';	
	rst <= '1';
	wait for 100 ms;
	-- uno - final
	intro <= "01111110";
	eq <= '1';
	rst <= '1';
	wait;
end process p_principal;

END;
