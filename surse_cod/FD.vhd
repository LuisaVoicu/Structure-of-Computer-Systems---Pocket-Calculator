----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 08:32:58 PM
-- Design Name: 
-- Module Name: FD - Behavioral
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

entity FD is
  Port (Clk : in STD_LOGIC;
        Rst : in STD_LOGIC;
        CE  : in STD_LOGIC;
        D   : in STD_LOGIC;
        Q   : out STD_LOGIC);
end FD;

architecture Behavioral of FD is
signal QQ : STD_LOGIC := '0';
begin
process(Clk, CE, Rst)
begin

    if RISING_EDGE(Clk) then
        if (Rst = '1') then
            QQ <= '0';
        elsif (CE = '1') then
            QQ <= D;
         else
            QQ <= QQ;
        end if;
    end if;
end process;
Q <= QQ;
end Behavioral;
