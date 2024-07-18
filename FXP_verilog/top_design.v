module top_design(
input clk_top, rst_top,
input signed [2:-3] A_top,
input signed [0:-5] B_top,
input signed [4:-5] C_top,

output signed [4:-5] AB_top,
output signed [4:-2] ABC_top
);



//------------------------------------------------

prodAB PROD(
	.clk	(clk_top), 
	.rst	(rst_top),
	.A		(A_top),
	.B		(B_top),

	.AB_out(AB_top)
);

addABC SUM(
	.clk	(clk_top), 
	.rst	(rst_top),
	.C		(C_top),
	.AB	(AB_top),

	.ABC_out	(ABC_top)
);

endmodule
