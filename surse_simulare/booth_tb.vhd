----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2023 12:35:58 AM
-- Design Name: 
-- Module Name: booth_module_TB - Behavioral
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

entity booth_module_TB is
--  Port ( );
end booth_module_TB;

architecture Behavioral of booth_module_TB is
--declarare semnale pt booth_module
signal Clk   : STD_LOGIC:='0';
signal Rst   : STD_LOGIC:='0';
signal Start :  STD_LOGIC:='1';
signal X : STD_LOGIC_VECTOR (15 downto 0):="0000000001100011";
signal Y : STD_LOGIC_VECTOR (15 downto 0):="0000000100001011";
signal A : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
signal Q :STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
signal Term  : STD_LOGIC; 
--clk
constant CLK_PERIOD : TIME := 10 ns;
begin
DUT: entity WORK.booth_multiplier port map(  Clk => Clk,
                                             Rst => Rst,
                                             rstState => rst,
                                             Start => Start,
                                             X => X,
                                             Y => Y,
                                             A => A,
                                             Q => Q,
                                             Term => Term);
 gen_clk: process
 begin
     Clk <= '0';
     wait for (CLK_PERIOD/2);
     Clk <= '1';
     wait for (CLK_PERIOD/2);
 end process gen_clk;
 

end Behavioral;
