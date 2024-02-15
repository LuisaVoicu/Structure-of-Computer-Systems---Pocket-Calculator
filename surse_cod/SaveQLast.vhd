----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2023 21:47:35
-- Design Name: 
-- Module Name: SaveQLast - Behavioral
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

entity SaveQLast is
  Port ( 
  signal clk, rst, load, data : in STD_LOGIC;
  signal result : out STD_LOGIC
  );
end SaveQLast;

architecture Behavioral of SaveQLast is

begin


process(clk)
begin

    if clk = '1' and clk'event then
        if rst = '1' then
            result <= '0'; 
        else
            if load = '1' then
                result <= data;
            end if;
        end if;
    end if;
    
end process;

end Behavioral;
