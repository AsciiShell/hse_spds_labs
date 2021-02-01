module action_det(
					input	clk,
					input	lB,
					input	rB,
					input	mB,
					input	[7:0] x_mov,
					input	[7:0] y_mov,
					input	xD,
					input	yD,
					output	[6:0] HEX0,
					output	[6:0] HEX1,
					output	[6:0] HEX2,
					output	[6:0] HEX3,
					output	[6:0] HEX4,
					output	[6:0] HEX5
					);
		
dev_clk dev_clk(
				.clk(clk),
				.oclk(oclk)
				);
				
reg [6:0] lBs;
reg [6:0] rBs;
reg [6:0] mBs0;
reg [6:0] mBs1;
reg [6:0] wU;
reg [6:0] wP;
reg [6:0] wD;
reg [6:0] wH;
reg [6:0] wL;
reg [6:0] wF;
reg [6:0] wI;
reg [6:0] non;

wire [6:0] h0;
wire [6:0] h1;

wire [7:0] red_x_mov;
wire [7:0] red_y_mov;


assign lBs	=	7'b0100001;
assign rBs	=	7'b0000011;
assign mBs0	=	7'b0100000;
assign mBs1	=	7'b0000010;
assign wU	=	7'b1000001;
assign wP	=	7'b0001100;
assign wD	=	7'b1000000;
assign wH	=	7'b0001001;
assign wL	=	7'b1000111;
assign wF	=	7'b0001110;
assign wI	=	7'b0000110;
assign non	=	7'b0111111;

assign HEX0 = h0;
assign HEX1 = h1;

				
always @ (negedge(oclk))
begin

	//Buttons
	
	h0 <= 7'b0;
	h1 <= 7'b0;
	if (lB === 1'b1)
		h1 <= h1 + lBs;
	
	if (rB === 1'b1)
		h0 <= h0 + rBs;
		
	if (mB === 1'b1)
	begin
		h1 <= h1 + mBs1;
		h0 <= h0 + mBs0;
	end
	
	if (h1 === 7'b0 && h0 === 7'b0)
	begin
		h1 <= ~non;
		h0 <= ~non;
	end
	
	h1 <= ~h1;
	h0 <= ~h0;
	
	//Directions
	
	red_x_mov <= x_mov >> 4;
	red_y_mov <= y_mov >> 4;
	
	if (red_x_mov !== 8'b0)
	begin
		if (xD === 1'b1)
		begin
			HEX3 <= wP;
			HEX2 <= wI;
		end
		else
		begin
			HEX3 <= wL;
			HEX2 <= wF;
		end		
	end
	else
	begin
		HEX3 <= non;
		HEX2 <= non;
	end
	
	if (red_y_mov !== 8'b0)
	begin
		if (yD === 1'b1)
		begin
			HEX5 <= wU;
			HEX4 <= wP;
		end
		else
		begin
			HEX5 <= wD;
			HEX4 <= wH;
		end		
	end
	else
	begin
		HEX5 <= non;
		HEX4 <= non;
	end
end
endmodule