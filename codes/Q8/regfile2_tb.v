module regfile2_tb;
reg clk,read,write;
reg [2:0] read_port_1,read_port_2,write_port_1;
reg [7:0] in;
wire [7:0] out1,out2;
regfile2 uut(clk,read,write,read_port_1,read_port_2,write_port_1,in,out1,out2);
integer i,j;
initial begin
clk=0;
for(i=0;i<1000;i=i+1)
begin
	clk=~clk;
	#5;
end
end
initial begin
for(j=0;j<500;j=j+1)
begin
read=$random;
write=$random;
read_port_1=$random;
read_port_2=$random;
write_port_1=$random;
in=$random;
#10;
end
end
endmodule
