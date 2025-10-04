library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture behavior of full_adder_tb is
  -- components
  component full_adder is port (i1, i2, i3 : in std_logic; s, c : out std_logic);
  end component;
  
  -- signals
  signal A, B, Ci  : std_logic := '0';  --Inputs
  signal S, Co : std_logic;          --Outputs
-- architecture  
begin
  uut: full_adder port map (A,B,Ci,S,Co);  -- Instantiate the Unit Under Test (UUT) 
  process    	               -- Stimulus process
  begin
    wait for 10 ns;   
    A <= '0'; B <= '0'; ci <= '0';
    wait for 10 ns; 
    A <= '0'; B <= '1'; ci <= '0';
    wait for 10 ns; 
    A <= '1'; B <= '0'; ci <= '0';
    wait for 10 ns; 
    A <= '1'; B <= '1'; ci <= '0';
    wait for 10 ns;   
    A <= '0'; B <= '0'; ci <= '1';
    wait for 10 ns; 
    A <= '0'; B <= '1'; ci <= '1';
    wait for 10 ns; 
    A <= '1'; B <= '0'; ci <= '1';
    wait for 10 ns; 
    A <= '1'; B <= '1'; ci <= '1';
    wait;
  end process;
end;