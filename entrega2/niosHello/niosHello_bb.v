
module niosHello (
	clk_clk,
	leds_export,
	reset_reset_n,
	sw_export,
	but_export);	

	input		clk_clk;
	output	[5:0]	leds_export;
	input		reset_reset_n;
	input	[3:0]	sw_export;
	input		but_export;
endmodule
