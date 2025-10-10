library ieee;
use ieee.std_logic_1164.all;


entity bidirectional_gate_tb is
end bidirectional_gate_tb;

architecture behaviour of bidirectional_gate_tb is
	-- components
	component bidirectional_gate is
		port (
			write_data: in std_logic_vector (3 downto 0);  -- Write data input
			read_data: out std_logic_vector (3 downto 0); -- Read data output	
			output_enable: in std_logic;
			data: inout std_logic_vector (3 downto 0) -- Data to be written or read
		); 
	end component;
	
	signal output_enable : std_logic;
	signal write_data, read_data, data : std_logic_vector (3 downto 0);         	 	--Outputs

begin
	uut: bidirectional_gate port map (write_data, read_data, output_enable, data );  -- Instantiate the Unit Under Test (UUT) 
--testbench
	process
	begin		
		-- If data is to be an output, use 'Z'      
		-- hold reset state for 100 ns.
		data <= "ZZZZ"; wait for 100 ns; 
		-- insert stimulus here 
		output_enable <= '0'; write_data <= x"A"; data <= "ZZZZ"; wait for 20 ns; 
		output_enable <= '1'; data <= x"E"; wait for 20 ns;
		output_enable <= '0'; write_data <= x"9"; data <= "ZZZZ"; wait for 20 ns; 
		output_enable <= '1'; data <= x"3"; wait for 20 ns;
		data <= x"C";
		wait;
	end process;
end;