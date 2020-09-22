module sm_hex_display_our
(
    input      [3:0] digit,
    output reg [6:0] seven_segments
);

    always @*
        case (digit)
        'h0: seven_segments = 'b0111111;  // a b c d e f g
        'h1: seven_segments = 'b0000110;
        'h2: seven_segments = 'b1011011;  //   --a--
        'h3: seven_segments = 'b1001111;  //  |     |
        'h4: seven_segments = 'b1100110;  //  f     b
        'h5: seven_segments = 'b1101101;  //  |     |
        'h6: seven_segments = 'b1111101;  //   --g--
        'h7: seven_segments = 'b0000111;  //  |     |
        'h8: seven_segments = 'b1111111;  //  e     c
        'h9: seven_segments = 'b1100111;  //  |     |
        'ha: seven_segments = 'b1110111;  //   --d-- 
        'hb: seven_segments = 'b1111100;
        'hc: seven_segments = 'b0111001;
        'hd: seven_segments = 'b1011110;
        'he: seven_segments = 'b1111001;
        'hf: seven_segments = 'b1110001;
        endcase

endmodule