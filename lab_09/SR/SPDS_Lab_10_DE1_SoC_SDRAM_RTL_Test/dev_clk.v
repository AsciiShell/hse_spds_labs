module dev_clk(
				input clk,
				output oclk
			);
reg [27:0] timer;

always @ (negedge(clk))
	timer = timer + 1;
	
assign oclk = timer[25];
endmodule