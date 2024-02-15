----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2023 15:51:30
-- Design Name: 
-- Module Name: SAT4b - Behavioral
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

--enunt:
--SAT
--intrari: 2 numere pe 4 biti, TIN
--iesiri: 1 numar pe 4 biti, Tout
--+ banc de test

entity SAT4b is
  Port (
  signal x,y: in std_logic_vector(3 downto 0);
  signal tin: in std_logic;
  signal s : out std_logic_vector(3 downto 0);
  signal tout: out std_logic
  );
end SAT4b;



architecture Behavioral of SAT4b is

component Adder1b is
Port(
    signal x : in std_logic;
    signal y: in std_logic;
    signal tin: in std_logic;
    signal s:out std_logic;
    signal p: out std_logic;
    signal g: out std_logic
);
end component Adder1b;

signal t1,t2,t3: std_logic;
signal p,g : std_logic_vector(3 downto 0);
begin

sum1b1: Adder1b port map(x(0),y(0),tin,s(0),p(0),g(0));
sum1b2: Adder1b port map(x(1),y(1),t1,s(1),p(1),g(1));
sum1b3: Adder1b port map(x(2),y(2),t2,s(2),p(2),g(2));
sum1b4: Adder1b port map(x(3),y(3),t3,s(3),p(3),g(3));


t1 <= g(0) or (p(0) and tin);
t2 <= g(1) or (p(1)and g(0)) or (p(1) and p(0) and tin);
t3 <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and tin);
tout <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and tin);


end Behavioral;
