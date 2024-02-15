----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2023 19:43:25
-- Design Name: 
-- Module Name: ShiftLoadReg - Behavioral
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

entity ShiftLoadReg is
  Port (
  clk, rst, shrEn, shiftR, load : in STD_LOGIC;
  Data : in STD_LOGIC_VECTOR(15 downto 0);
  Result : out STD_LOGIC_VECTOR(15 downto 0)
  );
end ShiftLoadReg;

architecture Behavioral of ShiftLoadReg is

signal aux :  STD_LOGIC_VECTOR(15 downto 0);
begin



process(clk)
begin
    
    if clk'event and clk = '1' then
        if rst = '1' then
            aux <= (others => '0');
        else 
            if load = '1' then
                aux <= Data;
             else 
                 if shrEn = '1' then
                    aux(15 downto 0) <= shiftR & aux(15 downto 1);
--                 else
--                    aux <= aux;
                 end if;
            end if;
        end if;
    end if;
Result <= aux;

end process;



end Behavioral;
