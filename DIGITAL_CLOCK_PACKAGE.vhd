
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



package DIGITAL_CLOCK_PACKAGE is

component DIGITAL_CLOCK
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
end component;



component CLK_DV
port(
    clk_50: in std_logic;
    clk_1s: out std_logic
    );
end component;


component NUMTO7SEG 
port (
 NUM: in std_logic_vector(3 downto 0);
 S_SEG: out std_logic_vector(6 downto 0)
);
end component;
end DIGITAL_CLOCK_PACKAGE;



package body DIGITAL_CLOCK_PACKAGE is

end DIGITAL_CLOCK_PACKAGE;
