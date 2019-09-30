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

	u0 : component unsaved
		port map (
			clk_clk                   => CONNECTED_TO_clk_clk,                   --   clk.clk
			clk_1_clk                 => CONNECTED_TO_clk_1_clk,                 -- clk_1.clk
			dat_dat                   => CONNECTED_TO_dat_dat,                   --   dat.dat
			key_export                => CONNECTED_TO_key_export,                --   key.export
			leds_writeresponsevalid_n => CONNECTED_TO_leds_writeresponsevalid_n, --  leds.writeresponsevalid_n
			reset_reset_n             => CONNECTED_TO_reset_reset_n              -- reset.reset_n
		);

