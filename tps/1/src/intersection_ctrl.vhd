library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity intersection_ctrl is

    generic(clk_freq : integer := 1e6); -- default 1 MHz clock frequency
    port(
        clk : in std_logic;
        rst : in std_logic;

        red_1 : out std_logic := '1';
        yel_1 : out std_logic := '0';
        gre_1 : out std_logic := '0';
        red_2 : out std_logic := '0';
        yel_2 : out std_logic := '0';
        gre_2 : out std_logic := '1');

end entity;

architecture intersection_ctrl_arq of intersection_ctrl is

    constant RED_TIME_MS : integer := 30e3;
    constant YEL_TIME_MS : integer := 3e3;
    constant GRE_TIME_MS : integer := 30e3;

    type state_t is(state_0, state_1, state_2, state_3);

    signal state : state_t := state_0;
    signal clk_ms : std_logic;
    signal ms_tick_cnt : unsigned(31 downto 0) := (others => '0');

begin

    rtc : entity work.rtc(rtc_arq)
    generic map(clk_freq => clk_freq)
    port map(
        clk   => clk,
        rst   => rst,
        clk_ms => clk_ms);

    process(clk_ms, rst) is
    begin

        if rst = '1' then
            state <= state_0;
            ms_tick_cnt <= (others => '0');
        else
            ms_tick_cnt <= ms_tick_cnt + 1;
            case state is
                when state_0 =>
                    if ms_tick_cnt = RED_TIME_MS then

                        ms_tick_cnt <= (others => '0');
                        state <= state_1;

                        red_1 <= '1';
                        yel_1 <= '1';
                        gre_1 <= '0';
                        red_2 <= '0';
                        yel_2 <= '1';
                        gre_2 <= '0';


                    end if;
                when state_1 =>
                    if ms_tick_cnt = YEL_TIME_MS then

                        ms_tick_cnt <= (others => '0');
                        state <= state_2;

                        red_1 <= '0';
                        yel_1 <= '0';
                        gre_1 <= '1';
                        red_2 <= '1';
                        yel_2 <= '0';
                        gre_2 <= '0';

                    end if;
                when state_2 =>
                    if ms_tick_cnt = GRE_TIME_MS then

                        ms_tick_cnt <= (others => '0');
                        state <= state_3;

                        red_1 <= '0';
                        yel_1 <= '1';
                        gre_1 <= '0';
                        red_2 <= '1';
                        yel_2 <= '1';
                        gre_2 <= '0';

                    end if;
                when state_3 =>
                    if ms_tick_cnt = YEL_TIME_MS then

                        ms_tick_cnt <= (others => '0');
                        state <= state_0;

                        red_1 <= '1';
                        yel_1 <= '0';
                        gre_1 <= '0';
                        red_2 <= '0';
                        yel_2 <= '0';
                        gre_2 <= '1';

                    end if;
            end case;
        end if;

    end process;

end architecture;
