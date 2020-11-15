
module ledrs
(
    input      [23:0] digit,
    output reg [9:0] seven_segments
);

    always @*
        case (digit)
        'h0: seven_segments = 'b1111111111;
        'h1: seven_segments = 'b1111111110;
        'h2: seven_segments = 'b1111111100;
        'h3: seven_segments = 'b1111111000;
        'h4: seven_segments = 'b1111110000;
        'h5: seven_segments = 'b1111100000;
        'h6: seven_segments = 'b1111000000;
        'h7: seven_segments = 'b1110000000;
        'h8: seven_segments = 'b1100000000;
        'h9: seven_segments = 'b1000000000;
        'ha: seven_segments = 'b0000000000;
        endcase

endmodule