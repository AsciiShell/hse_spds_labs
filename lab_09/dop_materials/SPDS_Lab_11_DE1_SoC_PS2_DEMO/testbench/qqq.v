`timescale 1ns /100ps
 
module gray_cnt(
   input wire clk,
   input wire nreset,
  input wire wr,
  input wire [SIZE-1:0]d,
   output wire [SIZE-1:0]q
   );
parameter SIZE = 4;
 
integer i;
reg [SIZE-1:0]gray_cnt;
reg [SIZE-1:0]bin;
reg [SIZE-1:0]next_gray_cnt;
 
always @*
begin
  //convert gray-to-bin
  for (i=0; i<SIZE; i=i+1)
    bin[i] = ^(gray_cnt>>i);
  //increment binary
  bin=bin+1;
  //convert bin-to-gray
  next_gray_cnt = (bin>>1)^bin;
end
 
always @(posedge clk or negedge nreset)
  if(~nreset)
   gray_cnt <= 0;
  else
   if(~wr)
     begin
       gray_cnt <= d;
       $display("written %h",d);
     end
    else
    gray_cnt <= next_gray_cnt;
 
assign q=gray_cnt;
 
endmodule