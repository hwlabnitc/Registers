module shiftregister_PISO #(parameter width=8)(clk,load,in,out);
input clk,load;
input [width-1:0] in;
output reg out;    //serial out output.
reg [width-1:0]k;    //Register
initial k='b0;     //Initially register contents are set to 0.
always @(posedge clk)
begin
	if(load)
	begin
		k<=in;
	end
	else 
	begin
		out<=k[width-1];
		k<={k[width-2:0],1'b0};
	end
end
endmodule 
		
		