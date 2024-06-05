module shiftregister_SIPO_tb #(parameter width=8);
reg clk,rst,sline,in;
wire [width-1:0]out;
shiftregister_SIPO uut(clk,rst,sline,in,out);
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
	sline=0;
	in=1;
	#10;
	
	rst=0;
	sline=1;
	in=1;
	#10;
	
	sline=0;
	in=1;
	#10;
	
	sline=1;
	in=1;
	#10;
end
endmodule 
	