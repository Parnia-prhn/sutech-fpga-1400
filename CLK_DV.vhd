



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLK_DV is
port(
    clk_50: in std_logic;
    clk_1s: out std_logic
    );
end CLK_DV;

architecture Behavioral of CLK_DV is
signal counter:integer range 0 to 25000:=0;
signal t: std_logic := '0';

begin
 process(clk_50)
 begin
  if(rising_edge(clk_50)) then
   counter <= counter + 1;
   if(counter=25000) then 
   t <= not t;
    counter <= 0;
    
   end if;
  end if;
 end process;
 clk_1s <= t;

end Behavioral;

