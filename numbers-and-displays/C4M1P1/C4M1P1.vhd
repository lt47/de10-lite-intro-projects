library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity C4M1P1 is port ( 
SW: in std_logic_vector(9 downto 0); 
HEX0, HEX1: out std_logic_vector(6 downto 0) 
); 
end C4M1P1;

architecture behavioral of C4M1P1 is
    function display_number(switch_in : std_logic_vector(3 downto 0)) return std_logic_vector is 
    begin
        case switch_in is 
            when "0000" => return "1000000";
            when "0001" => return "1111001";
            when "0010" => return "0100100";
            when "0011" => return "0110000";
            when "0100" => return "0011001";
            when "0101" => return "0010010";
            when "0110" => return "0000010";
            when "0111" => return "1111000";
            when "1000" => return "0000000";
            when "1001" => return "0011000";
            when others => return "0000000";
        end case;    
    end function;
	 
	 begin 
		HEX0 <= display_number(SW(3 downto 0));
		HEX1 <= display_number(SW(7 downto 4));
end behavioral;

