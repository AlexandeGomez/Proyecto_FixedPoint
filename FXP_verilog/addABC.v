module addABC(
input clk, rst,
input signed [4:-5] C,
input signed [4:-5] AB,

output signed [4:-2] ABC_out
);

reg [5:-5] ABC;

always@(posedge clk, negedge rst)
begin
	if(!rst)
		ABC <= 11'd0;
	else
		ABC <= C + AB;
end

assign ABC_out = {ABC[5],ABC[4:0],ABC[-1]};

endmodule
