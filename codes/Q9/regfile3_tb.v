module regfile3_tb;
reg clk;
reg [3:0] read;
reg [1:0] write;
reg [4:0] read_port_1,read_port_2,read_port_3,read_port_4,write_port_1,write_port_2;
reg [63:0] in1,in2;
wire [63:0] out;
regfile3 uut(clk,read,write,read_port_1,read_port_2,read_port_3,read_port_4,write_port_1,write_port_2,in1,in2,out);
integer i,j;
initial clk=0;
initial begin
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
	read_port_3=$random;
	read_port_4=$random;
	write_port_1=$random;
	write_port_2=$random;
	in1=$random;
	in2=$random;
	#10;
end
end
endmodule
