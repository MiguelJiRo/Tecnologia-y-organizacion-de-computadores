library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_sp is
	port (rst : in std_logic;
			clk : in std_logic;
			es  : in std_logic;
			sp  : out std_logic_vector(7 downto 0));
end registro_sp;

architecture Behavioral of registro_sp is

	signal clk_int: std_logic;
	signal data : std_logic_vector(7 downto 0) := "00000000";

	component divisor is
		port (rst        : in  std_logic;         -- asynch reset
				clk_100mhz : in  std_logic;         -- 100 MHz input clock
				clk_1hz    : out std_logic);        -- 1 Hz output clock
	end component;
	

begin

	i_clk_int : divisor port map(rst, clk, clk_int);
	
--	clk_int <= clk;

	p_reg_sp : process(clk_int, rst)
	begin
		if rst = '1' then
			data <= "00000000";
		elsif rising_edge(clk_int) then
			data(0)				<= es;
			data(7 downto 1)	<= data(6 downto 0);
		end if;
	end process p_reg_sp;

	sp <= data;

end Behavioral;

