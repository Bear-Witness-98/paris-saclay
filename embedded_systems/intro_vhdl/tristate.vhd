library ieee;
use ieee.std_logic_1164.all;

entity tristate is port 
  (input, OE: in std_logic; 
   output : out std_logic);
end tristate;

architecture behaviour of tristate is
begin
  output <= input when OE = '1' else 'Z';
end behaviour;