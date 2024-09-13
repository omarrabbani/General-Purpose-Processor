LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS

PORT (bcd: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
neg: IN STD_LOGIC;
leds: OUT STD_LOGIC_VECTOR(1 TO 7);
ledss: OUT STD_LOGIC_VECTOR(1 TO 7) );

END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN

PROCESS(bcd)
BEGIN

CASE bcd IS -- abcdefg

WHEN "0000" => leds <=  not "1111110";
WHEN "0001" => leds <=  not "0110000";
WHEN "0010" => leds <=  not "1101101";
WHEN "0011" => leds <=  not "1111001";
WHEN "0100" => leds <=  not "0110011";
WHEN "0101" => leds <=  not "1011011";
WHEN "0110" => leds <=  not "1011111";
WHEN "0111" => leds <=  not "1110000";
WHEN "1000" => leds <=  not "1111111";
WHEN "1001" => leds <=  not "1111011";
-- 10 to 15 in HEX
WHEN "1010" => leds <=  not "1110111"; -- A
WHEN "1011" => leds <=  not "0011111"; -- B
WHEN "1100" => leds <=  not "1001110"; -- C
WHEN "1101" => leds <=  not "0111101"; -- D
WHEN "1110" => leds <=  not "1001111"; -- E
WHEN "1111" => leds <=  not "1000111"; -- F

END CASE;
END PROCESS;

PROCESS (neg)
BEGIN
IF (neg = '1') THEN
ledss <=  not "0000001";
ELSE
ledss <=  not "0000000";

END IF;
END PROCESS;
END Behavior;
	
