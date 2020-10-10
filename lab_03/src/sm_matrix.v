
module sm_matrix
(
    //bus side
    input             clk,
    input             rst_n,
    input      [31:0] bAddr,    // bus address
    input             bWrite,   // bus write enable
    input      [31:0] bWData,   // bus write data
    output     [31:0] bRData,   // bus read data

    input      [3:0]  bBAddr,   // debug addr
    output     [31:0] bRBData   // debug read data
);
    // bus wires
    wire [3:0] aAddr = bAddr[3:0];


    true_dual_port_ram_single_clock data_ram
    (
        .data_a ( bWData    ),
        .data_b ( 32'b0     ),
        .addr_a ( aAddr     ),
        .addr_b ( bBAddr    ),
        .we_a   ( bWrite    ),
        .we_b   ( 1'b0      ),
        .clk    ( clk       ),
        .q_a    ( bRData    ),
        .q_b    ( bRBData   )
    );

endmodule