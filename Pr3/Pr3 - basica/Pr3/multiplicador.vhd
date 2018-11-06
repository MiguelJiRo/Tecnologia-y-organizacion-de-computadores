library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity multiplicador is
 port(
		  A    : in std_logic_vector(3 downto 0);
		  B    : in std_logic_vector(3 downto 0);
		  R    : out std_logic_vector(7 downto 0)
		);
end multiplicador;

architecture Behavioral of multiplicador is

---------------------------------------------------------------------------
---------------------------- Sumador --------------------------------------
---------------------------------------------------------------------------
COMPONENT sumador
 PORT(
		  op1 : IN std_logic_vector(7 downto 0);
		  op2 : IN std_logic_vector(7 downto 0);
		  res : OUT std_logic_vector(7 downto 0)
		);
 END COMPONENT;
 
---------------------------------------------------------------------------
---------------------------- Señales --------------------------------------
---------------------------------------------------------------------------
signal AA : STD_LOGIC_VECTOR(3 downto 0);
signal BB : STD_LOGIC_VECTOR(3 downto 0);

signal Aux1 : STD_LOGIC_VECTOR(3 downto 0);
signal Aux2 : STD_LOGIC_VECTOR(3 downto 0);
signal Aux3 : STD_LOGIC_VECTOR(3 downto 0);
signal Aux4 : STD_LOGIC_VECTOR(3 downto 0);

signal Aext : STD_LOGIC_VECTOR (7 downto 0);
signal Bext1 : STD_LOGIC_VECTOR (7 downto 0);
signal Bext2 : STD_LOGIC_VECTOR (7 downto 0);
signal Bext3 : STD_LOGIC_VECTOR (7 downto 0);

signal S1 : STD_LOGIC_VECTOR (7 downto 0);
signal S2 : STD_LOGIC_VECTOR (7 downto 0);
signal S3 : STD_LOGIC_VECTOR (7 downto 0);

---------------------------------------------------------------------------
------------------------------ Begin --------------------------------------
---------------------------------------------------------------------------

 begin
 
AA <= A;
BB <= B;

Aux1(0) <= BB(0) and AA(0);
Aux1(1) <= BB(1) and AA(0);
Aux1(2) <= BB(2) and AA(0);
Aux1(3) <= BB(3) and AA(0);

Aext(0) <= Aux1(0);
Aext(1) <= Aux1(1);
Aext(2) <= Aux1(2);
Aext(3) <= Aux1(3);
Aext(4) <= '0';
Aext(5) <= '0';
Aext(6) <= '0';
Aext(7) <= '0';

Aux2(0) <= BB(0) and AA(1);
Aux2(1) <= BB(1) and AA(1);
Aux2(2) <= BB(2) and AA(1);
Aux2(3) <= BB(3) and AA(1);

Bext1(0) <= '0';
Bext1(1) <= Aux2(0);
Bext1(2) <= Aux2(1);
Bext1(3) <= Aux2(2);
Bext1(4) <= Aux2(3);
Bext1(5) <= '0';
Bext1(6) <= '0';
Bext1(7) <= '0';

Aux3(0) <= BB(0) and AA(2);
Aux3(1) <= BB(1) and AA(2);
Aux3(2) <= BB(2) and AA(2);
Aux3(3) <= BB(3) and AA(2);

Bext2(0) <= '0';
Bext2(1) <= '0';
Bext2(2) <= Aux3(0);
Bext2(3) <= Aux3(1);
Bext2(4) <= Aux3(2);
Bext2(5) <= Aux3(3);
Bext2(6) <= '0';
Bext2(7) <= '0';

Aux4(0) <= BB(0) and AA(3);
Aux4(1) <= BB(1) and AA(3);
Aux4(2) <= BB(2) and AA(3);
Aux4(3) <= BB(3) and AA(3);

Bext3(0) <= '0';
Bext3(1) <= '0';
Bext3(2) <= '0';
Bext3(3) <= Aux4(0);
Bext3(4) <= Aux4(1);
Bext3(5) <= Aux4(2);
Bext3(6) <= Aux4(3);
Bext3(7) <= '0';

paso0: sumador PORT MAP(
	op1 => Aext,
	op2 => Bext1,
	res => S1
); 

paso1: sumador PORT MAP(
	op1 => S1,
	op2 => Bext2,
	res => S2
); 

paso2: sumador PORT MAP(
	op1 => S2,
	op2 => Bext3,
	res => S3
);

R <= S3;
 
end Behavioral;