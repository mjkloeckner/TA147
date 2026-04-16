library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_generic_tb is
end entity;

architecture mux_generic_tb_arq of mux_generic_tb is

    constant mux_data_width : integer := 8;

    signal sig_a : unsigned(mux_data_width - 1 downto 0) := x"AA";
    signal sig_b : unsigned(mux_data_width - 1 downto 0) := x"BB";
    signal sig_c : unsigned(mux_data_width - 1 downto 0) := x"CC";
    signal sig_d : unsigned(mux_data_width - 1 downto 0) := x"DD";

    signal sig_sel : unsigned(1 downto 0) := (others => '1');
    signal sig_out : unsigned(mux_data_width - 1 downto 0);

begin

    -- instance of `mux` module
    mux_a : entity work.mux_generic(mux_generic_arq) 
    generic map(mux_data_width => mux_data_width)
    port map(
        sig_sel => sig_sel,
        sig_a   => sig_a,
        sig_b   => sig_b,
        sig_c   => sig_c,
        sig_d   => sig_d,
        sig_out => sig_out);

    process is 
    begin
        sig_sel <= sig_sel + 1;
        wait for 100 us;
    end process;

end architecture;
