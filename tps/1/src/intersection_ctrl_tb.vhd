library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity intersection_ctrl_tb is
end entity;

architecture intersection_ctrl_tb_arq of intersection_ctrl_tb is

    constant CLK_FREQ : integer := 1e6;

    signal sig_clk : std_logic := '0';
    signal sig_rst : std_logic := '0';

    signal sig_red_1 : std_logic := '0';
    signal sig_yel_1 : std_logic := '0';
    signal sig_gre_1 : std_logic := '0';

    signal sig_red_2 : std_logic := '0';
    signal sig_yel_2 : std_logic := '0';
    signal sig_gre_2 : std_logic := '0';

begin

    intersection_ctrl : entity work.intersection_ctrl(intersection_ctrl_arq)
    generic map(clk_freq => CLK_FREQ/1e3) -- make sim times smaller (1000 times)
    port map(
        clk   => sig_clk,
        rst   => sig_rst,

        red_1 => sig_red_1,
        yel_1 => sig_yel_1,
        gre_1 => sig_gre_1,
        red_2 => sig_red_2,
        yel_2 => sig_yel_2,
        gre_2 => sig_gre_2);

    sig_clk <= not sig_clk after 500 ns; -- one rising edge every 1 us

end architecture;
