library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture sim of testbench is

    -- DUT component
    component mux_demux_system
        Port (
            i_A    : in  STD_LOGIC;
            i_B    : in  STD_LOGIC;
            i_SEL0 : in  STD_LOGIC;
            i_SEL1 : in  STD_LOGIC;
            o_Y1   : out STD_LOGIC
            o_Y2   : out STD_LOGIC
        );
    end component;

    -- sinais de teste
    signal w_A, w_B, w_SEL0, w_SEL1 : STD_LOGIC := '0';
    signal w_Y1, w_Y2 : STD_LOGIC;

begin

    -- Instância do DUT
    u_DUT: mux_demux_system
        port map (
            i_A    => w_A,
            i_B    => w_B,
            i_SEL0 => w_SEL0,
            i_SEL1 => w_SEL1,
            o_Y1   => w_Y1,
            o_Y2   => w_Y2
        );

    -- Processo de estímulo simplificado
stim_proc: process
    begin

        -- Caso 1: DEMUX envia para Y1: Entrada A com valor 1
        w_A <= '1'; w_B <= '0';
        w_SEL0 <= '0'; w_SEL1 <= '0';
        wait for 10 ns;

        -- Caso 2: DEMUX envia para Y2: Entrada A com valor 1
        w_A <= '1'; w_B <= '0';
        w_SEL0 <= '0'; w_SEL1 <= '1';
        wait for 10 ns;

        -- Caso 3: DEMUX envia para Y1: Entrada B com valor 1
        w_A <= '0'; w_B <= '1';
        w_SEL0 <= '1'; w_SEL1 <= '0';
        wait for 10 ns;
		
        -- Caso 4: DEMUX envia para Y2: Entrada B com valor 1
        w_A <= '0'; w_B <= '1';
        w_SEL0 <= '1'; w_SEL1 <= '1';
        wait for 10 ns;
        
        -- Clear inputs
        w_A <= '0'; w_B <= '0';
        w_SEL0 <= '0'; w_SEL1 <= '0';
        
        wait; -- mantém simulação aberta
    end process;

end sim;
