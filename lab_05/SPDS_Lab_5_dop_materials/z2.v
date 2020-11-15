module z2
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
always @ (posedge CLOCK_50)
	begin
		if (read_ready == 1'b1 && write_ready == 1'b1)
		begin
            if (key[1] == 1'b1) begin
                writedata_left <= readdata_left;
                writedata_right <= readdata_right;
            end else begin
                writedata_left <= readdata_right;
                writedata_right <= readdata_left;
            end
			read <= 1'b1;
			write <= 1'b1;
		end	else begin
			read <= 1'b0;
			write <= 1'b0;
		end
	end
endmodule