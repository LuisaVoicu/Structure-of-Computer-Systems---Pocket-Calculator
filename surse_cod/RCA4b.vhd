----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 23:48:33
-- Design Name: 
-- Module Name: RCA4b - Behavioral
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

entity RCA4b is
  Port (
   signal X :  in STD_LOGIC_VECTOR (3 downto 0);
   signal Y : in STD_LOGIC_VECTOR (3 downto 0);
   signal Ti : in STD_LOGIC;
   signal S : out STD_LOGIC_VECTOR(3 downto 0);
   signal Tout: out STD_LOGIC
   );
end RCA4b;

architecture Behavioral of RCA4b is
 component elementar_adder is
  Port ( 
    signal X: in STD_LOGIC;
    signal Y : in STD_LOGIC;
    signal Ti : in STD_LOGIC;
    signal S : out STD_LOGIC;
    signal Tout : out STD_LOGIC
  );
end component;

signal T1, T2, T3 : STD_LOGIC;

begin

EA1: elementar_adder port map(X(0), Y(0), Ti, S(0), T1);
EA2: elementar_adder port map(X(1), Y(1), T1, S(1), T2);
EA3: elementar_adder port map(X(2), Y(2), T2, S(2), T3);
EA4: elementar_adder port map(X(3), Y(3), T3, S(3), Tout);

end Behavioral;
