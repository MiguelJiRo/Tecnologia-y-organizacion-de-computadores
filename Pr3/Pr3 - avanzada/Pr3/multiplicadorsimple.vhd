library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.numeric_std.all;

entity multiplicadorsimple is
 port(
		  A    : in std_logic_vector(3 downto 0);
		  B    : in std_logic_vector(3 downto 0);
		  R    : out std_logic_vector(7 downto 0)
		);
end multiplicadorsimple;

architecture Behavioral of multiplicadorsimple is
 
---------------------------------------------------------------------------
---------------------------- Señales --------------------------------------
---------------------------------------------------------------------------
 

---------------------------------------------------------------------------
------------------------------ Begin --------------------------------------
---------------------------------------------------------------------------

 begin
 
  R <= A * B;
 
end Behavioral;