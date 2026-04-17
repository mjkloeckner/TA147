library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_tb is
end entity;

architecture reg_arq of reg_tb is

    constant N : integer := 4;

    signal sig_D   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal sig_Q   : std_logic_vector(N-1 downto 0);
    signal sig_clk : std_logic := '0';
    signal sig_rst : std_logic := '0';
    signal sig_ena : std_logic := '1';

begin

    flip_flop_d : entity work.reg(reg_arq)
    generic map(N => N)
    port map(
        D   => sig_D,
        Q   => sig_Q,
        clk => sig_clk,
        rst => sig_rst,
        ena => sig_ena);

    sig_D <= (others => '1') after 5 us;
    sig_clk <= not sig_clk after 1 us;
    sig_rst <= '1' after 10 us, '0' after 20 us;

end architecture;
