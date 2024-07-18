module prodAB(
input clk, rst,
input signed [2:-3] A,
input signed [0:-5] B,

output signed [4:-5] AB_out //truncar pero respetando el bit de signo
);

reg signed [3:-8] AB;

always@(posedge clk or negedge rst)
begin
	if(!rst)
		AB <= 12'd0;
	else
		AB <= A * B;
end

assign AB_out = {{2{AB[3]}}, AB[2:0], AB[-1:-5]};

endmodule
