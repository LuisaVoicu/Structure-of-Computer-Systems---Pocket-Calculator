----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2023 13:55:23
-- Design Name: 
-- Module Name: ShiftLeftLoadReg - Behavioral
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

entity ShiftLeftLoadReg is
  Port (
  clk, rst, shlEn, shiftL, load : in STD_LOGIC;
  Data : in STD_LOGIC_VECTOR(15 downto 0);
  Result : out STD_LOGIC_VECTOR(15 downto 0)
   );
end ShiftLeftLoadReg;

architecture Behavioral of ShiftLeftLoadReg is

signal shift_data :  STD_LOGIC_VECTOR(15 downto 0);
signal aux :  STD_LOGIC_VECTOR(15 downto 0);
begin


result <= shift_data;

process(clk)
begin
    
    if clk'event and clk = '1' then
        if rst = '1' then
            shift_data <= (others => '0');
        else 
            if load = '1' then
                shift_data <= Data;
             else 
                 if shlEn = '1' then
                    shift_data <= aux(14 downto 0) & shiftL;
                 else
                    shift_data <= aux;
                 end if;
            end if;
        end if;
    end if;

end process;


end Behavioral;
