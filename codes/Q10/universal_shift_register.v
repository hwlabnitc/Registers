module universal_shift_register(clk, rst, sline,inp, q);
input clk, rst;
input [1:0] sline;
input  [3:0] inp;
output [3:0] q;
reg [3:0] k;

always @(posedge clk)
begin
		if(rst==1'b1)
		begin
			k<=4'b0;
		end
		else if(sline==2'b00)
		begin
			k<=k;
		end
		else if(sline==2'b01)
		begin
			k<={k[2:0],inp[0]};
		end
		else if(sline==2'b10)
		begin
			k<={inp[3],k[3:1]};
		end
		else
		begin
			k<=inp;
		end
end 
assign q=k;
endmodule 