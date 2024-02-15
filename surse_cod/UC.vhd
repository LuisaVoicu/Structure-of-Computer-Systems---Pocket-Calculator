----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 09:38:13 PM
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC is
  generic (n: natural := 8);
  Port (Clk   : in STD_LOGIC;
        Rst   : in STD_LOGIC;
        Start : in STD_LOGIC;
        Q0Q_1 : in STD_LOGIC_VECTOR(1 downto 0);
        LoadQ : out STD_LOGIC;
        LoadB : out STD_LOGIC;
        RstQ_1: out STD_LOGIC;
        RstA  : out STD_LOGIC;
        ShrAQ : out STD_LOGIC;
        AddSub: out STD_LOGIC;
        Term  : out STD_LOGIC;
        LoadA : out STD_LOGIC );
end UC;

architecture Behavioral of UC is
type type_state is (idle, init, checkQ0Q_1, subB, addB, shift, checkC, stop);
signal next_state : type_state;
signal c: natural:=0;
begin

stare_urmatoare:process(Clk)
begin
   if RISING_EDGE(Clk) then
     if (Rst = '1') then
         next_state <= idle;
      else
        case next_state is
            when idle =>
                if(Start = '1') then
                    next_state <= init;
                else
                    next_state <= idle;
                end if;
            when init =>
                next_state <= checkQ0Q_1;
                c <= n;
            when checkQ0Q_1 =>
                if(Q0Q_1 = "01") then
                    next_state <= addB;
                elsif (Q0Q_1 = "10") then
                    next_state <= subB;
                elsif (Q0Q_1 = "00" or Q0Q_1="11") then
                    next_state <= shift;
                end if;
            when shift =>
                c <= c-1;
                next_state <= checkC;
            when addB =>
                next_state <= shift;
            when subB =>
                next_state <= shift;
            when checkC =>
                if (c = 0) then
                    next_state <= stop;
                else
                    next_state <= checkQ0Q_1;
                end if;
            when stop =>
                next_state <= idle;
            end case;
end if;
end if;
end process;   

RstA <= '1' when next_state = init else '0';
LoadA <= '1' when next_state = addB or next_state = subB else '0';
ShrAQ <= '1' when next_state = shift else '0';
LoadQ <= '1' when next_state = init else '0';
RstQ_1 <= '1' when next_state = init else '0';
LoadB <= '1' when next_state = init else '0';
AddSub <= '1' when next_state = subB else '0';
Term <= '1' when next_state = stop else '0';

end Behavioral;
