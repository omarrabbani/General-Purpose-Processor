library ieee;
use ieee.std_logic_1164.all;

entity machine is
    port (
        clk         : in  std_logic;
        data_in     : in  std_logic;
        reset       : in  std_logic;
        student_id  : out std_logic_vector(3 downto 0);
        current_state : out std_logic_vector(3 DOWNTO 0)
    );
end entity;

architecture fsm of machine is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
    signal yfsm : state_type;
    signal output_student_id : std_logic_vector(3 downto 0);
    signal output_current_state : std_logic_vector(3 DOWNTO 0);
begin
    process (clk, reset)
    begin
        if reset = '0' then
            yfsm <= s0;  -- Initialize state on reset
        elsif (clk'EVENT AND clk = '1') then
            case yfsm is
                when s0=>
                    if data_in='1' then
                        yfsm <= s1;  
                    else
                        yfsm <= s0;  -- Stay in s0 on input '0'
                    end if;
                    
                when s1=>
                    if data_in='1' then
                        yfsm <= s2;  
                    else
                        yfsm <= s1;  -- Stay in s1 on input '0'
                    end if;
                    
                when s2=>
                    if data_in='1' then
                        yfsm <= s3;  
                    else
                        yfsm <= s2;  -- Stay in s2 on input '0'
                    end if;
                    
                when s3=>
                    if data_in='1' then
                        yfsm <= s4;  
                    else
                        yfsm <= s3;  -- Stay in s3 on input '0'
                    end if;
                    
                when s4=>
                    if data_in='1' then
                        yfsm <= s5;  
                    else
                        yfsm <= s4;  -- Stay in s4 on input '0'
                    end if;
                    
                when s5=>
                    if data_in='1' then
                        yfsm <= s6;  
                    else
                        yfsm <= s5;  -- Stay in s5 on input '0'
                    end if;
                    
                when s6=>
                    if data_in='1' then
                        yfsm <= s7;  
                    else
                        yfsm <= s6;  -- Stay in s6 on input '0'
                    end if;
                    
                when s7=>
                    if data_in='1' then
                        yfsm <= s8;  
                    else
                        yfsm <= s7;  -- Stay in s7 on input '0'
                    end if;
                    
                when s8=>
                    if data_in='1' then
                        yfsm <= s0;  
                    else
                        yfsm <= s8;  -- Stay in s8 on input '0'
                    end if;
            end case;
            
            -- Assign outputs based on the current state and input
            case yfsm is
                when s0=>
                    output_student_id <= "0101"; --5
                    output_current_state <= "0000";  -- current state s0
                    
                when s1=>
                    output_student_id <= "0000"; --0
                    output_current_state <= "0001"; -- current state s1
                    
                when s2=>
                    output_student_id <= "0001"; --1
                    output_current_state <= "0010"; -- current state s2
                    
                when s3=>
                    output_student_id <= "0001"; --1
                    output_current_state <= "0011"; -- current state s3
                    
                when s4=>
                    output_student_id <= "0111"; --7
                    output_current_state <= "0100"; -- current state s4
                    
                when s5=>
                    output_student_id <= "1001"; --9
                    output_current_state <= "0101"; -- current state s5
                    
                when s6=>
                    output_student_id <= "0000"; --0
                    output_current_state <= "0110"; -- current state s6
                    
                when s7=>
                    output_student_id <= "0111"; --7
                    output_current_state <= "0111"; -- current state s7
                    
                when s8=>
                    output_student_id <= "1000"; --8
                    output_current_state <= "1000"; -- current state s8
            end case;
        end if;
    end process;

    -- Assign Mealy outputs
    student_id <= output_student_id when clk = '1';  -- Output student_id on rising edge of clock
    current_state <= output_current_state when clk = '1';  -- Output current_state on rising edge of clock
end architecture;
