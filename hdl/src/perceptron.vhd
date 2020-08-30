library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity perceptron is
	
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
		clk : in std_logic
	); 
	
end entity perceptron;


architecture rtl of perceptron is 


signal output : std_logic_vector(15 downto 0);	--takes the result from the LUT.
signal a : std_logic_vector( Nbit + Mbit + 10 - 1 downto 0);	--takes the result of the sigmafunction.  

	component sigmafunction is
		generic(Xbit : positive:= 8 ;
			Wbit : positive := 9);
		port ( 
		x_0 : in std_logic_vector ( Xbit - 1 downto 0 );
	 	x_1 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_2 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_3 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_4 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_5 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_6 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_7 : in std_logic_vector ( Xbit - 1 downto 0 );
		x_8 : in std_logic_vector ( Xbit - 1 downto 0 );
	 	x_9 : in std_logic_vector ( Xbit - 1 downto 0 );
	
		
		sum : out std_logic_vector ( Wbit + Xbit+10-1 downto 0 );
		rst : in std_logic;
		clk : in std_logic
	); 
	end component ; 

	component lut is 
		generic(
			N : integer := 27;
			M_DATA : integer := 16
		);
		port(
		 address : in STD_LOGIC_VECTOR(N - 1 downto 0);
		 data : out STD_LOGIC_VECTOR(M_DATA - 1 downto 0)

	     	);
	end component;

begin
	sigmafunction_p : sigmafunction
		generic map(Xbit => Nbit, Wbit => Mbit)
		port map(
		  x_0 => x0, 
		  x_1 => x1, 
		  x_2 => x2, 
		  x_3 => x3, 
		  x_4 => x4, 
		  x_5 => x5, 
		  x_6 => x6, 
		  x_7 => x7, 
		  x_8 => x8, 
		  x_9 => x9, 
		  sum => a, 
		  rst => rst,
		  clk => clk
		 );

	
	lut_perc : lut
	generic map(N => Nbit + Mbit + 10, M_DATA => 16) 
	port map(
	   address => a, 
	   data => output
	);

	per: process(output, rst)
	
		begin
			if(rst = '1') then
				y <= (others => '0');
			
			elsif(rst = '0') then
				y <= output;
			end if;

		end process;

end rtl;
	
		
						   
