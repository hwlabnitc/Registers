module shiftregister_PIPO #(parameter width=8)(clk,rst,in,out);
input clk,rst;
input [width-1:0] in;
output reg [width-1:0]out;    //parallel out output.
reg [width-1:0]k;    //Register
initial k='b0;     //Initially register contents are set to 0.
always @(posedge clk)
begin
	if(rst==1'b1)
	begin
		k<='b0;
		out<='b0;
	end
	else   
	begin
		k<=in;
		out<=in;
	end
end
endmodule 
		
		