//single register with one read port and two write ports.only one operation either read or write can be performed at same time.
//When write operation is to be done register wire is once done with first write port and next time with the other write port alternatively.
module regnew #(parameter w=8)(clk,rst,en,in1,in2,out);
input clk,rst,en;
input [w-1:0] in1,in2;
output reg [w-1:0] out;
reg [w-1:-0] k;
reg f1;
reg f2;
initial f1=1'b1;
initial f2=1'b0;
always @(posedge clk)
begin
	if(rst==1)
	begin
		k<=0;
		out<='bx;
	end
	else if(en==0) //en==0 indicates read operation.
	begin
		out<=k;
		k<=k;
	end
	else if(en==1)
	begin
		if(f1==1 && f2==0)
		begin
			k<=in1;
			out<='bx;
			f1=0;
			f2=1;
		end
		else if(f1==0 && f2==1)
		begin
			k<=in2;
			out<='bx;
			f1=1;
			f2=0;
		end
	end
end
endmodule
