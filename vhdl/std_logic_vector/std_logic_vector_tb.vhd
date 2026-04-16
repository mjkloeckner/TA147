library ieee;
use ieee.std_logic_1164.all;

entity std_logic_vector_tb is
end entity;

architecture std_logic_vector_arq of std_logic_vector_tb is

    -- std_logic signals use single quotation marks when assigning values, this
    -- is because not only the can be assigned with 0 or 1 but also other
    -- non-numeric values, such as 'Z' for a high impedance signal or '-' for a
    -- don't care, etc.
    signal sig_vec_a : std_logic_vector(7 downto 0) := (others => '0');
    signal sig_vec_b : std_logic_vector(4 downto 0) := (others => '0');

begin
    process is
    begin

        wait for 500 us;

    end process;
end architecture;
