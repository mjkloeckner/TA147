entity if_elsif_else_tb is
end entity;

architecture if_elsif_else_arq of if_elsif_else_tb is

    signal count_up:   integer := 0;

begin

    process is
    begin

        count_up <= count_up + 1;

        wait for 10 ms;

        if count_up <= 2 then
            report "count_up: " & integer'image(count_up) & " <= 2";
        elsif count_up <= 4 then
            report "count_up: " & integer'image(count_up) & " <= 4";
        elsif count_up <= 6 then
            report "count_up: " & integer'image(count_up) & " <= 6";
        else
            -- wait forever
            wait;
        end if;


    end process;

end architecture;
