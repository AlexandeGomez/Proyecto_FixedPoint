`timescale 1ns/1ns
module tb_design();

reg clk_tb, rst_tb;
reg signed [2:-3] A_tb;
reg signed [0:-5] B_tb;
reg signed [4:-5] C_tb;

wire signed [4:-5] AB_tb;
wire signed [4:-2] ABC_tb;

//------------------------------------------------
reg [5:0] MEM [0:15];
integer i;

top_design DUT(
	.clk_top	(clk_tb), 
	.rst_top	(rst_tb),
	.A_top	(A_tb),
	.B_top	(B_tb),
	.C_top	(C_tb),

	.AB_top	(AB_tb),
	.ABC_top	(ABC_tb)
);

//--------------------------------------------------

initial begin
	$readmemb("datacoseno.txt", MEM);
	clk_tb = 1'b0;
	rst_tb = 1'b0;
	A_tb = 6'b011101;
	C_tb = 10'b0110100110;
	#1 rst_tb = 1'b1;

	for(i=0 ; i<15 ; i=i+1) begin
		B_tb <= MEM[i];
		#50;
	end
	#250 $stop;
end


always #1 clk_tb = ~clk_tb;

endmodule
