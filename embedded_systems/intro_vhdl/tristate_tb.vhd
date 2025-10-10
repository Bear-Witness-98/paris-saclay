library ieee;
use ieee.std_logic_1164.all;

entity tristate_tb is
end tristate_tb;

architecture behaviour of tristate_tb is
	-- components
	component tristate is
		port(
			input, OE: in std_logic; 
			output : out std_logic
		);
	end component;
	
	-- signals
	signal input, OE : std_logic;  --Inputs
	signal output : std_logic;         	 	--Outputs

begin	
--testbench
	uut: tristate port map (input,OE,output);  -- Instantiate the Unit Under Test (UUT) 
	process
		begin		
			-- hold reset state for 100 ns.
			wait for 100 ns;	
			-- insert stimulus here 
			input <= '0'; OE <= '0'; wait for 20 ns;
			input <= '0'; OE <= '1'; wait for 20 ns;
			input <= '1'; OE <= '1'; wait for 20 ns;
			input <= '1'; OE <= '0';		
			wait;
		end process;
end;