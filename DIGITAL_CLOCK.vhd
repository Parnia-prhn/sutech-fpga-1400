

library IEEE;                                                                      
use IEEE.STD_LOGIC_1164.ALL;                                                    
use IEEE.numeric_std.all;   
use ieee.std_logic_unsigned.all;

entity DIGITAL_CLOCK is
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
end DIGITAL_CLOCK;

architecture Behavioral of DIGITAL_CLOCK is

 type T_STATE is (START , WORK_NORMAL , SETUP_TIME , SETUP_ALARM , BUZZER_ON);
 signal STATE , NEXT_STATE : T_STATE;
 signal CUR_TIME, ALARM_TIME : STD_LOGIC_VECTOR(19 downto 0);
 signal A_H_in0,A_H_in1 , A_M_in0 , A_M_in1 : STD_LOGIC_VECTOR(3 downto 0);

component NUMTO7SEG
port (
 num: in std_logic_vector(3 downto 0);
 s_seg: out std_logic_vector(6 downto 0)
);
end component;

component CLK_DV 
port(
    clk_50: in std_logic;
    clk_1s: out std_logic
    );  
end component;

signal clk_1s: std_logic;
signal hour_cnt , minute_cnt , second_cnt : integer ;
signal H_out1_bin: std_logic_vector(3 downto 0);
signal H_out0_bin: std_logic_vector(3 downto 0);
signal M_out1_bin: std_logic_vector(3 downto 0);
signal M_out0_bin: std_logic_vector(3 downto 0);
signal S_out1_bin: std_logic_vector(3 downto 0);
signal S_out0_bin: std_logic_vector(3 downto 0);

begin

SC: CLK_DV port map(CLK,clk_1s);
REG : process(clk_1s,RESET)
begin
    if RESET='1' then
    STATE <= START;
    elsif clk_1s'event and clk_1s='1' then
    STATE <= NEXT_STATE;
    end if;
    end process REG;
---------------------------------------------
CMB : Process(SET_TIME , SET_ALARM ,  STOP_ALARM , ALARM_ON , CLOCK_ON , STATE , CUR_TIME , ALARM_TIME)                                                                                                      
begin

case STATE is 

when START => if(CLOCK_ON='1') then
    NEXT_STATE <= WORK_NORMAL;
    end if;
when WORK_NORMAL => if(CLOCK_ON='0') then
    NEXT_STATE <= START;
    elsif(SET_TIME ='1') then
    NEXT_STATE <= SETUP_TIME;
    elsif(SET_ALARM='1') then 
    NEXT_STATE <= SETUP_ALARM;
    elsif(ALARM_ON='1' and CUR_TIME = ALARM_TIME) then
        NEXT_STATE <= BUZZER_ON;
        end if;

when SETUP_TIME => if(SET_TIME ='0') then
    NEXT_STATE <= WORK_NORMAL;
    end if;

when SETUP_ALARM => if(SET_ALARM='0') then
    NEXT_STATE <= WORK_NORMAL;
    end if;

when BUZZER_ON => if(CUR_TIME <= ALARM_TIME +10) then
        NEXT_STATE <= BUZZER_ON;
        elsif((STOP_ALARM='1') or (CUR_TIME > ALARM_TIME +10) or (ALARM_ON ='0')) then
    NEXT_STATE <= WORK_NORMAL;
    end if;

end case ;
end process CMB;

------------------------------------------
OUTPUT : process(STATE,clk_1s)
begin

case STATE is
when START =>
    
    hour_cnt <= 0;
    minute_cnt <= 0;
    second_cnt <= 0;

when WORK_NORMAL =>

if(clk_1s'event and clk_1s='1')then                         
    second_cnt <= second_cnt +1;
    if(second_cnt>=59)then
        minute_cnt <= minute_cnt +1;
        second_cnt <=0 ;
    if(minute_cnt >= 59)then
        hour_cnt <= hour_cnt +1;
        minute_cnt <= 0;
    if(hour_cnt >= 24)then
        hour_cnt <= 0;
    end if;
    end if;
    end if;
    end if;
----------------------------
if(hour_cnt >=20) then
  H_out1_bin <= "0010";
  elsif(hour_cnt >=10) then
     H_out1_bin <= "0001";
     elsif(hour_cnt >=0)then                         
       H_out1_bin <= "0000";
end if;
H_out0_bin <= std_logic_vector(to_unsigned((hour_cnt - to_integer(unsigned(H_out1_bin))*10),4));
---------------------------------
if(minute_cnt >=50) then
   M_out1_bin <= "0101";
  elsif(minute_cnt >=40) then
     M_out1_bin <= "0100";
     elsif(minute_cnt >=30) then
       M_out1_bin <= "0011";
       elsif(minute_cnt >=20) then
        M_out1_bin <= "0010";
        elsif(minute_cnt >=10) then
           M_out1_bin <= "0001";
           elsif(minute_cnt >=0) then                                     
            M_out1_bin <= "0000";
end if;  
M_out0_bin <= std_logic_vector(to_unsigned((minute_cnt - to_integer(unsigned(M_out1_bin))*10),4));

-----------------------------

    CUR_TIME <= H_out1_bin & H_out0_bin & M_out1_bin & M_out0_bin & "0000";
    
    


when SETUP_TIME =>
    hour_cnt <= to_integer(unsigned(H_in1))*10 + to_integer(unsigned(H_in0));
    minute_cnt <= to_integer(unsigned(M_in1))*10 + to_integer(unsigned(M_in1));
    second_cnt <= 0;

when SETUP_ALARM =>

    ALARM_TIME<= H_IN0 & "00" & H_IN1 & M_IN0 & M_IN1 &"0000";  

when BUZZER_ON =>
        ALARM <= '1';


 end case;
 end process OUTPUT;
 
 ----------------------------------------------------- 
S1: NUMTO7SEG port map(H_out1_bin,H_out1);
S2: NUMTO7SEG port map(H_out0_bin,H_out0);
S3: NUMTO7SEG port map(M_out1_bin,M_out1);
S4: NUMTO7SEG port map(M_out0_bin,M_out0);
S5: NUMTO7SEG port map(S_out1_bin,S_out1);
S6: NUMTO7SEG port map(S_out0_bin,S_out0);

end Behavioral;
