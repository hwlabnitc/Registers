module shiftregister_PISO_tb #(parameter width=8);
reg clk,load;
reg [width-1:0] in;
wire out;
shiftregister_PISO uut(clk,load,in,out);
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
	load=1'b1;
	in=1;
	#10;
	
	load=1'b0;
	in=1;
	#10;
	
	load=1'b0;
	in=1;
	#10;
	
	load=1'b1;
	in=1;
	#10;
end
endmodule 
	