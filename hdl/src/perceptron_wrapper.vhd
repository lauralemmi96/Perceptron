library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity perceptron_wrapper is

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
			clk : in std_logic;
			a_rst_n : in std_logic;
			output:	out std_logic_vector(15 downto 0)
	);


end perceptron_wrapper;

architecture rtl of perceptron_wrapper is

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
		rst : in std_logic;
		clk: in std_logic
	); 
	
end component;
--Those are the signals given to the perceptron entity for the computation
signal input0:  std_logic_vector(7 downto 0);
signal input1:  std_logic_vector(7 downto 0);
signal input2:  std_logic_vector(7 downto 0);
signal input3:  std_logic_vector(7 downto 0);
signal input4:  std_logic_vector(7 downto 0);
signal input5:  std_logic_vector(7 downto 0);
signal input6:  std_logic_vector(7 downto 0);
signal input7:  std_logic_vector(7 downto 0);
signal input8:  std_logic_vector(7 downto 0);
signal input9:  std_logic_vector(7 downto 0);

signal output_reg : std_logic_vector(15 downto 0);

begin
	
	perceptron_map : perceptron
		port map(


			x0 => input0, x1 => input1, x2 => input2, x3 => input3, x4 => input4, 
			x5 => input5, x6 => input6, x7 => input7, x8 => input8, x9 => input9,

			y => output_reg,
			rst => a_rst_n,
			clk => clk

		);


	pipe_process : process(clk, a_rst_n)
		begin

			if(a_rst_n = '1') then
				input0 <= (others => '0');
				input1 <= (others => '0');
				input2 <= (others => '0');
				input3 <= (others => '0');
				input4 <= (others => '0');
				input5 <= (others => '0');
				input6 <= (others => '0');
				input7 <= (others => '0');
				input8 <= (others => '0');
				input9 <= (others => '0');
				output <= (others => '0');

			elsif(rising_edge(clk)) then
				input0 <= data0;
				input1 <= data1;
				input2 <= data2;
				input3 <= data3;
				input4 <= data4;
				input5 <= data5;
				input6 <= data6;
				input7 <= data7;
				input8 <= data8;
				input9 <= data9;

				output <= output_reg;
			end if;
		end process;
end rtl;