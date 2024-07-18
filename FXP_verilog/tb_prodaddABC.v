`timescale 1ns/1ns
module tb_prodaddABC();

reg signed clk_tb, rst_tb;
reg signed [2:-3] A_tb;
reg signed [0:-5] B_tb;
reg signed [4:-5] C_tb;

wire signed [4:-5] AB_tb;
wire signed [4:-2] ABC_tb;


prodAB PROD(
	.clk	(clk_tb), 
	.rst	(rst_tb),
	.A		(A_tb),
	.B		(B_tb),

	.AB_out(AB_tb)
);

addABC SUM(
	.clk	(clk_tb), 
	.rst	(rst_tb),
	.C		(C_tb),
	.AB	(AB_tb),

	.ABC_out	(ABC_tb)
);

initial begin
	clk_tb = 1'b0;
	rst_tb = 1'b0;
	A_tb = 6'b011101;
	B_tb = 6'b001001;
	C_tb = 10'b0110100110;
	#3;
	rst_tb = 1'b1;
	#25;
	B_tb = 6'b111101;
	#25 $stop;
end

always #1 clk_tb = ~clk_tb;

endmodule
