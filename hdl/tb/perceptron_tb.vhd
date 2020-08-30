library IEEE;
use IEEE.std_logic_1164.all;

entity perceptron_tb is
end perceptron_tb;	

architecture bhv of perceptron_tb is 

	constant T_CLK : time := 10 ns;
	constant RESET : time := 25 ns;	   
	constant Xbit : positive := 8;
	constant Wbit : positive := 9;
	
	signal rst_tb : std_logic := '1';	
	signal clk_tb : std_logic := '0'; 
	signal x_tb1 : std_logic_vector(Xbit - 1 downto 0) := "11111111";  
	signal x_tb2 : std_logic_vector(Xbit - 1 downto 0) := "00000001"; 
	signal x_tb3 : std_logic_vector(Xbit - 1 downto 0) := "00000001"; 
	signal x_tb4 : std_logic_vector(Xbit - 1 downto 0) := "00000000"; 
	signal x_tb5 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	signal x_tb6 : std_logic_vector(Xbit - 1 downto 0) := "11111111";
	signal x_tb7 : std_logic_vector(Xbit - 1 downto 0) := "00000000";
	signal x_tb8 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	signal x_tb9 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	signal x_tb10 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	

	signal y_tb : std_logic_vector(15 downto 0 );
	
	component perceptron is	
		generic(Nbit : positive := 8;
			Mbit : positive := 9);
	port ( 
		x0 : in std_logic_vector ( Nbit - 1 downto 0 );
	 	x1 : in std_logic_vector ( Nbit - 1 downto 0 );
		x2 : in std_logic_vector ( Nbit - 1 downto 0 );
		x3 : in std_logic_vector ( Nbit - 1 downto 0 );
		x4 : in std_logic_vector ( Nbit - 1 downto 0 );
		x5 : in std_logic_vector ( Nbit - 1 downto 0 );
		x6 : in std_logic_vector ( Nbit - 1 downto 0 );
		x7 : in std_logic_vector ( Nbit - 1 downto 0 );
		x8 : in std_logic_vector ( Nbit - 1 downto 0 );
	 	x9 : in std_logic_vector ( Nbit - 1 downto 0 );
	
		y : out std_logic_vector ( 15 downto 0 );
		clk: in std_logic;
		rst : std_logic
	); 
	end component;
	
	begin
		clk_tb <= (not(clk_tb)) after T_CLK/2;
		rst_tb <= '0' after RESET; 
		
		test_p : perceptron
		generic map(Nbit => Xbit, Mbit => Wbit)
		port map(x_tb1, x_tb2, x_tb3, x_tb4, x_tb5, x_tb6, x_tb7, x_tb8, x_tb9, x_tb10, y_tb, clk_tb, rst_tb);
	
end bhv;