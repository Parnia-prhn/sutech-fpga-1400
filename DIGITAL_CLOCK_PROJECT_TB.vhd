


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library xil_defaultlib;
use xil_defaultlib.DIGITAL_CLOCK_PACKAGE.ALL;


entity DIGITAL_CLOCK_PROJECT_TB is
end DIGITAL_CLOCK_PROJECT_TB;

architecture Behavioral of DIGITAL_CLOCK_PROJECT_TB is
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

   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal H_in1 : std_logic_vector(1 downto 0) := (others => '0');
   signal H_in0 : std_logic_vector(3 downto 0) := (others => '0');
   signal M_in1 : std_logic_vector(3 downto 0) := (others => '0');
   signal M_in0 : std_logic_vector(3 downto 0) := (others => '0');
   
   signal SET_TIME : STD_LOGIC := '0';
   signal SET_ALARM : STD_LOGIC := '0';
   signal STOP_ALARM : STD_LOGIC := '0';
   signal ALARM_ON : STD_LOGIC := '0';
   signal CLOCK_ON : STD_LOGIC := '0';
    signal ALARM : STD_LOGIC ;
   signal H_out1 : std_logic_vector(6 downto 0);
   signal H_out0 : std_logic_vector(6 downto 0);
   signal M_out1 : std_logic_vector(6 downto 0);
   signal M_out0 : std_logic_vector(6 downto 0);
   signal S_out1 : std_logic_vector(6 downto 0);
   signal S_out0 : std_logic_vector(6 downto 0);
  
 constant clk_period : time := 10 ps;
begin

u: digital_clock PORT MAP (
          
    H_in1 => H_in1,
    H_in0 => H_in0,
    M_in1 => M_in1,
    M_in0 => M_in0,
    CLK => CLK,
    RESET => RESET,
    SET_TIME => SET_TIME,
    SET_ALARM => SET_ALARM,
    STOP_ALARM => STOP_ALARM,
    ALARM_ON => ALARM_ON,
    CLOCK_ON => CLOCK_ON,
    H_out1 => H_out1,
    H_out0 => H_out0,
    M_out1 => M_out1,
    M_out0 => M_out0,
    S_out1 => S_out1,
    S_out0 => S_out0
          
    );
    
process
begin
 CLK <= '0';
 wait for clk_period/2;
 CLK <= '1';
 wait for clk_period/2;
   end process;


process
begin 


SET_TIME <= '1';
 H_in1 <= "01"; 
 H_in0 <= "0010";
 M_in1 <= "0000";
 M_in0 <= "0010"; 
 SET_TIME <='0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
      SET_TIME <= '1';
 H_in1 <= "00"; 
 H_in0 <= "0011";
 M_in1 <= "0010";
 M_in0 <= "0010"; 
 SET_TIME <='0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
SET_TIME <= '1';
 H_in1 <= "01"; 
 H_in0 <= "0010";
 M_in1 <= "0000";
 M_in0 <= "0010"; 
 SET_TIME <='0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
SET_TIME <= '1';
 H_in1 <= "10"; 
 H_in0 <= "0010";
 M_in1 <= "0011";
 M_in0 <= "0011"; 
 SET_TIME <='0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
SET_TIME <= '1';
 H_in1 <= "01"; 
 H_in0 <= "0111";
 M_in1 <= "0110";
 M_in0 <= "0010"; 
 SET_TIME <='0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
SET_ALARM <= '1';
 H_in1 <= "01";
 H_in0 <= "0011";
 M_in1 <= "0000";
 M_in0 <= "0010";
 SET_ALARM <= '0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
SET_ALARM <= '1';
 H_in1 <= "00";
 H_in0 <= "0011";
 M_in1 <= "0010";
 M_in0 <= "0010";
 SET_ALARM <= '0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;
      
      SET_ALARM <= '1';
 H_in1 <= "10";
 H_in0 <= "0101";
 M_in1 <= "0001";
 M_in0 <= "0011";
 SET_ALARM <= '0';
      wait for 100 ns; 
      RESET <= '1';
      wait for clk_period*10;



   end process;
end Behavioral;
