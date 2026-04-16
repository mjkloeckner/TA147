library ieee;
use ieee.std_logic_1164.all;

-- this implementation of clock is not synthesizable

entity clock_tb is
end entity;

architecture clock_arq of clock_tb is

    signal clk : std_logic := '0';

begin

    clk <= not clk after 200 us;

end architecture;
