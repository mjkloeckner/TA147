library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_tb is
end entity;

architecture adder_tb_arq of adder_tb is

    constant N : natural := 4;

    signal sig_A    : std_logic_vector(N-1 downto 0) := std_logic_vector(to_unsigned(3, N));
    signal sig_B    : std_logic_vector(N-1 downto 0) := std_logic_vector(to_unsigned(7, N));
    signal sig_C_in : std_logic := '0';

    signal sig_res   : std_logic_vector(N-1 downto 0);
    signal sig_C_out : std_logic;

begin

    adder : entity work.adder(adder_arq)
    generic map(N => N)
    port map(
      A     => sig_A,
      B     => sig_B,
      C_in  => sig_C_in,
      res   => sig_res,
      C_out => sig_C_out);

end architecture;
