library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity case_when_tb is
end entity;

architecture case_when_arq of case_when_tb is

    signal sig_a : unsigned(7 downto 0) := x"AA";
    signal sig_b : unsigned(7 downto 0) := x"BB";
    signal sig_c : unsigned(7 downto 0) := x"CC";
    signal sig_d : unsigned(7 downto 0) := x"DD";

    -- initialize `sig_sel` to 0xFF to start at 0x00 after first increment
    signal sig_sel : unsigned(1 downto 0) := (others => '1');

    signal sig_out_a : unsigned(7 downto 0);
    signal sig_out_b : unsigned(7 downto 0);


begin

    process is 
    begin
        sig_sel <= sig_sel + 1;
        wait for 100 us;
    end process;

    process(sig_sel, sig_a, sig_b, sig_c, sig_d) is
    begin

        -- mux using if-elsif-else
        if sig_sel = "00" then
            sig_out_a <= sig_a;
        elsif sig_sel = "01" then
            sig_out_a <= sig_b;
        elsif sig_sel = "10" then
            sig_out_a <= sig_c;
        elsif sig_sel = "11" then
            sig_out_a <= sig_d;
        else
            sig_out_a <= (others => 'X');
        end if;

        case sig_sel is
            when "00" =>
                sig_out_b <= sig_a;
            when "01" =>
                sig_out_b <= sig_b;
            when "10" =>
                sig_out_b <= sig_c;
            when "11" =>
                sig_out_b <= sig_d;
            when others =>
                sig_out_b <= (others => 'X');
        end case;


    end process;


end architecture;
