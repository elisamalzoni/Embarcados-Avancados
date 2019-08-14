library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED_peripheral is
    port (
        fpga_clk_50   : in  std_logic;   
		  
		  fpga_sw_pio   : in unsigned(3 downto 0);
		  en            : in std_logic;
		  
        fpga_led_pio  : out std_logic_vector(5 downto 0)
	);
end entity LED_peripheral;

architecture led of LED_peripheral is

-- signal
signal blink : std_logic := '0';
signal c : unsigned(24 downto 0) := (others => '0');

begin


  process(fpga_clk_50) 
      variable counter : unsigned(24 downto 0) ;
      begin
        if (rising_edge(fpga_clk_50)) then
		  
                  if (counter < c) then
                      counter := counter + 1;
                  else
							 if (en = '0') then
												 
								 c <= fpga_sw_pio & "111010111100001000000";

								 blink <= not blink;
								 counter := (others => '0');
							end if;
                  end if; 
        end if;
  end process;

  fpga_led_pio(0) <= NOT(en) AND blink;
  fpga_led_pio(1) <= NOT(en) AND blink;
  fpga_led_pio(2) <= NOT(en) AND blink;
  fpga_led_pio(3) <= NOT(en) AND blink;
  fpga_led_pio(4) <= NOT(en) AND blink;
  fpga_led_pio(5) <= NOT(en) AND blink;

end led;