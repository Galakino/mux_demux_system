library iEEE;
use iEEE.std_logic_1164.all;

entity demux1_2 is
  port (
    i_SEL : in  std_logic;
    i_E   : in  std_logic;
    o_Y0  : out std_logic;
    o_Y1  : out std_logic
  );
end demux1_2;

architecture arch_1 of demux1_2 is
begin

  -- Implementação da arquitetura demux1_2
  o_Y0 <= i_E and not i_SEL; -- saída 1
  o_Y1 <= i_E and i_SEL;     -- saída 2

end arch_1;
