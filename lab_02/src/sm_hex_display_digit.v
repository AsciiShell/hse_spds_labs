module sm_hex_display_digit
(
    input   [6:0] digit1,
    input   [6:0] digit2,
    input   [6:0] digit3,
    input       clkIn,
    output reg [11:0] seven_segments
);

    reg [9:0] count = 10'b0000000000;
    always @(posedge clkIn)
    begin
        case (count[9:8])
            2'b00: seven_segments = {1'b0, digit1[0], digit1[5], 2'b11, digit1[1], 1'b1, digit1[6], digit1[2], 1'b0, digit1[3], digit1[4]};
            2'b01: seven_segments = {1'b1, digit2[0], digit2[5], 2'b01, digit2[1], 1'b1, digit2[6], digit2[2], 1'b0, digit2[3], digit2[4]};
            2'b10: seven_segments = {1'b1, digit3[0], digit3[5], 2'b10, digit3[1], 1'b1, digit3[6], digit3[2], 1'b0, digit3[3], digit3[4]};
            default: count <= count + 1'b0;
        endcase
        count <= count + 1'b1;
    end
endmodule