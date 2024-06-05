//There is only single register on which both read and write operations can be done simultaneously and read is given more priority.

module registeroperations #(parameter width=8)(clk,rst,r_en,w_en,in,out);
input clk,rst,r_en,w_en;
input [width-1:0] in;
output reg [width-1:0] out;
reg [width-1:0] k;
initial k='b0;
always @(posedge clk)
begin
	if(rst==1'b1)
	begin
		k<='b0;
		out<='bx;
	end
	else if(r_en==1'b1)
	begin
		out<=k;
		if(w_en==1'b1)
		begin	
		k<=in;
		end
		else
		begin
			k<=k;
		end
	end
	else if(r_en==1'b0)
	begin
		out<='bx;
		if(w_en==1'b1)
		begin	
			k<=in;
		end
		else
		begin
			k<=k;
		end
	end
end
endmodule
	
	