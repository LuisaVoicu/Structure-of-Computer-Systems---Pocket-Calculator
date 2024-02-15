----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2023 13:16:03
-- Design Name: 
-- Module Name: UC_DIV - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC_DIV is
  Port (
    signal clk, start, rst: in STD_LOGIC;
    signal An :  in STD_LOGIC;
    signal LoadA, LoadB, LoadQ, shlAQ, subB, Term, RstQ0, rstA: out STD_LOGIC
   );
end UC_DIV;

architecture Behavioral of UC_DIV is

type state_type is (idle, init, shift , sub, compareA, add, subC, compareC, stop);
signal state: state_type;
signal c: NATURAL:=15;
signal done : STD_LOGIC := '0';


begin


process(clk)
begin

    if clk='1' and clk'event then
        if state = idle then
            c <= 14;
        elsif state = subC then
            c <= c - 1;
        end if;
     end if;
end process;



process (clk)
begin
--type state_type is (idle, init, shift , sub, compareA, add, subC, compareC, stop);


if clk'event and clk='1' then
    case state is
        when idle =>
            if start = '1' then
                state <= init;
             end if;
         
        when init =>
            state <=  shift;
       
        when shift =>
            state <= sub;
        
        when sub =>
            state <= compareA;
        
        when compareA =>
            if An = '1' then
                state <= add;
            else
                state <= subC;
            end if;
        
        when add =>
            state <= subC;
            
        when subC =>
            state <= compareC;
            
        when compareC =>
            if c = 0 then
                state <= stop;
            else
                state <= shift;
            end if;
         when stop =>
            
        end case;
      end if;
end process;


--type state_type is (idle, init, shift , sub, compareA, add, subC, compareC, stop);


process(state)
begin

    case state is
        when idle =>   LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '0';
                       SubB <= '0';
                       term <= '0'; 
                       rstQ0 <= '0';
                       rstA <= '1';
                       
        when init =>   LoadA <= '0';
                       LoadB <= '1';
                       LoadQ <= '1';
                       ShlAQ <= '0';
                       SubB <= '0';
                       term <= '0'; 
                       rstQ0 <= '0';
                       rstA <= '1';
         
        when shift =>  LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '1';
                       SubB <= '0';
                       term <= '0'; 
                      -- rstQ0 <= '1';
                       rstQ0 <= '0';
                       rstA <= '0';
                       
        when sub =>    LoadA <= '1';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '0';
                       SubB <= '1';
                       term <= '0'; 
                       rstQ0 <= '0';
                       --rstQ0 <= '1';
                       rstA <= '0';
                          
        when compareA =>    
                       LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '0';
                       SubB <= '0';
                       term <= '0'; 
                       rstQ0 <= '0';
                       rstA <='0';
         
                           
        when add =>    LoadA <= '1';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '0';
                       SubB <= '0';
                       term <= '0'; 
                       rstQ0 <= '0';
                        rstA <='0';

 
        when subC =>    LoadA <= '0';
                                      LoadB <= '0';
                                      LoadQ <= '0';
                                      ShlAQ <= '0';
                                      SubB <= '0';
                                      term <= '0'; 
                                      rstQ0 <= '0';
                                      rstA <= '0';
 
        when compareC =>    LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '0';
                       SubB <= '0';
                       term <= '0'; 
                       rstQ0 <= '0';
                       rstA <='0';
 

 
        when stop =>    LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShlAQ <= '0';
                       SubB <= '0';
                       term <= '1'; 
                       rstQ0 <= '0';
                       rstA <='0';
     end case;
end process;


end Behavioral;
