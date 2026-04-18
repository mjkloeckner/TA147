library ieee;
use ieee.std_logic_1164.all;
use work.semaphore_pkg.all;

entity intersection_ctrl is

    generic(MAX_CNT : integer := 50e6);
    port(
        clk : in std_logic;
        rst : in std_logic;

        red_1 : out std_logic;
        yel_1 : out std_logic;
        gre_1 : out std_logic;
        red_2 : out std_logic;
        yel_2 : out std_logic;
        gre_2 : out std_logic);

end entity;

architecture intersection_ctrl_arq of intersection_ctrl is

    signal state      : state_t;
    signal seg_flag   : std_logic;
    signal state_flag : std_logic;

begin

    rtc : entity work.rtc(rtc_arq)
    generic map(MAX_CNT => MAX_CNT)
    port map(
        clk      => clk,
        rst      => rst,
        seg_flag => seg_flag);

    cnt : entity work.cnt(cnt_arq)
    port map(
        clk        => clk,
        rst        => rst,
        ena        => seg_flag,
        state      => state,
        state_flag => state_flag);

    semaphore : entity work.semaphore(semaphore_arq)
    port map(
        clk        => clk,
        rst        => rst,
        state_flag => state_flag,

        red_1 => red_1,
        yel_1 => yel_1,
        gre_1 => gre_1,
        red_2 => red_2,
        yel_2 => yel_2,
        gre_2 => gre_2,

        state => state);

end architecture;
