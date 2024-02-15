----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 04:33:07
-- Design Name: 
-- Module Name: Sum1b - Behavioral
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

entity Adder1b is
Port(
    signal x : in std_logic;
    signal y: in std_logic;
    signal tin: in std_logic;
    signal s:out std_logic;
    signal p: out std_logic;
    signal g: out std_logic
);
end Adder1b;

architecture Behavioral of Adder1b is

begin

s <= x xor y xor tin;
p <= x or y;
g <= x and y;

end Behavioral;
