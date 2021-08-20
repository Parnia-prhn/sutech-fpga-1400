library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity NUMTO7SEG is
port (
 NUM: in std_logic_vector(3 downto 0);
 S_SEG: out std_logic_vector(6 downto 0)
);
end NUMTO7SEG;

architecture Behavioral of NUMTO7SEG is

begin
 process(NUM)
 begin
  case(NUM) is
   when "0000" =>  S_SEG <= "0000001";
   when "0001" =>  S_SEG <= "1001111";
   when "0010" =>  S_SEG <= "0010010"; 
   when "0011" =>  S_SEG <= "0000110"; 
   when "0100" =>  S_SEG <= "1001100";  
   when "0101" =>  S_SEG <= "0100100";    
   when "0110" =>  S_SEG <= "0100000"; 
   when "0111" =>  S_SEG <= "0001111";   
   when "1000" =>  S_SEG <= "0000000";
   when "1001" =>  S_SEG <= "0000100"; 
   when "1010" =>  S_SEG <= "0000010"; 
   when "1011" =>  S_SEG <= "1100000"; 
   when "1100" =>  S_SEG <= "0110001"; 
   when "1101" =>  S_SEG <= "1000010"; 
   when "1110" =>  S_SEG <= "0110000"; 
   when others =>  S_SEG <= "0111000"; 
   end case;
 end process;

end Behavioral;
