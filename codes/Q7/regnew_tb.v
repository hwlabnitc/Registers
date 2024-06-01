module regnew_tb #(parameter width=8);
reg clk,rst,en;
reg [width-1:0] in1,in2;
wire [width-1:0] out;
regnew uut(clk,rst,en,in1,in2,out);
integer i;
initial clk=0;
initial begin
for(i=0;i<10;i=i+1)
begin
	clk=~clk;
	#5;
end
end
initial begin
	rst=1'b0;
	en=1'b1;
	in1=8'b10011101;
	in2=8'b10111100;
	#10;
	
	en=1'b0;
	in1=8'b10001101;
	in2=8'b00110001;
	#10;
	
	en=1'b1;
	in1=8'b10011111;
	in2=8'b11111101;
	#10;
	
	en=1'b0;
	in1=8'b10000001;
	in2=8'b10110001;
	#10;
	
	en=1'b1;
	in1=8'b10101101;
	in2=8'b00100001;
	#10;
end
endmodule 