module my_mem
#(parameter WIDTH = 20)
(
    input           			clk,
	 input [WIDTH - 1:0]		write_addr,
	 input [WIDTH - 1:0]		read_addr,
	 input [WIDTH - 1:0]		data_in,
	 input 						we,
    output reg  [23:0 ] 	data_out
);
reg [2 ** WIDTH:0] mem [23:0];
always @ (posedge clk)
begin
	if (we == 1'b1)
		mem[write_addr] = data_in;
	data_out = mem[read_addr];
end
endmodule