module regfile3(clk,read,write,read_port_1,read_port_2,read_port_3,read_port_4,write_port_1,write_port_2,in1,in2,out);
input clk;
input [3:0] read;
input [1:0] write;
input [4:0] read_port_1,read_port_2,read_port_3,read_port_4,write_port_1,write_port_2;
// lower port with higher priority
input [63:0] in1,in2;
output reg [63:0] out;
reg [63:0] k [31:0];
always @(posedge clk)
begin
	if(read[0]==1)
	begin
		out<=k[read_port_1];
	end
	else if(read[1]==1)
	begin
		out<=k[read_port_2];
	end
	else if(read[2]==1)
	begin
		out<=k[read_port_3];
	end
	else if(read[3]==1)
	begin
		out<=k[read_port_4];
	end
	else if(write[0]==1)
	begin
		k[write_port_1]<=in1;
		out<='bx;
	end
	else if(write[1]==1)
	begin
		k[write_port_2]<=in2;
		out<='bx;
	end
end
endmodule
