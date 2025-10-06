library ieee;
use ieee.std_logic_1164.all;

entity bidirectional_gate is
  port (
	write_data: in std_logic_vector (3 downto 0);  -- Write data input
	read_data: out std_logic_vector (3 downto 0); -- Read data output	
	output_enable: in std_logic;
	data: inout std_logic_vector (3 downto 0) -- Data to be written or read
  ); 
end bidirectional_gate;


-- dataflow style right? why the architecture says struct?
architecture struct of bidirectional_gate is  
begin
  -- Port in output mode (whatever is in write_data, will be copied to data)
  data <= write_data when output_enable = '0' else (others => 'Z');
  -- Port in input mode (wahtever is in data, will be copied to read_data)
  read_data <= data when output_enable = '1' else (others => 'Z');
end struct;