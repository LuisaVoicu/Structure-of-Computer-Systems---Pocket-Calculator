----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2024 04:02:47
-- Design Name: 
-- Module Name: div_tb - Behavioral
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

entity divi_tb is
--  Port ( );
end divi_tb;

architecture Behavioral of divi_tb is
signal Clk   : STD_LOGIC:='0';
signal Rst   : STD_LOGIC:='0';
signal Start :  STD_LOGIC:='1';
signal X : STD_LOGIC_VECTOR (15 downto 0):="0000000000001010";
signal Y : STD_LOGIC_VECTOR (15 downto 0):="0000000000000010";
signal A : STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
signal Q :STD_LOGIC_VECTOR (15 downto 0):="0000000000000000";
signal Term  : STD_LOGIC; 
--clk



--  Port (
--  Clk: in std_logic;
--  Rst : in STD_LOGIC;
--  Start : in STD_LOGIC;
--  X : in STD_LOGIC_VECTOR(15 downto 0);
--  Y : in STD_LOGIC_VECTOR(15 downto 0);
--  A : out STD_LOGIC_VECTOR(15 downto 0);
--  Q : out STD_LOGIC_VECTOR(15 downto 0);
--  Term : out STD_LOGIC
--  );

constant CLK_PERIOD : TIME := 10 ns;
begin
DUT: entity WORK.divider port map(  Clk => Clk,
                                             Rst => Rst,
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