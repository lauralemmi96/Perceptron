library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity sigmafunction is
	
	generic(Xbit : positive := 8;
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
	
		
		sum : out std_logic_vector ( Xbit + Wbit + 10 -1  downto 0 );
		rst : in std_logic;
		clk : in std_logic
	); 
	
end entity sigmafunction;

architecture rtl of sigmafunction is

	signal w_0 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000001";
	signal w_1 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000001";
	signal w_2 : std_logic_vector ( Wbit - 1 downto 0 ) := "111111111";
	signal w_3 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000001";
	signal w_4 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000000";
	signal w_5 : std_logic_vector ( Wbit - 1 downto 0 ) := "111111111";
	signal w_6 : std_logic_vector ( Wbit - 1 downto 0 ) := "111111111";
	signal w_7 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000000";
	signal w_8 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000001";
	signal w_9 : std_logic_vector ( Wbit - 1 downto 0 ) := "000000001";

	signal bias : std_logic_vector( Wbit - 1 downto 0) := "000000000";
	signal temp : std_logic_vector ( Xbit+Wbit+8 downto 0);
	signal bias_ext : std_logic_vector ( Xbit+Wbit+8  downto 0);

	begin
		
		proc: process(rst, clk)

		begin 
			if(rst = '1') then
				temp <= (others => '0');

			elsif(rising_edge(clk)) then
			
				temp <= std_logic_vector(resize( 
				( signed (x_0) *  signed (w_0) ) + ( signed (x_1) *  signed (w_1) ) + 
				( signed (x_2) *  signed (w_2) ) + ( signed (x_3) *  signed (w_3) ) +
				( signed (x_4) *  signed (w_4) ) + ( signed (x_5) *  signed (w_5) ) +
				( signed (x_6) *  signed (w_6) ) + ( signed (x_7) *  signed (w_7) ) +
				( signed (x_8) *  signed (w_8) ) + ( signed (x_9) *  signed (w_9) ), temp'length));
			
			end if;
			
		end process;
			bias_ext <= std_logic_vector(resize(signed(bias), temp'length));
			sum <= std_logic_vector(resize(signed(signed(temp)+signed(bias_ext)), sum'length));
	end rtl;