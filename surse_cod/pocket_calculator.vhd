----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 22:41:41
-- Design Name: 
-- Module Name: pocket_calculator - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pocket_calculator is
  Port (
  signal clk : in STD_LOGIC;
  signal sw : inout STD_LOGIC_VECTOR (15 downto 0);
  signal led : out STD_LOGIC_VECTOR (15 downto 0);
  signal an : out STD_LOGIC_VECTOR (3 downto 0);
  signal cat : out STD_LOGIC_VECTOR (6 downto 0);
  signal btn : in STD_LOGIC_VECTOR (4 downto 0)
   );
end pocket_calculator;

architecture Behavioral of pocket_calculator is

  signal minus :  STD_LOGIC;

  signal OP :  STD_LOGIC_VECTOR(1 downto 0);
  signal X :  STD_LOGIC_VECTOR(15 downto 0) := (others =>'0');
  signal Y :  STD_LOGIC_VECTOR(15 downto 0) := (others =>'0');
  signal rst :  STD_LOGIC;
  signal selRes:  STD_LOGIC;


component SSD is
    Port ( num : in STD_LOGIC_VECTOR (15 downto 0);
       clk : in STD_LOGIC;
       an : out STD_LOGIC_VECTOR (3 downto 0);
       cat : out STD_LOGIC_VECTOR (6 downto 0));
end component SSD;



signal enMPG0, enMPG1, enMPG2, enMPG3, enMPG4: STD_LOGIC;
signal enOP: STD_LOGIC_VECTOR(3 downto 0);

signal operationResult : STD_LOGIC_VECTOR(31 downto 0);
signal semiResult : STD_LOGIC_VECTOR(15 downto 0);
signal auxLed, auxLed2,auxB : STD_LOGIC_VECTOR(15 downto 0):=(others => '0');
signal ti : STD_LOGIC;
signal verify_led : STD_LOGIC;
signal term : STD_LOGIC;

begin

--SELECT OPERATION
process(OP)
begin
    auxled2 <= (others => '0');
    case OP is
        when "00" => 
                    enOP <= "0001"; --add
                    auxLed2(0) <='0';
                    auxLed2(1) <='0';

        when "01" => 
                    enOP <= "0010"; --
                    auxLed2(0) <='0';
                    auxLed2(1) <='0';
        when "10" => 
                    enOP <= "0100"; --mul
                    auxLed2(0) <='1';
                    auxLed2(1) <='0';
        when "11" => 
                    enOP <= "1000"; --div
                    auxLed2(0) <='0';
                    auxLed2(1) <='1';
    end case;
end process;


--SELECT PORT RESULT
--process(selRes,operationResult)
--begin
--    case selRes is
--        when '0' =>
--            -- ultimii 15 biti
--            semiResult <= operationResult(15 downto 0);
--            minus <= '0';
--        when '1' =>
--            semiResult <= "0" & operationResult(30 downto 0);
--            minus <= operationResult(31);
--     end case;
--end process;



oper: entity WORK.operations port map
(

    clk => clk,
    rst => rst,
    rstState => enMPG4,
    ti => ti,
    selOp => enOP,
    X => X,
    Y => Y, 
    Result =>operationResult 
);

-- semiResult <= operationResult(15 downto 0);

Debouncer0: entity WORK.MPG port map
(
clk => clk,
en => enMPG0,
btn => btn(0),
verify => verify_led
);

Debouncer1: entity WORK.MPG port map
(
clk => clk,
en => enMPG1,
btn => btn(1),
verify => verify_led
);

Debouncer2: entity WORK.MPG port map
(
clk => clk,
en => enMPG2,
btn => btn(2),
verify => verify_led
);

Debouncer3: entity WORK.MPG port map
(
clk => clk,
en => enMPG3,
btn => btn(3),
verify => verify_led
);

Debouncer4: entity WORK.MPG port map
(
clk => clk,
en => enMPG4,
btn => btn(4),
verify => verify_led
);



-- DATA To SSD
SSDx: SSD port map(semiResult, clk, an, cat);


--salvare operatie

process(clk)
begin
    
    if clk'event and clk='1' then
            if enMPG0 = '1' then
                OP <= SW(1 downto 0);
                auxled(15) <= '1';
                semiResult <= "00000000000000" & OP;

           elsif enMPG1 = '1' then
               
               auxled(15) <='0';

                X <= SW;
                auxled(14) <= '1';
                semiResult <= X;
             
            elsif enMPG2 = '1' then
            
                auxled(14) <='0';
                auxled(15) <='0';
                
                Y <= SW;
                auxled(13) <= '1';
                semiResult <= Y;
                
            elsif enMPG3 = '1' then
            
            auxled(14) <='0';
            auxled(15) <='0';
            auxled(13) <='0';
--                if sw(15) = '1' then
--                    semiResult <= operationResult(31 downto 16);
--                else 

                semiResult <= operationResult(15 downto 0);
                auxled(1) <= '1';

--                end if;
             elsif enMPG3 = '0' then
             
             
             auxled(14) <='0';
             auxled(15) <='0';
             auxled(13) <='0';
             auxled(1) <='0';
             
             end if;
             
            if sw(14) = '1' then
                semiResult <= X;
                end if;
            if sw(13) = '1' then
                semiResult <= Y;
                end if;
       
   end if;
 end process;
 
 
 

 
led <= auxled or auxled2;
  
 

end Behavioral;
