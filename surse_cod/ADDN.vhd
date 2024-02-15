----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2018 08:59:47 PM
-- Design Name: 
-- Module Name: ADDN - Behavioral
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

entity ADDN is
  generic(n: natural);
  Port (X   : in STD_LOGIC_VECTOR (n-1 downto 0);
        Y   : in STD_LOGIC_VECTOR (n-1 downto 0);
        Tin : in STD_LOGIC;
        S   : out STD_LOGIC_VECTOR (n-1 downto 0);
        Tout: out STD_LOGIC;
        OVF : out STD_LOGIC);
end ADDN;

architecture Behavioral of ADDN is
signal T : STD_LOGIC_VECTOR (n downto 0);
begin
T(0) <= Tin;
 summ:      for i in 0 to n-1 generate
            S(i) <= X(i) xor Y(i) xor T(i);
            T(i+1) <= (X(i) and Y(i)) or ((X(i) or Y(i)) and T(i));
        end generate;
 
 Tout <= T(n);
 OVF <= T(n) xor T(n-1);
 


end Behavioral;
