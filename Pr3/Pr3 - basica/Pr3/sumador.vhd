library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador is
port(
 op1 : in std_logic_vector(7 downto 0);
 op2 : in std_logic_vector(7 downto 0);
 res  : out std_logic_vector(7 downto 0)
);
end sumador;

architecture Behavioral of sumador is

begin

res <= op1 + op2;

end Behavioral;