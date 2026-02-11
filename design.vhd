library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_demux_system is
    Port (
        i_A    : in  STD_LOGIC;  -- entrada de dado 1
        i_B    : in  STD_LOGIC;  -- entrada de dado 2
        i_SEL0 : in  STD_LOGIC;  -- seletor do MUX
        i_SEL1 : in  STD_LOGIC;  -- seletor do DEMUX
        o_Y1   : out STD_LOGIC;  -- saída 1 do sistema
        o_Y2   : out STD_LOGIC   -- saída 2 do sistema
    );
end mux_demux_system;

architecture arch of mux_demux_system is

    -- sinal interno: saída do mux
    signal u_mux : STD_LOGIC;

    -- componente do demux1_2
    component demux1_2
        Port (
            i_E   : in  STD_LOGIC;
            i_SEL : in  STD_LOGIC;
            o_Y0  : out STD_LOGIC;
            o_Y1  : out STD_LOGIC
        );
    end component;
    
    -- componente do mux2_1
    component mux2_1
        Port (
            i_SEL : in  STD_LOGIC;
            i_A   : in  STD_LOGIC;
            i_B   : in  STD_LOGIC;
            o_S   : out STD_LOGIC
        );
    end component;

begin

    -- Instância do MUX 2-para-1
    MUX0: mux2_1 port map(
        i_SEL => i_SEL0,
        i_A   => i_A,
        i_B   => i_B,
        o_S   => u_mux
    );

    -- Instância do DEMUX 1-para-2
    DEMUX0: demux1_2 port map(
        i_E   => u_mux,      -- entrada do demux recebe saída do mux
        i_SEL => i_SEL1,     -- seletor do demux
        o_Y0  => o_Y1,       -- saída final 1
        o_Y1  => o_Y2        -- saída final 2
    );

end arch;
