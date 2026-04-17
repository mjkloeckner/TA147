library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rtc is
    generic(clk_freq: integer := 500e3); -- default 1 MHz clock frequency
    port(
        clk : in std_logic;
        rst : in std_logic;

        clk_ms : out std_logic);
end;

architecture rtc_arq of rtc is

    signal tick_cnt : unsigned(31 downto 0) := (others => '0');
    signal clk_aux  : std_logic := '0';

begin

    process(clk, rst)
    begin

        if rising_edge(clk) then
            if rst = '1' then
                tick_cnt <= (others => '0');
                clk_aux <= '0';
            else
                tick_cnt <= tick_cnt + 1;

                if tick_cnt = (clk_freq - 1)/2e3 then
                    tick_cnt <= (others => '0');
                    clk_aux <= not clk_aux;
                end if;
            end if;
        end if;

    end process;

    clk_ms <= clk_aux;

end architecture;
