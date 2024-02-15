----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 08:36:46 PM
-- Design Name: 
-- Module Name: SRRN - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRRN is
  generic(n: natural);
  Port (Clk : in STD_LOGIC;
        D   : in STD_LOGIC_VECTOR (n-1 downto 0);
        SRI : in STD_LOGIC;
        Rst : in STD_LOGIC;
        Load: in STD_LOGIC;
        CE  : in STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR (n-1 downto 0));
end SRRN;

architecture Behavioral of SRRN is
signal iesireAuxiliara : STD_LOGIC_VECTOR (n-1 downto 0):= (others=>'0');
begin
process(Clk, Rst, CE)
begin
    if RISING_EDGE(Clk) then
        if (Rst = '1') then
            iesireAuxiliara <= (others => '0');
        else if (Load = '1') then
            iesireAuxiliara <= D;
            else if (CE = '1') then
                 iesireAuxiliara <= SRI & iesireAuxiliara(n-1 downto 1);
               
            else
                iesireAuxiliara <= iesireAuxiliara;
                 end if;
             end if;
         end if;
     end if;
 end process;
 Q <= iesireAuxiliara;   
                    


end Behavioral;
