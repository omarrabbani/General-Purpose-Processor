library ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_UNSIGNED.ALL;
USE ieee.NUMERIC_STD.ALL;

ENTITY ALUP2 IS
PORT(Clk:IN STD_LOGIC;
A,B : IN UNSIGNED(7 DOWNTO 0);
student_id : IN UNSIGNED(3 DOWNTO 0);
OP : IN UNSIGNED(15 DOWNTO 0);
Neg : OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);
R2: OUT UNSIGNED(3 DOWNTO 0));
END ALUP2;

ARCHITECTURE calculation of ALUP2 IS
SIGNAL Reg1,Reg2,Result : UNSIGNED(7 DOWNTO 0) :=(OTHERS=> '0');
signal Reg4 : unsigned(0 to 7);
BEGIN	
Reg1 <= A;
Reg2 <= B;
PROCESS(Clk,OP)
BEGIN	
IF(rising_edge(Clk)) THEN 
CASE OP IS

WHEN "0000000000000001" => --1

    Neg <= '0';
    Result <= Reg2 - 9; -- decrement by 9
	 
WHEN "0000000000000010" => --2
 Neg<='0';
    Result <= Reg2(3 downto 0) & Reg2(7 downto 4); -- Swap the bits

WHEN "0000000000000100" => --3
 Neg<='0';
    -- Shift left by 2 bits
    Result <= shift_left(UNSIGNED(Reg2), 2);
    -- Set the two least significant bits to '0' after shifting
    Result(1) <= '0'; 
    Result(0) <= '0';

WHEN "0000000000001000" => --4 
  Result <= (NOT (Reg1 AND Reg2)); --NAND A and B
  Neg<='0';

WHEN "0000000000010000" => --5 
 Neg<='0';
 IF (Reg2>Reg1) THEN --which is greater
Result <= Reg2;
ELSE
Result <= Reg1;
END IF;
Neg<='0';

WHEN "0000000000100000" => --6
Neg<='0';
    Result <= Reg2(7) & not Reg2(6) & Reg2(5) & not Reg2(4) & Reg2(3) & not Reg2(2) & Reg2(1) & not Reg2(0);--inverting even bits

WHEN "0000000001000000" => --7
 Result <= "11101110"; -- Binary representation of 'E'
 Neg<='0';

WHEN "0000000010000000" => --8
Result <= Reg1(7 downto 4) & Reg2(3 downto 0); -- Concatenate upper bits of Reg1 with lower bits of Reg2
Neg<='0';

WHEN "0000000100000000" => --9
Result <= Reg1;
Neg<='0';

WHEN OTHERS => 
Result<= "--------";

END CASE;
END IF;
END PROCESS;

R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);
END calculation;