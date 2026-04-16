library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- expose signals outside of this module
entity button_controlled_led is
port(
    button_a : in  std_logic;
    led_a    : out std_logic);
end entity;

architecture button_controlled_led_arq of button_controlled_led is
begin

    process(button_a) is 
    begin

        led_a <= button_a;

    end process;

end architecture;
