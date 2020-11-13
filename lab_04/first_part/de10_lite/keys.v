module keys (

	input [3:0] KEY,
	input CLOCK_50,
	
	output reg [3:0] LEDR
);
	
	always @(posedge CLOCK_50)
		LEDR [3:0] <= KEY [3:0];
	
endmodule