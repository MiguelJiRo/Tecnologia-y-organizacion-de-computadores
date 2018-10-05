library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_siso is
	port (rst : in std_logic;
			clk : in std_logic;
			es  : in std_logic;
			ss  : out std_logic);
end registro_siso;

architecture Behavioral of registro_siso is

	signal clk_int : std_logic;
	signal data : std_logic_vector(7 downto 0);

	component divisor is
	port (rst        : in  std_logic;         -- asynch reset
			clk_100mhz : in  std_logic;         -- 100 MHz input clock
			clk_1hz    : out std_logic);        -- 1 Hz output clock
	end component;

begin

--	Descomentar para implementacion en FPGA
 i_clk_int : divisor port map(rst, clk, clk_int);
	
--Descomentar para simulacion	
--	clk_int <= clk;
	
	p_reg : process(clk_int, rst)
	begin
		if rst = '1' then
			data <= "00000000";
		elsif rising_edge(clk_int) then
			data(7)				<= es;
			data(6 downto 0)	<= data(7 downto 1);
		end if;
	end process p_reg;
	
	ss <= data(0);
end Behavioral;

