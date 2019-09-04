library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity RTL_Blink_LED is
    port (
        fpga_clk_50   : in  std_logic;   
		  
		  fpga_sw_pio   : in unsigned(3 downto 0);
		  en   : in std_logic;
		  
        fpga_led_pio  : out std_logic_vector(5 downto 0)
	);
end entity RTL_Blink_LED;

architecture Blink_led of RTL_Blink_LED is
	component LED_peripheral
		port (
			fpga_clk_50   : in  std_logic;   
		  
			fpga_sw_pio   : in unsigned(3 downto 0);
			en            : in std_logic;
		  
			fpga_led_pio  : out std_logic_vector(5 downto 0)
		);
	end component;

begin

	a: LED_peripheral port map(fpga_clk_50, fpga_sw_pio, en, fpga_led_pio);


end Blink_led;