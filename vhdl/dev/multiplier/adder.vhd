library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(N : integer := 4); -- number of bits
    port(
        -- inputs
        op_A  : in  std_logic_vector(N-1 downto 0);
        op_B  : in  std_logic_vector(N-1 downto 0);
        c_in  : in  std_logic;

        -- outputs
        res   : out std_logic_vector(N-1 downto 0);
        c_out : out std_logic);
end entity;

architecture adder_arq of adder is

    signal res_aux : std_logic_vector(N+1 downto 0);

begin

    res_aux <= std_logic_vector(unsigned('0' & op_A & c_in) + unsigned('0' & op_B & '1'));
    res <= res_aux(N downto 1);
    c_out <= res_aux(N+1);

end architecture;
