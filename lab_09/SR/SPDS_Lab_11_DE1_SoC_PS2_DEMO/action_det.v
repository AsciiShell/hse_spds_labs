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
				
reg [6:0] lBs	=	7'b0100001;
reg [6:0] rBs	=	7'b0000011;
reg [6:0] mBs0	=	7'b0100000;
reg [6:0] mBs1	=	7'b0000010;
reg [6:0] wU	=	7'b1000001;
reg [6:0] wP	=	7'b0001100;
reg [6:0] wD	=	7'b1000000;
reg [6:0] wH	=	7'b0001001;
reg [6:0] wL	=	7'b1000111;
reg [6:0] wF	=	7'b0001110;
reg [6:0] wI	=	7'b0000110;
reg [6:0] non	=	7'b0111111;

reg [7:0] red_x_mov;
reg [7:0] red_y_mov;

reg [6:0] h0;
reg [6:0] h1;

assign HEX0 = ~h0;
assign HEX1 = ~h1;

reg	[6:0] rHEX2;
reg	[6:0] rHEX3;
reg	[6:0] rHEX4;
reg	[6:0] rHEX5;

assign HEX2 = rHEX2;
assign HEX3 = rHEX3;
assign HEX4 = rHEX4;
assign HEX5 = rHEX5;
				
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
	
//	h1 <= ~h1;
//	h0 <= ~h0;
	
	//Directions
	
	red_x_mov <= x_mov >> 4;
	red_y_mov <= y_mov >> 4;
	
	if (red_y_mov !== 8'b0)
	begin
		if (yD === 1'b1)
		begin
			rHEX3 <= wP;
			rHEX2 <= wI;
		end
		else
		begin
			rHEX3 <= wL;
			rHEX2 <= wF;
		end		
	end
	else
	begin
		rHEX3 <= non;
		rHEX2 <= non;
	end
	
	if (red_x_mov !== 8'b0)
	begin
		if (xD === 1'b1)
		begin
			rHEX5 <= wU;
			rHEX4 <= wP;
		end
		else
		begin
			rHEX5 <= wD;
			rHEX4 <= wH;
		end		
	end
	else
	begin
		rHEX5 <= non;
		rHEX4 <= non;
	end
end
endmodule