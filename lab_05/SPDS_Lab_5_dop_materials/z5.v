module z5
#(parameter WIDTH = 16)
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
reg [WIDTH-1:0 ] addr, temp_addr;
wire record, play;
wire [23:0] empty_l, empty_r;
wire [23:0] send_l, send_r;
assign record = ~ key[2];   // key[2] - запись
assign play = ~ key[3];     // key[3] - воспроизвести
reg last_write, last_read;
//my_mem #(.WIDTH(WIDTH)) left_ram(
//	.clk (CLOCK_50),
//	.write_addr (addr),
//	.read_addr (temp_addr),
//	.data_in (readdata_left),
//	.we (read),
//	.data_out (send_l),
//);
//
//my_mem #(.WIDTH(WIDTH)) right_ram(
//	.clk (CLOCK_50),
//	.write_addr (addr),
//	.read_addr (temp_addr),
//	.data_in (readdata_right),
//	.we (read),
//	.data_out (send_r),
//);

	    
	 
ram2 left_ram(
	.address_a (addr),
	.address_b (temp_addr),
	.clock (CLOCK_50),
	.data_a (readdata_left),
	.data_b (24'b0),
	.wren_a (read),
	.wren_b (1'b0),
	.q_a (empty_l),
	.q_b (send_l));

ram2 right_ram(
	.address_a (addr),
	.address_b (temp_addr),
	.clock (CLOCK_50),
	.data_a (readdata_right),
	.data_b (24'b0),
	.wren_a (read),
	.wren_b (1'b0),
	.q_a (empty_r),
	.q_b (send_r));
	 
always @ (posedge CLOCK_50)
	begin
		if (key[0] == 1'b0) 
		begin
			temp_addr <= {WIDTH{1'b0}};
			addr <= {WIDTH{1'b0}};
			last_write <= 0;
			last_read <= 0;
		end
        if (record == 1'b0 || play == 1'b0)
        begin
            if ( record == 1'b1) 
			begin
			if (read_ready == 1'b1)
			begin
				if (last_read == 1'b0)
				begin
				read <= 1'b1;                    
				addr <= addr + 1;
				end
			end	else 
			begin	
				last_read <= 1'b0;
				read <= 1'b0;
				write <= 1'b0;
			end
            end 
            if (play == 1'b1) begin
                if (write_ready == 1'b1)
                begin
					if (last_write == 1'b0)
					begin
					if (temp_addr == addr - 1)
						temp_addr <= {WIDTH{1'b0}};
							
					writedata_left <= send_l;
					writedata_right <= send_r;
					
					write <= 1'b1;
					temp_addr <= temp_addr + 1;
					last_write <= 1'b1;
					end
				end	else begin
					last_write <= 1'b0;
					write <= 1'b0;
					read <= 1'b0;
				end
            end else begin
                writedata_left <= 24'b0;
                writedata_right <= 24'b0;
            end
        end
	end
endmodule