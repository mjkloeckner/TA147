library ieee;
use ieee.math_real.all;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity rtc is
    generic(MAX_CNT: integer := 50e6);
    port(
        clk : in std_logic;
        rst : in std_logic;

        seg_flag : out std_logic);
end;

architecture rtc_arq of rtc is

    constant BITS : integer := integer(ceil(log2(real(MAX_CNT))));
    signal tick_cnt : unsigned(BITS-1 downto 0);
    
begin

    process(clk, rst)
    begin

        if rst = '1' then

            tick_cnt <= (others => '0');
            seg_flag <= '0';

        elsif rising_edge(clk) then

            if tick_cnt = MAX_CNT  - 1 then
                tick_cnt <= (others => '0');
            else
                tick_cnt <= tick_cnt + 1;
            end if;
            
            if tick_cnt = MAX_CNT - 2 then
                seg_flag <= '1';
            else
                seg_flag <= '0';
            end if;

        end if;

    end process;

end architecture;
