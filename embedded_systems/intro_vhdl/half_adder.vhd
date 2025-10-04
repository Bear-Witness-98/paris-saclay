library ieee;
use ieee.std_logic_1164.all;

-- std_logic defined in the library.
-- also defined there are operations 
-- between those types.
entity half_adder is port (
  i1, i2  : in std_logic;
  s, c : out std_logic);
end half_adder;

architecture half_adder_dataflow of half_adder is
begin
  s <= i1 xor i2;
  c <= i1 and i2; 
end half_adder_dataflow;