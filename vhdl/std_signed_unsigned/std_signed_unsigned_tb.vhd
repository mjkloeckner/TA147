library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity std_signed_unsigned_tb is
end entity;

architecture std_signed_unsigned_arq of std_signed_unsigned_tb is

    -- the difference between signed/unsigned and logic_vector is that this
    -- vectors are interpreted by the compiler as numbers, so they can be used
    -- in calculations
    signal sig_unsigned_cnt : unsigned(7 downto 0) := (others => '0');
    signal sig_signed_cnt   : signed(7 downto 0)   := (others => '0');

    signal sig_4_unsigned : unsigned(3 downto 0) := "1000";
    signal sig_4_signed   : signed(3 downto 0)   := "1000";

    signal sig_8_unsigned : unsigned(7 downto 0) := (others => '0');
    signal sig_8_signed   : signed(7 downto 0)   := (others => '0');

begin
    process is
    begin

        wait for 10 ns;

        -- wrapping signals
        sig_unsigned_cnt <= sig_unsigned_cnt + 1;
        sig_signed_cnt <= sig_signed_cnt + 1;

        -- adding signals
        -- this is incremented by 4 on every run
        sig_8_unsigned <= sig_8_unsigned + sig_4_unsigned;

        -- this is decremented by 4 on every run because sig_4_signed with value
        -- 0b1000 is -8 in decimal
        sig_8_signed <= sig_8_signed + sig_4_signed;

    end process;
end architecture;
