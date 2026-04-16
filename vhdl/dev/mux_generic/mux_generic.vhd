library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- expose signals outside of this module
entity mux_generic is
generic(mux_data_width : integer);
port(
    -- inputs
    sig_a   : in unsigned(mux_data_width - 1 downto 0);
    sig_b   : in unsigned(mux_data_width - 1 downto 0);
    sig_c   : in unsigned(mux_data_width - 1 downto 0);
    sig_d   : in unsigned(mux_data_width - 1 downto 0);
    sig_sel : in unsigned(1 downto 0);

    -- outputs
    sig_out : out unsigned(mux_data_width - 1 downto 0));
end entity;

architecture mux_generic_arq of mux_generic is
begin

    process(sig_sel, sig_a, sig_b, sig_c, sig_d) is 
    begin

        case sig_sel is
            when "00" =>
                sig_out <= sig_a;
            when "01" =>
                sig_out <= sig_b;
            when "10" =>
                sig_out <= sig_c;
            when "11" =>
                sig_out <= sig_d;
            when others =>
                sig_out <= (others => 'X');
        end case;

    end process;

end architecture;
