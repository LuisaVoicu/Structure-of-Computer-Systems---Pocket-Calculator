----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 23:38:22
-- Design Name: 
-- Module Name: elementar_adder - Behavioral
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

entity elementar_adder is
  Port ( 
    signal X: in STD_LOGIC;
    signal Y : in STD_LOGIC;
    signal Ti : in STD_LOGIC;
    signal S : out STD_LOGIC;
    signal Tout : out STD_LOGIC
  );
end elementar_adder;

architecture Behavioral of elementar_adder is

begin

    S <= (X xor Y) xor Ti;
    Tout <= (X and Y) or (Ti and X) or (Ti and Y);
    
end Behavioral;
