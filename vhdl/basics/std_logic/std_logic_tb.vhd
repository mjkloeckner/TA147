library ieee;
use ieee.std_logic_1164.all;

entity std_logic_tb is
end entity;

architecture std_logic_arq of std_logic_tb is

    -- std_logic signals use single quotation marks when assigning values, this
    -- is because not only the can be assigned with 0 or 1 but also other
    -- non-numeric values, such as 'Z' for a high impedance signal or '-' for a
    -- don't care, etc.
    signal sig_a : std_logic := '0';
    signal sig_b : std_logic := '0';
    signal sig_c : std_logic := '0';

begin
    process is
    begin

        wait for 500 us;

        sig_a <= not sig_a;

    end process;
end architecture;
