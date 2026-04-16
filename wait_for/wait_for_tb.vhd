entity wait_for_tb is
end entity;

architecture wait_for_arq of wait_for_tb is
begin
    process is
    begin

        report "Hello, World!";
        wait for 500 ms;

    end process;
end architecture;
