library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(N : natural := 4); -- number of bits
    port(
        -- inputs
        A    : in  std_logic_vector(N-1 downto 0);
        B    : in  std_logic_vector(N-1 downto 0);
        C_in : in  std_logic;

        -- outputs
        res   : out std_logic_vector(N-1 downto 0);
        C_out : out std_logic);
end entity;

architecture adder_arq of adder is

    signal res_aux : std_logic_vector(N+1 downto 0);

begin

    res_aux <= std_logic_vector(unsigned('0' & A & C_in) + unsigned('0' & B & '1'));
    res <= res_aux(N downto 1);
    C_out <= res_aux(N+1);

end architecture;
