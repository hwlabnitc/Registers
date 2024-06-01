module regfile2(clk,read,write,read_port_1,read_port_2,write_port_1,in,out1,out2);
input clk,read,write;
input [2:0] read_port_1,read_port_2,write_port_1;
// read or write at once
input [7:0] in;
output reg [7:0] out1,out2;
reg [7:0] k [7:0];
always @(posedge clk)
begin
if(read==1)
begin
	out1<=k[read_port_1];
	out2<=k[read_port_2];
end
else if(read==0 && write==1)
begin
	k[write_port_1]<=in;
	out1<='bx;
	out2<='bx;
end
else
begin
	out1<='bx;
	out2<='bx;
end
end
endmodule
