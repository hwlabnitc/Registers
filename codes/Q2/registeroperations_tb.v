module registeroperations_tb #(parameter width=8);
reg clk,rst,r_en,w_en;
reg [width-1:0] in;
wire [width-1:0] out;
registeroperations uut(clk,rst,r_en,w_en,in,out);
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
	rst=1'b1;
	r_en=1'b1;
	w_en=1'b1;
	in=8'b10011101;
	#10;
	
	rst=1'b0;
	r_en=1'b1;
	w_en=1'b0;
	in=8'b10001101;
	#10;
	
	r_en=1'b0;
	w_en=1'b1;
	in=8'b10011111;
	#10;
	
	r_en=1'b1;
	w_en=1'b1;
	in=8'b11011101;
	#10;
	
	r_en=1'b0;
	w_en=1'b1;
	in=8'b10111101;
	#10;
end
endmodule 