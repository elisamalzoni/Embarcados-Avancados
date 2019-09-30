
module unsaved (
	clk_clk,
	clk_1_clk,
	dat_dat,
	key_export,
	leds_writeresponsevalid_n,
	reset_reset_n);	

	input		clk_clk;
	inout		clk_1_clk;
	inout		dat_dat;
	input	[3:0]	key_export;
	output	[3:0]	leds_writeresponsevalid_n;
	input		reset_reset_n;
endmodule
