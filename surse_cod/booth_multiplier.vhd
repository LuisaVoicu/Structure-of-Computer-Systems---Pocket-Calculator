----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2023 21:06:28
-- Design Name: 
-- Module Name: booth_multiplier - Behavioral
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

entity booth_multiplier is
  Port (
           Clk: in std_logic;
           Rst, rstState : in STD_LOGIC;
           Start : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR(15 downto 0);
           Y : in STD_LOGIC_VECTOR(15 downto 0);
           A : out STD_LOGIC_VECTOR(15 downto 0);
           Q : out STD_LOGIC_VECTOR(15 downto 0);
           Term : out STD_LOGIC
   );
end booth_multiplier;

architecture Behavioral of booth_multiplier is

 signal Q0Qm1 : STD_LOGIC_VECTOR (1 downto 0);
 signal loadB, loadA, loadQ :  STD_LOGIC;
 signal SubB :  STD_LOGIC;
 signal RstA : STD_LOGIC;
 signal ShrAQ : STD_LOGIC;
 signal RstQm1 : STD_LOGIC;
 signal Tout : STD_LOGIC;
 signal lastQ : STD_LOGIC;


 signal auxB, outA, outB, outQ, outSum : STD_LOGIC_VECTOR(15 downto 0);
 
begin


uctrl: entity work.UC_MUL PORT MAP (
           Clk => Clk,
           Rst => Rst,
           rstState => rstState,
           Start => Start,
           Q0Qm1 => Q0Qm1,
           LoadB => LoadB,
           SubB => SubB,
           RstA => RstA,
           LoadA => LoadA,
           Shraq => ShrAQ,
           LoadQ => LoadQ,
           RstQm1 => RstQm1,
           Term => Term);


regB: entity WORK.ShiftLoadReg port map (
            clk => clk,
            rst => Rst,
            shrEn => '0',
            shiftR => '0',
            load => LoadB,
            data => X,
            result => outB
);


regA: entity WORK.ShiftLoadReg port map (
            clk => clk,
            rst => rstA,
            shrEn => shrAQ,
            shiftR => outA(15),
            load => LoadA,
            data => outSum,
            result => outA
);


regQ: entity WORK.ShiftLoadReg port map (
            clk => clk,
            rst => Rst,
            shrEn => shrAQ,
            shiftR => outA(0),
            load => LoadQ,
            data => Y,
            result => outQ
);


saveQlst: entity WORK.SaveQLast port map(
            clk => clk,
            rst => RstQm1,
            load => ShrAQ,
            data => outQ(0),
            result => lastQ
);



xorGate: 
    for i in 0 to 15 generate
        auxB(i) <= subB xor outB(i);
    end generate;

add_sub: entity WORK.ADD  port map(
    X => outA,
    Y => auxB,
    Ti => subB,
    S => outSum,
    Tout => Tout
);


 Q0Qm1(1) <= outQ(0);
 Q0Qm1(0) <= lastQ;
  
A <= outA;
Q <= outQ;

end Behavioral;
