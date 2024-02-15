----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2023 20:09:49
-- Design Name: 
-- Module Name: UC - Behavioral
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

entity UC_MUL is
  Port ( 
  signal clk, start, rst, rstState: in STD_LOGIC;
  signal q0qm1 : in STD_LOGIC_VECTOR(1 downto 0);
  signal loadA, loadQ, loadB, rstA, rstQm1, subB, shrAQ, Term: out STD_LOGIC
   );
end UC_MUL;

architecture Behavioral of UC_MUL is

type state_type is (idle, init, compare , add, sub, shift, stop);
signal state: state_type := idle;
signal c: NATURAL:=4;
signal done : STD_LOGIC := '0';

begin


process(clk)
begin

    if clk='1' and clk'event then

            if state = idle then
                c <= 15;
            elsif state = shift then
                c <= c - 1;
            end if;
        end if;
end process;



process(clk)
begin


    if clk'event and clk='1' then
    
        if rstState = '1' then
            state <= idle;
        else
    case state is
        
        when idle =>
            if start = '1' then
                state <= init;
             end if;
             
        when init =>
              state <= compare;
        
        when compare =>
             case q0qm1 is
                when "10" => state <= sub;
                when "01" => state <= add;
                when others => state <= shift;
              end case;
        
        when add =>
                state <= shift;
        
        when sub => 
                state <= shift;
        
        when shift =>
                if c = 0 then
                    state <= stop;
                 else
                    state <= compare;
                 end if;
         when stop => 
            
           
    end case;
    end if;
    end if;
end process;



--type state_type is (idle, init, compare , add, sub, shift, stop);


process(state)
begin

    case state is
        when idle =>   LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShrAQ <= '0';
                       SubB <= '0';
                       RstA <= '1';
                       RstQm1 <= '0';
                       term <= '0';

        when init =>   LoadA <= '0';
                       LoadB <= '1';
                       LoadQ <= '1';
                       ShrAQ <= '0';
                       SubB <= '0';
                       RstA <= '1';
                       RstQm1 <= '1';
                       term <= '0';

        when compare =>   LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShrAQ <= '0';
                       SubB <= '0';
                       RstA <= '0';
                       RstQm1 <= '0';
                       term <= '0';

        when add =>   LoadA <= '1';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShrAQ <= '0';
                       SubB <= '0';
                       RstA <= '0';
                       RstQm1 <= '0';
                       term <= '0';

        when sub =>   LoadA <= '1';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShrAQ <= '0';
                       SubB <= '1';
                       RstA <= '0';
                       RstQm1 <= '0';
                       term <= '0';


        when shift =>   LoadA <= '0';
                       LoadB <= '0';
                       LoadQ <= '0';
                       ShrAQ <= '1';
                       SubB <= '0';
                       RstA <= '0';
                       RstQm1 <= '0';
                       term <= '0';

         when Stop => LoadB <= '0';
                       SubB <= '0';
                       RstA <= '0';
                       LoadA <= '0';
                       ShrAQ <= '0';
                       LoadQ <= '0';
                       RstQm1 <= '0';
                       term <= '1';

    end case;
end process;


end Behavioral;
