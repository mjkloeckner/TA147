library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity button_controlled_led_tb is
end entity;

architecture button_controlled_led_arq of button_controlled_led_tb is

    signal sig_button : std_logic := '0';
    signal sig_led    : std_logic;

begin

    DUT : entity work.button_controlled_led(button_controlled_led_arq) port map(
        button_a => sig_button,
        led_a    => sig_led);

    process is 
    begin

        sig_button <= not sig_button after 250 us;
        wait for 10 us;

    end process;

end architecture;
