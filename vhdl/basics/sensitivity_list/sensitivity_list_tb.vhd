entity sensitivity_list_tb is
end entity;

architecture sensitivity_list_arq of sensitivity_list_tb is

    signal count_up:   integer := 0;
    signal count_down: integer := 10;

begin

    process is
    begin

        count_up <= count_up + 1;
        count_down <= count_down - 1;

        wait for 10 ns;

    end process;

    process is
    begin

        if count_up = count_down then
            report "count_up is equal to count_down";
        end if;

        -- signal change trigger
        wait on count_up, count_down;

    end process;

    -- signal change trigger but there is no need to use wait on
    process(count_up, count_down) is
    begin

        if count_up = count_down then
            report "count_up is equal to count_down";
        end if;

    end process;

end architecture;
