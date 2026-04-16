library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
    generic(N : natural := 8);
    port(
        op_A : in std_logic_vector(N-1 downto 0);
        op_B : in std_logic_vector(N-1 downto 0);
        load : in std_logic;
        clk  : in std_logic;
        res  : out std_logic_vector(2*N-1 downto 0));
end entity;

architecture multiplier_arq of multiplier is
    signal in_P, in_B, aux              : std_logic_vector(N-1 downto 0);
    signal out_P, out_B, out_sum, out_A : std_logic_vector(N-1 downto 0);
    signal c_out : std_logic;

begin

    reg_A : entity work.reg(reg_arq)
    generic map(N => 8)
    port map(
        D   => op_A,
        clk => clk,
        rst => '0',
        ena => '1',
        Q   => out_A);

    reg_B : entity work.reg(reg_arq)
    generic map(N => 8)
    port map(
        D   => in_B,
        clk => clk,
        rst => '0',
        ena => '1',
        Q   => out_B);

    reg_P : entity work.reg(reg_arq)
    generic map(N => 8)
    port map(
        D   => in_P,
        clk => clk,
        rst => load,
        ena => '1',
        Q   => out_P);

    adder_A : entity work.adder(adder_arq)
    generic map(N => 8)
    port map(
       op_A => out_P,
       op_B => aux,
       c_in => '0',
       res => out_sum,
       c_out => c_out);

    in_P <= c_out & out_sum(N-1 downto 1);

    in_B <= op_B when load = '1' else out_sum(0) & out_B(N-1 downto 1);

    aux <= out_A when out_B(0) = '1' else (others => '0');

    res <= out_P & out_B;

end architecture;
