library ieee;
use ieee.std_logic_1164.all;
use work.semaphore_pkg.all;

entity semaphore is

    generic(clk_freq : integer := 1e6); -- default 1 MHz clock frequency
    port(
        clk        : in std_logic;
        rst        : in std_logic;
        state_flag : in std_logic;

        red_1 : out std_logic;
        yel_1 : out std_logic;
        gre_1 : out std_logic;
        red_2 : out std_logic;
        yel_2 : out std_logic;
        gre_2 : out std_logic;
        state : out state_t);

end entity;

architecture semaphore_arq of semaphore is

    -- R1 Y1 G1 R2 Y2 G2
    signal light : std_logic_vector(5 downto 0);

    signal state_aux : state_t;

begin

    process(rst, clk) is
    begin

        if rst = '1' then
            state_aux <= state_1r_2g;
        elsif rising_edge(clk) then

            case state_aux is
                when state_1r_2g =>
                    if state_flag = '1' then
                        state_aux <= state_1r_2y;
                    end if;
                when state_1r_2y =>
                    if state_flag = '1' then
                        state_aux <= state_1ry_2r;
                    end if;
                when state_1ry_2r =>
                    if state_flag = '1' then
                        state_aux <= state_1g_2r;
                    end if;
                when state_1g_2r =>
                    if state_flag = '1' then
                        state_aux <= state_1y_2r;
                    end if;
                when state_1y_2r =>
                    if state_flag = '1' then
                        state_aux <= state_1r_2ry;
                    end if;
                when state_1r_2ry=>
                    if state_flag = '1' then
                        state_aux <= state_1r_2g;
                    end if;
            end case;

        end if;

    end process;

    state <= state_aux;

    -- R1 Y1 G1 R2 Y2 G2
    with state_aux select light <=
        "100001" when state_1r_2g,
        "100010" when state_1r_2y,
        "010100" when state_1ry_2r,
        "001100" when state_1g_2r,
        "010010" when state_1y_2r,
        "100010" when state_1r_2ry;

    red_1 <= light(5);
    yel_1 <= light(4);
    gre_1 <= light(3);
    red_2 <= light(2);
    yel_2 <= light(1);
    gre_2 <= light(0);

end architecture;
