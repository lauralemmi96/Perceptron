library IEEE;
use IEEE.std_logic_1164.all;

entity perceptron_wrapper_tb is
end perceptron_wrapper_tb;

architecture bhv of perceptron_wrapper_tb is

	constant T_CLK : time := 10 ns;
	constant T_RESET : time := 25 ns;
	constant Xbit : positive := 8;

	signal clk_tb	: std_logic := '0';	-- clock inizialized to '0'
	signal rst_tb	: std_logic := '1'; -- reset inizialized to '1'
	signal input_tb0 : std_logic_vector(Xbit - 1 downto 0) := "11111111";  
	signal input_tb1 : std_logic_vector(Xbit - 1 downto 0) := "00000001"; 
	signal input_tb2 : std_logic_vector(Xbit - 1 downto 0) := "00000001"; 
	signal input_tb3 : std_logic_vector(Xbit - 1 downto 0) := "00000000"; 
	signal input_tb4 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	signal input_tb5 : std_logic_vector(Xbit - 1 downto 0) := "11111111";
	signal input_tb6 : std_logic_vector(Xbit - 1 downto 0) := "00000000";
	signal input_tb7 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	signal input_tb8 : std_logic_vector(Xbit - 1 downto 0) := "00000001";
	signal input_tb9 : std_logic_vector(Xbit - 1 downto 0) := "00000001"; 

	signal output_tb : std_logic_vector(15 downto 0 );


	component perceptron_wrapper is
		port(

			data0: in std_logic_vector(7 downto 0);
			data1: in std_logic_vector(7 downto 0);
			data2: in std_logic_vector(7 downto 0);
			data3: in std_logic_vector(7 downto 0);
			data4: in std_logic_vector(7 downto 0);
			data5: in std_logic_vector(7 downto 0);
			data6: in std_logic_vector(7 downto 0);
			data7: in std_logic_vector(7 downto 0);
			data8: in std_logic_vector(7 downto 0);
			data9: in std_logic_vector(7 downto 0);
			clk	:	in std_logic;
			a_rst_n : in std_logic;
			output:	out std_logic_vector(15 downto 0)
		);
	end component;


	begin

		clk_tb <= (not(clk_tb)) after T_CLK/2;
		rst_tb <= '0' after T_RESET;

		test_wrapper : perceptron_wrapper
			port map(input_tb0, input_tb1, input_tb2, input_tb3, input_tb4, input_tb5, input_tb6, input_tb7, input_tb8, input_tb9, clk_tb, rst_tb, output_tb);
end bhv;