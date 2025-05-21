library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity C4M1P2 is port ( 
SW: in std_logic_vector(3 downto 0); 
HEX0, HEX1: out std_logic_vector(6 downto 0) 
); 
end C4M1P2;

architecture behavioral of C4M1P2 is
    signal V : std_logic_vector(3 downto 0); 
    signal d0 : std_logic_vector(3 downto 0);
    signal d1 : std_logic_vector(6 downto 0);
    signal z : std_logic; 
    signal A : std_logic_vector(3 downto 0);

    begin
		  V <= SW;
		  z <= '1' when V > "0111" else '0';
		  
		  d0 <= V when z = '0' else A;
		  
		  A <= V when V > "0111" else "0000";
        
		  HEX0 <= "1000000" when d0 = "0000" else 
            "1111001" when d0 = "0001" else 
            "0100100" when d0 = "0010" else 
            "0110000" when d0 = "0011" else 
            "0011001" when d0 = "0100" else 
            "0010010" when d0 = "0101" else 
            "0000010" when d0 = "0110" else 
            "1111000" when d0 = "0111" else 
				"0000000" when d0 = "1000" else 
            "0011000" when d0 = "1001" else 
            "1000000" when d0 = "1010" else 
            "1111001" when d0 = "1011" else 
            "0100100" when d0 = "1100" else 
            "0110000" when d0 = "1101" else 
            "0011001" when d0 = "1110" else 
            "0010010" when d0 = "1111" else "0000000";

        
        d1 <= "1111001" when z = '1' else "0000000";
        
		  HEX1 <= d1;

end behavioral;

