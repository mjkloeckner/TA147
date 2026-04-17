library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
    generic(N: integer:= 4);
    port(
        -- inputs
        D   : in std_logic_vector(N-1 downto 0);
        clk : in std_logic;
        rst : in std_logic;
        ena : in std_logic;

        -- outputs
        Q   : out std_logic_vector(N-1 downto 0)
    );
end;

architecture reg_arq of reg is
begin

    process(clk, rst)
    begin

        if rising_edge(clk) then
            if rst = '1' then
                Q <= (others => '0');
            elsif ena = '1' then
                Q <= D;
            end if;
        end if;

    end process;

end architecture;
