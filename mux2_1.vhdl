library IEEE; 
use IEEE.std_logic_1164.all;

entity mux2_1 is
  port (
    i_SEL : in  std_logic;
    i_A   : in  std_logic;
    i_B   : in  std_logic;
    o_S   : out std_logic
  );
end mux2_1;

architecture arch_1 of mux2_1 is
begin
  o_S <= (i_A and not i_SEL) or (i_B and i_SEL);
end arch_1;
