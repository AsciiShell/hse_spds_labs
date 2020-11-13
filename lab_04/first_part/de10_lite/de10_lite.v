

module de10_lite(

    input               ADC_CLK_10,
    input               MAX10_CLK1_50,
    input               MAX10_CLK2_50,

    output  [  7:0 ]    HEX0,
    output  [  7:0 ]    HEX1,
    output  [  7:0 ]    HEX2,
    output  [  7:0 ]    HEX3,
    output  [  7:0 ]    HEX4,
    output  [  7:0 ]    HEX5,

    input   [  1:0 ]    KEY,

    output  [  9:0 ]    LEDR,

    input   [  9:0 ]    SW,

    inout   [ 35:0 ]    GPIO
);

    // wires & inputs
    wire          clk;
    wire          clkIn     =  MAX10_CLK1_50;
    wire          rst_n     =  KEY[0];
    wire          clkEnable =  SW [9] | ~KEY[1];
    wire [  3:0 ] clkDevide =  SW [8:5];
    wire [  4:0 ] regAddr   =  SW [4:0];
    wire [ 31:0 ] regData;


endmodule
