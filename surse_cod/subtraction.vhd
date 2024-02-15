----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2023 02:35:55
-- Design Name: 
-- Module Name: subtraction - Behavioral
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

entity subtraction is
 Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ri : in STD_LOGIC;
  signal D : out STD_LOGIC_VECTOR (15 downto 0);
  signal Rout: out STD_LOGIC
   );
end subtraction;

architecture Behavioral of subtraction is

component addition is
  Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ti : in STD_LOGIC;
  signal S : out STD_LOGIC_VECTOR (15 downto 0);
  signal Tout: out STD_LOGIC
   );
end component;
signal oneComplement, twoComplement : STD_LOGIC_VECTOR(15 downto 0);
signal aux : STD_LOGIC_VECTOR(15 downto 0):= x"0001";
signal dc : STD_LOGIC;
begin


ADD: addition port map (X, twoComplement, '0', D, dc );
ADDone: addition port map(oneComplement, aux, '0', twoComplement, dc);

--twoComplement(15)<=Y(15);

process(X,Y) 
begin
    for i in 15 downto 0 loop
        oneComplement(i) <= not Y(i);
    end loop;
end process;
    
    
    
end Behavioral;
