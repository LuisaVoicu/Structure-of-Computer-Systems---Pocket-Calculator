----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2023 18:58:14
-- Design Name: 
-- Module Name: SST3b - Behavioral
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

entity SST4b is
  Port (
    signal x,y,z :  in STD_LOGIC_VECTOR (3 downto 0);
    signal S : out STD_LOGIC_VECTOR (4 downto 0);
    signal Tin : in STD_LOGIC;
    signal Tout : out STD_LOGIC
   );
end SST4b;

architecture Behavioral of SST4b is


--type produs_type is array(0 to 2) of std_logic_vector(2 downto 0);
--signal produs:produs_type:=(others=>(others=>'0'));


signal s_aux, t_aux : STD_LOGIC_VECTOR(4 downto 0);


begin


S(0) <= s_aux(0);


fullAdder0: entity WORK.FULL_ADDER1b port map
(
    x => x(0),
    y => y(0),
    Tin => z(0),
    Tout => t_aux(0),
    S => s_aux(0)
);

fullAdder1: entity WORK.FULL_ADDER1b port map
(
    x => x(1),
    y => y(1),
    Tin => z(1),
    Tout => t_aux(1),
    S => s_aux(1)
);

fullAdder2: entity WORK.FULL_ADDER1b port map
(
    x => x(2),
    y => y(2),
    Tin => z(2),
    Tout => t_aux(2),
    S => s_aux(2)
);

fullAdder3: entity WORK.FULL_ADDER1b port map
(
    x => x(3),
    y => y(3),
    Tin => z(3),
    Tout => t_aux(3),
    S => s_aux(3)
);


fullAdder4: entity WORK.FULL_ADDER1b port map
(
    x => '0',
    y => '0',
    Tin => '0',
    Tout => t_aux(4),
    S => s_aux(4)
);

sat: entity WORK.SAT4b port map
(
    x => t_aux(3 downto 0),
    y => s_aux(4 downto 1),
    Tin => '0',
    Tout => Tout,
    S => S(4 downto 1)
);

end Behavioral;
