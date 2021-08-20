

library IEEE;
library xil_defaultlib;
use IEEE.STD_LOGIC_1164.ALL;
use xil_defaultlib.DIGITAL_CLOCK_PACKAGE.ALL;


entity DIGITAL_CLOCK_PROJECT2 is
port(
    CLK : in STD_LOGIC;
    
    RESET : in STD_logic;
    
    H_in0 : in STD_LOGIC_VECTOR(3 downto 0);
    
    H_in1 : in STD_LOGIC_VECTOR(1 downto 0);
    
    M_in0 : in STD_LOGIC_VECTOR(3 downto 0);
    
    M_in1 : in STD_LOGIC_VECTOR(3 downto 0);
    
    SET_TIME : in STD_LOGIC;
    
    SET_ALARM : in STD_LOGIC;
    
    STOP_ALARM : in STD_LOGIC;
    
    ALARM_ON : in STD_LOGIC;
    
    CLOCK_ON : in STD_LOGIC;
    
    
    
    ALARM : out STD_LOGIC;
    
    H_out0 : out STD_LOGIC_VECTOR(6 downto 0);
    
    H_out1 : out STD_LOGIC_VECTOR(6 downto 0);
    
    M_out0 : out STD_LOGIC_VECTOR(6 downto 0);
    
    M_out1 : out STD_LOGIC_VECTOR(6 downto 0);
    
    S_out0 : out STD_LOGIC_VECTOR(6 downto 0);
    
    S_out1 : out STD_LOGIC_VECTOR(6 downto 0)
    
    );

end DIGITAL_CLOCK_PROJECT2;

architecture Behavioral of DIGITAL_CLOCK_PROJECT2 is
begin

U0:DIGITAL_CLOCK port map(CLK,RESET,H_in0,H_in1,M_in0,M_in1,SET_TIME,SET_ALARM,STOP_ALARM,ALARM_ON,CLOCK_ON,ALARM,H_out0,H_out1,M_out0,M_out1,S_out0,S_out1);


end Behavioral;
