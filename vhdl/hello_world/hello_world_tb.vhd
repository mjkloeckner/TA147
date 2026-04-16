entity hello_world_tb is
end entity;

architecture hello_world_arq of hello_world_tb is
begin
    process is
    begin

        report "Hello, World!";
        wait;

    end process;
end architecture;
