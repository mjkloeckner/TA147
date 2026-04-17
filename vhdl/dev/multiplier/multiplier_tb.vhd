library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier_tb is
end entity;

architecture multiplier_tb_arq of multiplier_tb is

    constant N : integer := 8;

    signal A    : std_logic_vector(N - 1 downto 0) := x"01";
    signal B    : std_logic_vector(N - 1 downto 0) := x"02";
    signal load : std_logic := '1';
    signal clk  : std_logic := '0';
    signal res  : std_logic_vector(2*N-1 downto 0);

begin

    DUT : entity work.multiplier(multiplier_arq) 
    generic map(N => N)
    port map(
        op_A => A,
        op_B => B,
        load => load,
        clk => clk,
        res => res);

    clk <= not clk after 1 us;

end architecture;
