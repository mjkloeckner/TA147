entity signal_tb is
end entity;

architecture signal_arq of signal_tb is

    -- signals are accessible to any process across the architecture
    signal sig_a : integer := 0;

begin
    process is

        -- variables are only local to the process
        variable var_x : integer := 0;

    begin

        -- variables update its value inmediatly while signals only update when
        -- the process pauses, for example on a `wait` stament or when the
        -- process starts again

        var_x := var_x + 1;
        sig_a <= sig_a + 1;

        report "var_x: " & integer'image(var_x);
        report "sig_a: " & integer'image(sig_a);

        wait for 500 us;

    end process;
end architecture;
