	  
library IEEE;
use IEEE.std_logic_1164.all;

entity topLevel is
    port (
        -- Gloabals
        fpga_clk_50        : in  std_logic;             -- clock.clk
		  
        -- I/Os
        fpga_led_pio       : out std_logic_vector(3 downto 0);
		  fpga_key_pio       : in std_logic_vector(3 downto 0);
		  
		  PS2_CLK : inout std_logic;
		  PS2_DAT :  inout std_logic
		  
	);
end entity topLevel;

architecture rtl of topLevel is


    component unsaved is
        port (
            clk_clk                   : in    std_logic                    := 'X';             -- clk
            clk_1_clk                 : inout std_logic                    := 'X';             -- clk
            dat_dat                   : inout std_logic                    := 'X';             -- dat
            key_export                : in    std_logic_vector(3 downto 0) := (others => 'X'); -- export
            leds_writeresponsevalid_n : out   std_logic_vector(3 downto 0);                    -- writeresponsevalid_n
            reset_reset_n             : in    std_logic                    := 'X'              -- reset_n
        );
    end component unsaved;
begin
    u0 : component unsaved
        port map (
            clk_clk                   => fpga_clk_50,                   --   clk.clk
            clk_1_clk                 => PS2_CLK,                 -- clk_1.clk
            dat_dat                   => PS2_DAT,                   --   dat.dat
            key_export                => fpga_key_pio,                --   key.export
            leds_writeresponsevalid_n => fpga_led_pio, --  leds.writeresponsevalid_n
            reset_reset_n             => '1'              -- reset.reset_n
        );
	
end rtl;

    