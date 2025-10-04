library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture behavior_tb of half_adder_tb is
  component half_adder is 
    port (
      i1, i2  : in std_logic; s, c : out std_logic
    );
  end component;
  signal A, B  : std_logic := '0';  --Inputs
  signal S, C : std_logic;          --Outputs
  
  begin
    uut: half_adder port map (A, B, S, C);  -- Instantiate the Unit Under Test (UUT) 
    process    	               -- Stimulus process
      begin
        wait for 10 ns;   
        A <= '0'; B <= '0';
        wait for 10 ns; 
        A <= '0'; B <= '1';
        wait for 10 ns; 
        A <= '1'; B <= '0';
        wait for 10 ns; 
        A <= '1'; B <= '1';
        wait;
      end process;
  end;