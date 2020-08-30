library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity lut is  
	generic(
		N : integer := 27;
		M_DATA : integer := 16
	);
	port(
		 address : in STD_LOGIC_VECTOR(N - 1 downto 0);
		 data : out STD_LOGIC_VECTOR(M_DATA - 1 downto 0)
	     );
end lut;



architecture lut_beh of lut is	  
	signal add : std_logic_vector(N - 1 downto 0);
   		type lut_t is array(0 to 22) of STD_LOGIC_VECTOR(M_DATA-1 downto 0) ;
	    -- All the output are representend in half-precision-point format
		constant lut : lut_t := (
					"0000000100011000",
					"0000001011111010",
					"0000100000001011",
					"0000110101111111",
					"0001001101110111",
					"0001100100010000",
					"0001111011011010",
					"0010010010011011",
					"0010101000010010",
					"0010111110100001",
					"0011010001001110",
					"0011100000000000",
					"0011100111011001",
					"0011101100001100",
					"0011101110011111",
					"0011101111011011",
					"0011101111110010",
					"0011101111111011",
					"0011101111111110",
					"0011101111111111",
					"0011110000000000",
					"0011110000000000",
					"0011110000000000"
		);

		 	

		begin
		-- add "1011" because the value of a can be negative and could not be used as address
		add <= std_logic_vector(signed(address) + "000000000000000000000001011");
		data<=lut(TO_INTEGER(unsigned(add)));


		
end lut_beh;

