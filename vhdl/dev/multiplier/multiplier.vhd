library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    generic(N : natural := 8);
    port(
        op_A : in  std_logic_vector(N-1 downto 0);
        op_B : in  std_logic_vector(N-1 downto 0);
        load : in  std_logic;
        clk  : in  std_logic;
        res  : out std_logic_vector(2*N-1 downto 0));
end entity;

architecture multiplier_arq of multiplier is

    signal B_in, P_in, aux              : std_logic_vector(N-1 downto 0);
    signal A_out, B_out, P_out, sum_out : std_logic_vector(N-1 downto 0);
    signal C_out : std_logic;

begin

    A_reg : entity work.reg(reg_arq)
    generic map(N => 8)
    port map(
        D   => op_A,
        clk => clk,
        rst => '0',
        ena => '1',
        Q   => A_out);

    B_reg : entity work.reg(reg_arq)
    generic map(N => 8)
    port map(
        D   => B_in,
        clk => clk,
        rst => '0',
        ena => '1',
        Q   => B_out);

    P_reg : entity work.reg(reg_arq)
    generic map(N => 8)
    port map(
        D   => P_in,
        clk => clk,
        rst => load,
        ena => '1',
        Q   => P_out);

    adder : entity work.adder(adder_arq)
    generic map(N => 8)
    port map(
       op_A  => P_out,
       op_B  => aux,
       c_in  => '0',
       res   => sum_out,
       c_out => C_out);

    in_P <= c_out & out_sum(N-1 downto 1);
    in_B <= op_B when load = '1' else out_sum(0) & out_B(N-1 downto 1);
    aux <= out_A when out_B(0) = '1' else (others => '0');
    res <= out_P & out_B;

end architecture;
