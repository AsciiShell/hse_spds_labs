
//`include "sm_ram.v"

module sm_matrix
(
    //bus side
    input             clk,
    input             rst_n,
    input      [31:0] bAddr,    // bus address
    input             bWrite,   // bus write enable
    input      [31:0] bWData,   // bus write data
    output     [31:0] bRData,   // bus read data

    input      [4:0]  bBAddr,   // debug addr
    output     [31:0] bRBData   // debug read data
);
    // bus wires
    wire [4:0] aAddr = bAddr[4:0];


    single_port_ram_with_init data_ram
    (
        .addr_a ( aAddr     ),
        .addr_b ( bBAddr    ),
        .clk    ( clk       ),
        .data_a ( bWData    ),
        .data_b ( 32'b0     ),
        .we_a   ( bWrite    ),
        .we_b   ( 1'b0      ),
        .q_a    ( bRData    ),
        .q_b    ( bRBData   )
    );
	 
	 
	 //single_port_ram_with_init
	 //true_dual_port_ram_single_clock
	 
/*
    ram ram_2port
    (
        .address_a ( aAddr     ),
        .address_b ( bBAddr    ),
        .clock    ( clk       ),
        .data_a ( bWData    ),
        .data_b ( 32'b0     ),
        .wren_a   ( bWrite    ),
        .wren_b   ( 1'b0      ),
        .q_a    ( bRData    ),
        .q_b    ( bRBData   )
    );

*/
endmodule



module single_port_ram_with_init
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=5)
(
	input [(ADDR_WIDTH-1):0] addr_a,
	input [(ADDR_WIDTH-1):0] addr_b,
	input clk,
	input [(DATA_WIDTH-1):0] data_a,
	input [(DATA_WIDTH-1):0] data_b,
	input we_a,
	input we_b,
	output [(DATA_WIDTH-1):0] q_a,
	output [(DATA_WIDTH-1):0] q_b
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];


	// Specify the initial contents.  You can also use the $readmemb
	// system task to initialize the RAM variable from a text file.
	// See the $readmemb template page for details.
	initial 
	begin : INIT
        $readmemh ("data3.hex", ram);
	end 
	always @ (posedge clk)
	begin
		if(we_a)
			ram[addr_a] <= data_a;
	end
	assign q_a = ram[addr_a];
	assign q_b = ram[addr_b];

endmodule



module true_dual_port_ram_single_clock
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=5)
(
	input [(ADDR_WIDTH-1):0] addr_a,
	input [(ADDR_WIDTH-1):0] addr_b,
	input clk,
	input [(DATA_WIDTH-1):0] data_a,
	input [(DATA_WIDTH-1):0] data_b,
	input we_a,
	input we_b,
	output reg [(DATA_WIDTH-1):0] q_a,
	output reg [(DATA_WIDTH-1):0] q_b
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

    initial begin
        $readmemh ("data3.hex", ram);
    end

	// Port A 
	always @ (posedge clk)
	begin
		if (we_a) 
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		else 
		begin
			q_a <= ram[addr_a];
		end 
	end 

	// Port B 
	always @ (posedge clk)
	begin
		if (we_b) 
		begin
			ram[addr_b] <= data_b;
			q_b <= data_b;
		end
		else 
		begin
			q_b <= ram[addr_b];
		end 
	end

endmodule
