module universal_shift_register_tb;
reg clk, rst;
reg [1:0] sline;
reg [3:0] inp;
wire [3:0] q;
universal_shift_register uut(clk, rst, sline,inp, q);
always #5 clk=~clk;
initial begin
	clk=1'b1;
	rst=1'b0;
	sline=2'b11;
	inp=4'b1001;
	#10;
	
	sline=2'b01;
	inp=4'b1101;
	#10;
	
	sline=2'b00;
	inp=4'b0001;
	#10;
	
	sline=2'b10;
	inp=4'b1111;
	#10;
end
endmodule 