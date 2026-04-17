library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rtc_tb is
end entity;

architecture rtc_arq of rtc_tb is

    constant CLK_FREQ : integer := 1e6; -- 1 MHz clock frecuency

    signal sig_clk    : std_logic := '1';
    signal sig_rst    : std_logic := '0';
    signal sig_clk_ms : std_logic;

begin

    rtc : entity work.rtc(rtc_arq)
    generic map(clk_freq => CLK_FREQ)
    port map(
        clk    => sig_clk,
        rst    => sig_rst,
        clk_ms => sig_clk_ms);

    sig_clk <= not sig_clk after 500 ns; -- 1 MHz clock frequency

end architecture;
