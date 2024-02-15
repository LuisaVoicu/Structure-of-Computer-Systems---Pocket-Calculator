----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2023 02:07:40
-- Design Name: 
-- Module Name: SPT4b - Behavioral
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

entity SPT4b is
  Port ( 
  signal x: in STD_LOGIC_VECTOR (3 downto 0);
  signal y :  in STD_LOGIC_VECTOR (3 downto 0);
  signal S : out STD_LOGIC_VECTOR (3 downto 0);
  signal Tin : in STD_LOGIC;
  signal Tout : out STD_LOGIC
  
  );
end SPT4b;

architecture Behavioral of SPT4b is

signal t_aux : std_logic_vector(3 downto 0);

begin


SE1: entity work.full_adder1b port map(
x => x(0),
y => y(0),
tin => tin,
tout => t_aux(0),
s => s(0)
);

SE2: entity work.full_adder1b port map(
x => x(1),
y => y(1),
tin => t_aux(0),
tout => t_aux(1),
s => s(1)
);

SE3: entity work.full_adder1b port map(
x => x(2),
y => y(2),
tin => t_aux(1),
tout => t_aux(2),
s => s(2)
);

SE4: entity work.full_adder1b port map(
x => x(3),
y => y(3),
tin => t_aux(2),
tout => tout,
s => s(3)
);

end Behavioral;
