entity loop_tb is
end entity;

architecture loop_arq of loop_tb is
begin
    process is
        variable i : integer := 0;
    begin

        report "Hello.";

        loop
            report "This is a loop that only executes once.";
            exit;
        end loop;

        loop
            report "This is another loop which exits based on a condition.";
            report "And this is iteration number " & integer'image(i);

            i := i + 1;

            if i > 2 then
                exit;
            end if;
        end loop;

        for i in 0 to 2 loop
            report "This is a for loop which executes 3 times.";
            report "And this is iteration number " & integer'image(i);
        end loop;

        i := 0;
        while i < 5 loop

            i := i + 1;
            report "This is a while loop which executes 5 times.";

        end loop;

        report "Bye!";
        wait;

    end process;
end architecture;
