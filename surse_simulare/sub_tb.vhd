----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2024 03:55:48
-- Design Name: 
-- Module Name: sub_tb - Behavioral
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

entity sub_tb is
--  Port ( );
end sub_tb;

architecture Behavioral of sub_tb is
signal Clk   : STD_LOGIC:='0';
signal Rst   : STD_LOGIC:='0';
signal Start :  STD_LOGIC:='1';
signal X : STD_LOGIC_VECTOR (15 downto 0):="0000000001100011";
signal Y : STD_LOGIC_VECTOR (15 downto 0):="0000000000001011";
signal d :STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
signal ri  : STD_LOGIC := '0' ; 
signal rout  : STD_LOGIC := '0' ; 
--clk
constant CLK_PERIOD : TIME := 10 ns;
begin
DUT: entity WORK.subtraction port map(  
                                            
                                             X => X,
                                             Y => Y,
                                             ri => ri,
                                             d => d,
                                             rout => rout);
 gen_clk: process
 begin
     Clk <= '0';
     wait for (CLK_PERIOD/2);
     Clk <= '1';
     wait for (CLK_PERIOD/2);
 end process gen_clk;
 

end Behavioral;