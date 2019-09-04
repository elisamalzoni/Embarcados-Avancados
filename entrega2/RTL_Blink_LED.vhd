library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity RTL_Blink_LED is
    port (
	     -- Globals
        fpga_clk_50    : in  std_logic;             -- clock.clk
        fpga_sw_pio    : in std_logic_vector(3 downto 0);
        fpga_led_pio   : out std_logic_vector(5 downto 0);
		  en             : in std_logic
		  
	);
end entity RTL_Blink_LED;


architecture rtl of RTL_Blink_LED is
    component niosHello is
        port (
            clk_clk       : in  std_logic                    := 'X';             -- clk
            leds_export   : out std_logic_vector(5 downto 0);                    -- export
            reset_reset_n : in  std_logic                    := 'X';             -- reset_n
            sw_export     : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
            but_export    : in  std_logic                    := 'X'              -- export
        );
    end component niosHello;
begin
    u0 : component niosHello
        port map (
            clk_clk       => fpga_clk_50,       --   clk.clk
            leds_export   => fpga_led_pio,   --  leds.export
            reset_reset_n => '1', -- reset.reset_n
            sw_export     => fpga_sw_pio,     --    sw.export
            but_export    => en     --   but.export
        );

end rtl;

--architecture Blink_led of RTL_Blink_LED is
--	component LED_peripheral
--		port (
--			fpga_clk_50   : in  std_logic;   
--		  
--			fpga_sw_pio   : in unsigned(3 downto 0);
--			en            : in std_logic;
--		  
--			fpga_led_pio  : out std_logic_vector(5 downto 0)
--		);
--	end component;
--
--begin
--
--	a: LED_peripheral port map(fpga_clk_50, fpga_sw_pio, en, fpga_led_pio);
--
--
--end Blink_led;