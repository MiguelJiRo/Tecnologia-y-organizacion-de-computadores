------------------------------------------------------------------------------------
---- company: Universidad Complutense de Madrid (UCM)
---- engineer: Oscar Garnica
---- 
---- design name:   divisor 
---- module name:   divisor - rtl
---- project name: 
---- target devices: 
---- description: Creacion de un reloj de 1 Hz a partir de un reloj de 100 MHz
----
------------------------------------------------------------------------------------
--library IEEE;
--use IEEE.std_logic_1164.all;
--USE IEEE.std_logic_unsigned.ALL;
--
--entity divisor is
--    port (
--        rst: in STD_LOGIC;
--        clk: in STD_LOGIC; -- reloj de entrada de la entity superior
--        clk_25mhz: out STD_LOGIC -- reloj que se utiliza en los process del programa principal
--    );
--end divisor;
--
--architecture rtl of divisor is
--  
--  signal cntr_reg    : std_logic_vector(24 downto 0);
--  signal clk_1hz_reg : std_logic;
--begin
--
--  p_cntr : process(rst, clk)
--  begin
--    if (rst = '1') then
--      cntr_reg    <= (others => '0');
--      clk_1hz_reg <= '0';
--    elsif rising_edge(clk) then
--      if cntr_reg = (24 downto 0 => '1') then
--        clk_1hz_reg <= not clk_1hz_reg;
--        cntr_reg    <= (others => '0');
--      else
--        cntr_reg    <= cntr_reg + 1;
--        clk_1hz_reg <= clk_1hz_reg;
--      end if;
--    end if;
--  end process p_cntr;
--
--  output_clock: clk_25mhz <= clk_1hz_reg;
--end rtl;
library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.ALL;

entity divisor is
    port (
        rst: in STD_LOGIC;
        clk: in STD_LOGIC; -- reloj de entrada de la entity superior
        clk_25mhz: out STD_LOGIC -- reloj que se utiliza en los process del programa principal
    );
end divisor;

architecture divisor_arch of divisor is
 SIGNAL cuenta: std_logic_vector(23 downto 0);
 SIGNAL clk_aux: std_logic;
  
  begin

 
clk_25mhz<=clk_aux;
  contador:
  PROCESS(rst, clk)
  BEGIN
    IF (rst='1') THEN
      cuenta<= (OTHERS=>'0');
      clk_aux<='0';
    ELSIF(clk'EVENT AND clk='1') THEN
      IF (cuenta="111111111111111111111111") THEN 
      	clk_aux <= not clk_aux;
        cuenta<= (OTHERS=>'0');
      ELSE
        cuenta <= cuenta+'1';
	clk_aux<=clk_aux;
      END IF;
    END IF;
  END PROCESS contador;

end divisor_arch;

