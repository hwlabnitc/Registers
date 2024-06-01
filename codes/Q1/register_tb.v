module register_tb;
reg [3:0] A;
reg clk,rst;
wire [3:0] q;
register uut(A,clk,rst,q);
initial begin
	$monitor("clk=%b,rst=%b,A=%b,q=%b",clk,rst,A,q);
	clk=1'b1;
	rst=1'b0;
	A=4'b1111;
	#10;
	
	clk=1'b0;
	rst=1'b0;
	A=4'b0001;
	#10;
	
	clk=1'b1;
	rst=1'b1;
	A=4'b1101;
	#10;
	
	clk=1'b0;
	rst=1'b0;
	A=4'b1011;
	#10;
	
	clk=1'b1;
	rst=1'b0;
	A=4'b1000;
	#10;
end
endmodule 