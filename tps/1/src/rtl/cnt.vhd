library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.semaphore_pkg.all;

entity cnt is
    port(
        clk   : in std_logic;
        rst   : in std_logic;
        ena   : in std_logic;
        state : in state_t;

        state_flag : out std_logic);
end;

architecture cnt_arq of cnt is

    constant YELLOW_S : unsigned(5 downto 0) := to_unsigned(3, 6);
    constant RED_GREEN_S : unsigned(5 downto 0) := to_unsigned(30, 6);

    signal tick_cnt : unsigned(5 downto 0);

begin

    process(clk, rst)
    begin

        if rst = '1' then

            tick_cnt <= (others => '0');

        elsif rising_edge(clk) then

            if ena = '1' then
                if state /= state_1r_2g and state /= state_1g_2r then
                    if tick_cnt = YELLOW_S - 1 then
                        tick_cnt <= (others => '0');

                    else
                        tick_cnt <= tick_cnt + 1;
                    end if;
                    
                else
                    if tick_cnt = RED_GREEN_S - 1 then
                        tick_cnt <= (others => '0');
                    else
                        tick_cnt <= tick_cnt + 1;
                    end if;
                end if;

            end if;

        end if;

    end process;
    
    state_flag <=
       '1' when rst = '0' and
                ena = '1' and
                state /= state_1r_2g and 
                state /= state_1g_2r and 
                tick_cnt = YELLOW_S - 1
       else
       '1' when rst = '0' and
                ena = '1' and
                tick_cnt = RED_GREEN_S - 1
       else
       '0';

end architecture;
