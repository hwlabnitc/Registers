module shiftregister_SISO #(parameter width=8)(clk,rst,sline,in,out);
input clk,rst,sline,in;
output reg out;    //serial out output.
reg [width-1:0]k;    //Register
initial k='b0;     //Initially register contents are set to 0.
always @(posedge clk)
begin
	if(rst==1'b1)
	begin
		k<='b0;
		out<='b0;
	end
	else if(sline==1'b0)    //sline==0 indicates left shift.
	begin
		out<=k[width-1];
		k<={k[width-2:0],in};
	end
	else if(sline==1'b1)    //sline==1 indicates right shift.
	begin
		out<=k[0];
		k<={in,k[width-1:1]};
	end
end
endmodule 
		
		