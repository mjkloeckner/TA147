entity wait_tb is
end entity;

architecture wait_arq of wait_tb is

    signal count_up:   integer := 0;
    signal count_down: integer := 10;

begin

    process is
    begin

        count_up <= count_up + 1;
        count_down <= count_down - 1;

        wait for 10 ms;

        if count_down <= 0 then
            -- wait forever
            wait;
        end if;

    end process;

    process is
    begin

        -- waits until either `count_up` or `count_down` updates its value
        wait on count_up, count_down;

        report "[1] count_up: " & integer'image(count_up);
        report "[1] count_down: " & integer'image(count_down);

    end process;

    process is
    begin

        -- waits until `count_up` and `count_down` are equal
        wait until count_up = count_down;

        report "[2] count_up: " & integer'image(count_up);
        report "[2] count_down: " & integer'image(count_down);

    end process;

end architecture;
