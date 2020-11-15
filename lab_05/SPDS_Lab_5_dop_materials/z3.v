module z3
(
    input           CLOCK_50,
    input           read_ready,
    input           write_ready,
    input   [23:0 ] readdata_left,
    input   [23:0 ] readdata_right,
    input   [3:0]   key,
    output reg         read,
    output reg         write,
    output reg  [23:0 ] writedata_left,
    output reg  [23:0 ] writedata_right
);
wire [23:0] Q;
noise_generator noise_generator (
    .clk (CLOCK_50),
    .enable (key[2]),
    .Q (Q)
);
always @ (posedge CLOCK_50)
	begin
		if (read_ready == 1'b1 && write_ready == 1'b1)
		begin
            if (key == 1'b1) begin
                writedata_left <= readdata_left + Q;
                writedata_right <= readdata_right + Q;
            end else begin
                writedata_left <= readdata_right + Q;
                writedata_right <= readdata_left + Q;
            end
			read <= 1'b1;
			write <= 1'b1;
		end	else begin
			read <= 1'b0;
			write <= 1'b0;
		end
	end
endmodule

module noise_generator (clk, enable, Q);
    input clk, enable;
    output [23:0] Q;
    reg [2:0] counter;
    always @ (posedge clk)
        if (enable)
            counter = counter + 1'b1;
    assign Q = {{10{counter[2]}}, counter, 11'd0};
endmodule