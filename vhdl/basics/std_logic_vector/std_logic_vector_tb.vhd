library ieee;
use ieee.std_logic_1164.all;

entity std_logic_vector_tb is
end entity;

architecture std_logic_vector_arq of std_logic_vector_tb is

    -- std_logic signals use single quotation marks when assigning values, this
    -- is because not only the can be assigned with 0 or 1 but also other
    -- non-numeric values, such as 'Z' for a high impedance signal or '-' for a
    -- don't care, etc.
    signal sig_vec_a: std_logic_vector(7 downto 0) := "U1010101";
    signal sig_vec_b: std_logic_vector(3 downto 0) := (others => '0');
    signal sig_vec_c: std_logic_vector(0 to 3)     := (others => '0');
    signal sig_vec_d: std_logic_vector(7 downto 0) := "00000001";
    signal sig_vec_e: std_logic_vector(7 downto 0) := "00000001";

begin
    process is
    begin

        wait for 100 us;

        -- shift register
        for i in 7 downto 1 loop
            sig_vec_d(i) <= sig_vec_d(i - 1);
        end loop;

        sig_vec_d(0) <= sig_vec_d(7);

        -- shift register more generic (using signal attributes)
        for i in sig_vec_e'left downto sig_vec_e'right + 1 loop
            sig_vec_e(i) <= sig_vec_e(i - 1);
        end loop;

        sig_vec_e(sig_vec_e'right) <= sig_vec_e(sig_vec_e'left);


    end process;
end architecture;
