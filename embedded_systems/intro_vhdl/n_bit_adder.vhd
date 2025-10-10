library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity n_bit_adder is 
	generic (N: integer:=4);
	port (
		i1, i2 : in std_logic_vector(N-1 downto 0);  -- two vector operands 
		i3     : in std_logic;                     	-- carry input
		s  : out std_logic_vector(N-1 downto 0);     -- sum vector
		c  : out std_logic						 			-- carry output
	);                     
end n_bit_adder;

architecture structural of n_bit_adder is
  signal carry : std_logic_vector(0 to N);  -- intermediate signal to hold the carry propagation
begin
	c <= carry(N);
	carry(0) <= i3;
	
	gen: for i in 0 to N-1 generate
		full_adder_i : full_adder port map (i1(i), i2(i), carry(i), s(i), carry(i+1));
	end generate gen;
end structural;

architecture behavioural of n_bit_adder is

begin
  process (i1, i2, i3)
    variable sum   : std_logic_vector (N-1 downto 0);
    variable carry : std_logic;
  begin
    carry := i3;
    for i in 0 to N-1 loop
      sum(i) := (i1(i) xor i2(i)) xor carry;
      carry  := (i1(i) and i2(i)) or (carry and (i1(i) xor i2(i)));
    end loop ;
    s <= sum ;
    c <= carry;
  end process ;
end behavioural;


-- For the case of N=4 we could've used this:
--  full_adder_1 : full_adder port map (i1(0), i2(0), carry(0), s(0), carry(1));
--  full_adder_2 : full_adder port map (i1(1), i2(1), carry(1), s(1), carry(2));
--  full_adder_3 : full_adder port map (i1(2), i2(2), carry(2), s(2), carry(3));
--  full_adder_4 : full_adder port map (i1(3), i2(3), carry(3), s(3), carry(4));