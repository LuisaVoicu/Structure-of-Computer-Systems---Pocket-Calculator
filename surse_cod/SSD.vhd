----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2023 14:39:32
-- Design Name: 
-- Module Name: SSD - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SSD is
    Port ( num : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end SSD;

architecture Behavioral of SSD is
signal cnt: STD_LOGIC_VECTOR(15 downto 0);
signal sel: STD_LOGIC_VECTOR(1 downto 0);
signal dig: STD_LOGIC_VECTOR(3 downto 0);

constant CNT_100HZ : integer := 2**20;  


signal cntClk  : integer range 0 to CNT_100HZ - 1 := 0;
signal NumV   : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); 
signal LedSel      : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');

begin


divclk: process (Clk)
    begin
    if (Clk'event and Clk = '1') then
        if (cntClk = CNT_100HZ - 1) then
            cntClk <= 0;
        else
            cntClk <= cntClk + 1;
        end if;
    end if;
end process;


NumV <= CONV_STD_LOGIC_VECTOR (cntClk, 16);
LedSel <= NumV (15 downto 14);

an <= 
"1110" when ledsel = "00" else
"1101" when ledsel = "01" else
"1011" when ledsel = "10" else
"0111" when ledsel = "11";



dig <= 
num(3 downto 0)  when ledsel = "00" else
num(7 downto 4) when ledsel = "01" else
num(11 downto 8) when ledsel = "10" else
num(15 downto 12) when ledsel = "11";


with Dig Select
   cat<= "1111001" when "0001",   --1
      "0100100" when "0010",   --2
      "0110000" when "0011",   --3
      "0011001" when "0100",   --4
      "0010010" when "0101",   --5
      "0000010" when "0110",   --6
      "1111000" when "0111",   --7
      "0000000" when "1000",   --8
      "0010000" when "1001",   --9
      "0001000" when "1010", --A
      "0000011" when "1011", --b
      "1000110" when "1100",--C
      "0100001" when "1101",--d
      "0000110" when "1110",--E
      "0001110" when "1111", --F
      "1000000" when others;   --0




--process(clk)
--begin
--if rising_edge(clk) then
--cnt<= cnt+1;
--end if;
--end process;

--sel <= cnt(15 downto 14);



---- mux up

--process (sel)
--begin
--   case sel is
--      when "00" => an<="1110";
--      when "01" => an<="1101";
--      when "10" => an<="1011";
--      when "11" => an<="0111";
--   end case;
--end process;

---- mux down
--process (sel, num)
--begin
--   case sel is
--      when "00" => dig<=num(3 downto 0);
--      when "01" => dig<=num(7 downto 4);
--      when "10" => dig<=num(11 downto 8);
--      when "11" => dig<=num(15 downto 12);
--   end case;
--end process;

--with Dig Select
--   cat<= "1111001" when "0001",   --1
--      "0100100" when "0010",   --2
--      "0110000" when "0011",   --3
--      "0011001" when "0100",   --4
--      "0010010" when "0101",   --5
--      "0000010" when "0110",   --6
--      "1111000" when "0111",   --7
--      "0000000" when "1000",   --8
--      "0010000" when "1001",   --9
--      "0001000" when "1010", --A
--      "0000011" when "1011", --b
--      "1000110" when "1100",--C
--      "0100001" when "1101",--d
--      "0000110" when "1110",--E
--      "0001110" when "1111", --F
--      "1000000" when others;   --0



end Behavioral;
