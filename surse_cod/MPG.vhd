----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 03:53:49 PM
-- Design Name: 
-- Module Name: MPG - Behavioral
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
-- --

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

entity MPG is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           verify : out STD_LOGIC;
           en : out STD_LOGIC
           );
end MPG;

architecture Behavioral of MPG is 
signal count_int : std_logic_vector(15 downto 0) :=x"0000";
signal Q1 : std_logic;
signal Q2 : std_logic;
signal Q3 : std_logic; 
begin



en <= Q2 AND (not Q3);
process (clk) 
begin
 if clk'event and clk='1' then
 count_int <= count_int + 1;
 end if;
end process;

process (clk)
begin
 if clk'event and clk='1' then 
     if count_int = "1111111111111111" then 
            Q1 <= btn;
            verify <='1';
    
     else
        verify <= '0';
     end if;
 end if;
end process;

process (clk)
begin
 if clk'event and clk='1' then 
 Q2 <= Q1;
 Q3 <= Q2;
 end if;
end process;
end Behavioral;

