----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2023 23:35:24
-- Design Name: 
-- Module Name: operations - Behavioral
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

entity operations is
  Port (
    signal Ti, clk, rst, rstState : in STD_LOGIC;
    signal selOp : in STD_LOGIC_VECTOR(3 downto 0);
    signal X :  in STD_LOGIC_VECTOR (15 downto 0);
    signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
    signal Result : out STD_LOGIC_VECTOR (31 downto 0)
         );
end operations;


architecture Behavioral of operations is



component subtraction is
 Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ri : in STD_LOGIC;
  signal D : out STD_LOGIC_VECTOR (15 downto 0);
  signal Rout: out STD_LOGIC
   );
end component;

component addition is
  Port (
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Ti : in STD_LOGIC;
  signal S : out STD_LOGIC_VECTOR (15 downto 0);
  signal Tout: out STD_LOGIC
   );
end component;


component divider is
  Port ( 
  signal clk: in STD_LOGIC;
  signal rst: in STD_LOGIC;
  signal X :  in STD_LOGIC_VECTOR (15 downto 0);
  signal Y :  in STD_LOGIC_VECTOR (15 downto 0);
  signal P : out STD_LOGIC_VECTOR (31 downto 0)
  );
end component;

signal sumResult, subResult, A_mul, Q_mul, A_div, Q_div : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal StartMul : STD_LOGIC := '0';
signal StartDiv : STD_LOGIC := '0';
signal DC : STD_LOGIC;
signal sumWallance : std_logic_vector(3 downto 0) := (others => '0');
signal testBooth : std_logic_vector(7 downto 0) := (others => '0');

signal Done : STD_LOGIC;

begin

process(clk, selOp) 
begin
    case selOp is
    
        when "0001" =>
            startDiv<='0';
            startMul<='0';
            Result <= x"0000" & sumResult;
            Done <= '1';
        
        when "0010" =>
            startDiv<='0';
            startMul<='0';
            Result <= x"0000" & subResult;
            Done <= '1';

        when "0100" =>
            StartMul <= '1';
            startDiv <= '0';
            Result <= A_mul & Q_mul;
            Done <= '1';

--            Result <= x"0000" & A;
            --Result <= x*y;       
--            Result <= x"0000000" & sumWallance;     
        when "1000" =>
            startDiv <= '1';
            startMul <= '0';
            Result <= x"0000" & Q_div;
--            Result <= x"000000" & testBooth;
            Done <= '1';

            

        when others =>
            startDiv<='0';
            startMul<='0';
            Result <= (others=>'1');
            Done<='0';
            
    end case;
end process;




----test booth

--Booth2 :  entity WORK.boothMain port map(
--clk => clk,
--rst => rst,
--start =>startDiv,
--x=>x(7 downto 0),
--y=>y(7 downto 0),
--res=>testBooth,
--term=>DC

--);


--process(term)



--entity boothMain is
--  Port (Clk   : in STD_LOGIC;
--        Rst   : in STD_LOGIC;
--        Start : in STD_LOGIC;
--        X     : in STD_LOGIC_VECTOR(7 downto 0);
--        Y     : in STD_LOGIC_VECTOR(7 downto 0);
--        An    : out STD_LOGIC_VECTOR(7 downto 0);
--        Seg   : out STD_LOGIC_VECTOR(7 downto 0);
--        Term  : out STD_LOGIC );
--end boothMain;


MUL: entity WORK.booth_multiplier port map (
clk => clk,
rst => rst,
rstState => rstState,
Start => StartMul,
X => X,
Y => Y,
A => A_mul,
Q => Q_mul
);

DIV: entity WORK.divider port map (
clk => clk,
rst => rst,
Start => StartDiv,
X => X,
Y => Y,
A => A_div,
Q => Q_div
);

ADD: entity WORK.addition port map(
X => X,
Y => Y,
Ti => '0',
S => sumResult,
Tout => DC
);

SUB: entity WORK.subtraction port map(
X => X,
Y => Y,
Ri => '0',
D => subResult,
Rout => DC
);

--WALL: entity WORK.Wallance port map(
--X => X(3 downto 0),
--Y => Y(3 downto 0),
--p => sumWallance
--);



--entity Wallance is
--  Port (
--  signal x, y: in STD_LOGIC_VECTOR(3 downto 0);
--  signal p: out STD_LOGIC_VECTOR (3 downto 0)
--   );
--end Wallance;

end Behavioral;
