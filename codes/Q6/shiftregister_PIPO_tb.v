module shiftregister_PIPO_tb #(parameter width=8);
reg clk,rst;
reg [width-1:0] in;
wire [width-1:0] out;
shiftregister_PIPO uut(clk,rst,in,out);
initial clk=0;
integer i;
initial begin
	for(i=0;i<8;i=i+1)
	begin
		clk=~clk;
		#5;
	end
end

initial begin
	rst=1;
	in=8'b10001101;
	#10;
	
	rst=0;
	in=8'b00010001;
	#10;
	
	in=8'b01100101;
	#10;
	
	in=8'b10110010;
	#10;
end
endmodule 
	