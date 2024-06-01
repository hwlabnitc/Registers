module dfflop(d,clk,q);
	input [3:0] d;
	input clk;
	output reg[3:0] q;
	initial q=4'b0;
	integer i;
	always @(posedge clk)
	begin
		for(i=0;i<4;i=i+1)
		begin
			q[i]<=d[i];
		end
	end
endmodule 

module register(A,clk,rst,q);
input [3:0] A;
input clk,rst;
output wire [3:0] q;
reg [3:0] d;
initial d=0;
integer i;
dfflop df(d,clk,q);
always @(posedge clk)
begin	
	if(rst==1'b1)
	begin
		for(i=0;i<4;i=i+1)
		begin
			d[i]<=1'b0;
		end
	end
	else
	begin
		for(i=0;i<4;i=i+1)
		begin
			d[i]<=A[i];
		end
	end
end
endmodule 