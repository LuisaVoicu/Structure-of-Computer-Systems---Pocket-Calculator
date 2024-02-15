----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2023 02:12:14
-- Design Name: 
-- Module Name: divider - Behavioral
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


entity divider is
  Port (
  Clk: in std_logic;
  Rst : in STD_LOGIC;
  Start : in STD_LOGIC;
  X : in STD_LOGIC_VECTOR(15 downto 0);
  Y : in STD_LOGIC_VECTOR(15 downto 0);
  A : out STD_LOGIC_VECTOR(15 downto 0);
  Q : out STD_LOGIC_VECTOR(15 downto 0);
  Term : out STD_LOGIC
  );
end divider;



architecture Behavioral of divider is

--    signal clk, start, rst: in STD_LOGIC;
--    signal An :  in STD_LOGIC;
--    signal LoadA, LoadB, LoadQ, shlAQ, subB, Term, RstQ0: out STD_LOGIC

 signal loadB, loadA, loadQ :  STD_LOGIC;
 signal SubB :  STD_LOGIC;
 signal RstA : STD_LOGIC;
 signal ShlAQ : STD_LOGIC;
 signal RstQ0 : STD_LOGIC;
 signal Tout : STD_LOGIC;
 signal An : STD_LOGIC;
 
 signal auxB, outA, outB, outQ, outSum : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin


uctrl_div: entity work.UC_DIV PORT MAP (
           Clk => Clk,
           Rst => Rst,
           Start => Start,
           LoadB => LoadB,
           SubB => SubB,
           RstA => RstA,
           LoadA => LoadA,
           ShlAQ => ShlAQ,
           LoadQ => LoadQ,
           RstQ0 => RstQ0,
           Term => Term,
           An => An
           );

regA_div: entity WORK.ShiftLeftLoadReg port map (
            clk => clk,
            rst => rstA,
            shlEn => shlAQ,
            shiftL => outQ(15),
            load => LoadA,
            data => outSum,
            result => outA
);



regQ_div: entity WORK.ShiftLeftLoadReg port map (
            clk => clk,
            rst => rst,
            shlEn => shlAQ,
            shiftL => '0',
            load => LoadQ,
            data => X,
            result => outQ
);



regB_div: entity WORK.ShiftLeftLoadReg port map (
            clk => clk,
            rst => rst,
            shlEn => '0',
            shiftL => '0',
            load => LoadB,
            data => Y,
            result => outB
);



xorGate: 
    for i in 0 to 15 generate
        auxB(i) <= subB xor outB(i);
    end generate;
    
add_sub_div: entity WORK.ADD  port map(
        X => outA,
        Y => auxB,
        Ti => subB,
        S => outSum,
        Tout => Tout
    );
  
saveAn_div: entity WORK.SaveAn port map(
                clk => clk,
                rst => rstQ0,
                load => subB,
                data => outA(15),
                result => An
    );

  

--saveQlst: entity WORK.SaveQLast port map(
--            clk => clk,
--            rst => RstQm1,
--            load => ShrAQ,
--            data => outQ(0),
--            result => lastQ
--);

A <= outA;
Q <= outQ;

end Behavioral;
