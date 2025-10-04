library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port (
		i1, i2, i3  : in std_logic; --i1, i2: the two operands, i3: the carry input
		s, c : out std_logic
	);      --s: sum, c: the carry output
end full_adder;

architecture dataflow of full_adder is
	begin
		s <= (i1 xor i2) xor i3;
		c <= (i1 and i2) or ((i1 xor i2) and i3); 
	end dataflow;
	
architecture structural of full_adder is
	-- instantiates the half_adder component (available in this same project and folder)
	-- for later instantiation and port mapping
  component half_adder is 
		port (
			i1, i2: in std_logic;
			s, c: out std_logic
		);
	end component;	
	signal s1, c1, c2: std_logic;
	
	begin
		-- instantiates components and adds port mapping
		half_adder_1: half_adder port map (i1, i2, s1, c1); 
		half_adder_2: half_adder port map (i3, s1, s, c2);
	
		process (c1 , c2)
			begin
			c <= c1 or c2;
	end process;
end structural;