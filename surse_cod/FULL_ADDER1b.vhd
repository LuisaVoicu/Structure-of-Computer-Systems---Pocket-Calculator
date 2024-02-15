----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2023 19:08:35
-- Design Name: 
-- Module Name: FULL_ADDER1b - Behavioral
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

entity FULL_ADDER1b is
  Port (
   signal x, y, Tin: in STD_LOGIC;
   signal S, Tout: out STD_LOGIC
   );
end FULL_ADDER1b;

architecture Behavioral of FULL_ADDER1b is

begin

S<=x xor (y xor Tin);
Tout<=(x and y)  or ((x or y) and Tin);

end Behavioral;
