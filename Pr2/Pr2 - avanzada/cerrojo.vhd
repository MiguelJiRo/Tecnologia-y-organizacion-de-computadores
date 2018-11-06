library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cerrojo is
	port (clk : in std_logic;
			rst : in std_logic;
			intro : in std_logic_vector(7 downto 0);
			eq : in std_logic;
			intentos_cerrojo : out std_logic_vector(6 downto 0);
			leds : out std_logic_vector(9 downto 0);
			parpadeo : out std_logic_vector ( 3 downto 0 );
			estado_actual : out std_logic_vector ( 2 downto 0 );
			estado_siguiente : out std_logic_vector ( 2 downto 0 )
	);
end cerrojo;

architecture beh of cerrojo is

---------------------------------------------------------------
---------------------------------------------------------------

component conv_7seg port(
	x : in  STD_LOGIC_VECTOR (3 downto 0);
	display : out  STD_LOGIC_VECTOR (6 downto 0)
	);
end component;
	 
---------------------------------------------------------------
---------------------------------------------------------------	 
	 
component debouncer port(
    rst: IN std_logic;
    clk: IN std_logic;
    x: IN std_logic;
    xDeb: OUT std_logic;
    xDebFallingEdge: OUT std_logic;
    xDebRisingEdge: OUT std_logic
  );  
end component;	

---------------------------------------------------------------
--------------------------------------------------------------- 

--component sumador port 
	--(op1: in std_logic_vector(3 downto 0);
	--op2: in std_logic_vector(3 downto 0);
	--res: out std_logic_vector(3 downto 0));
--end sumador;

--------------------------------------------------------------- 
--------------------------------------------------------------- 

	 
   type t_state is (inicial_st , tres_st, dos_st, uno_st, final_st);
	signal current_state, next_state : t_state;
	
	signal clave: std_logic_vector(7 downto 0);
	signal eq_deb: std_logic;
	signal intentos : std_logic_vector (3 downto 0);
	signal parpadeo_s : std_logic_vector ( 3 downto 0 ) := "0000";
	
	begin

	deb: debouncer port map(rst, clk, eq, open, eq_deb, open);
	--par: divisor port map(rst, 1Hz, clk);
	conv: conv_7seg port map (intentos, intentos_cerrojo);
	
---------------------------------------------------------------
-- boton reset
---------------------------------------------------------------
	p_reg :Process(clk, rst)
		begin
		if clk'event and clk = '1' then
		
			if rst = '0' then
				current_state <= inicial_st;
			else
				current_state <= next_state;
			end if;	
		end if;
	end process p_reg;
	
---------------------------------------------------------------
---------------------------------------------------------------

p_parpadea: process(clk, rst) 
	begin
		if rst = '0' then
			parpadeo_s <= "0000";
		else
			if rising_edge(clk) then
				parpadeo_s <= NOT parpadeo_s;
			end if;
		end if;
		parpadeo <= parpadeo_s;
	end process;	
	
---------------------------------------------------------------
---------------------------------------------------------------

p_comb :Process(current_state, intro , eq_deb)
	
		begin
		
			next_state <= inicial_st;
			intentos <= "0000";
			next_state <= current_state;
			
			estado_actual <= "000";
			estado_siguiente <= "011";
			
		case current_state is
---------------------------------------------------------------
--------------------------------------------------------------- Inicial
		when inicial_st =>
			if (eq_deb = '1') then
				clave <= intro;
				next_state <= tres_st;
				intentos <= "0011";
				leds <= "0000000000";
				estado_actual <= "011";
				estado_siguiente <= "010";
			else next_state <= inicial_st;
				intentos <= "0000";
				leds <= "1111111111";
				estado_actual <= "000";
				estado_siguiente <= "011";
			end if;
---------------------------------------------------------------
--------------------------------------------------------------- Tres
		when tres_st =>
			if (eq_deb = '1') then
				if(intro = clave)then
					next_state <= inicial_st;
					intentos <= "0000";
					estado_actual <= "000";
					estado_siguiente <= "011";
					leds <= "1111111111";
				else next_state <= dos_st;
					intentos <= "0010";
					estado_actual <= "011";
					estado_siguiente <= "010";
				end if;
			else
				next_state <= tres_st;
				intentos <= "0011";
				leds <= "0000000000";
				estado_actual <= "011";
				estado_siguiente <= "010";
			end if;
---------------------------------------------------------------
--------------------------------------------------------------- Dos
		when dos_st =>
			if(eq_deb = '1') then
				if ( intro = clave ) then
					next_state <= inicial_st;
					intentos <= "0000";
					estado_actual <= "000";
					estado_siguiente <= "011";
					leds <= "1111111111";
				else next_state <= uno_st;
					intentos <= "0001";
					estado_actual <= "001";
					estado_siguiente <= "111";
				end if;
			else next_state <= dos_st;
				intentos <= "0010";
				estado_actual <= "010";
				estado_siguiente <= "001";
					
			end if;
---------------------------------------------------------------
--------------------------------------------------------------- Uno
		when uno_st =>
			if(eq_deb = '1') then
				if ( intro = clave ) then
					next_state <= inicial_st;
					intentos <= "0000";
					leds <= "1111111111";
					estado_actual <= "000";
					estado_siguiente <= "011";
				else next_state <= final_st;
					intentos <= "0000";
					estado_actual <= "111";
					estado_siguiente <= "000";
				end if;
			else next_state <= uno_st;
				intentos <= "0001";
				estado_actual <= "001";
				estado_siguiente <= "111";
			end if;
---------------------------------------------------------------
--------------------------------------------------------------- Final
		when final_st => 
			next_state <= final_st;
			intentos <= "0000";
			estado_actual <= "111";
			estado_siguiente <= "000";			
	end case;
end process p_comb;			
	
end beh;