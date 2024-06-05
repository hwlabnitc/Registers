module reg_file(input clk, rst, input [1:0] rw1w2, input [2:0] write_add_1, input [2:0]
write_add_2, input [2:0] read_add, input [7:0] write_data_1, input [7:0] write_data_2, output
reg [7:0] read_data);
 parameter WIDTH=8;
 reg [WIDTH-1:0] block[WIDTH-1:0];
 always@(posedge clk) begin
 // rw1w2- 0: read case
 // rw1w2- 1: write1 case
 // rw1w2- 2: write2 case
 // rw1w2- 3: write1 & write2 case
 if(rst==0) begin
 read_data <= 0;
 end
 else if(rw1w2 == 0) begin // read
 read_data <= block[read_add];
 end
 else if(rw1w2 == 1) begin // write1
 block[write_add_1] <= write_data_1;
 end
 else if(rw1w2 == 2) begin // write2
 block[write_add_2] <= write_data_2;

 end
 else begin
 if (write_add_1 == write_add_2) block[write_add_1] <= write_data_1;
 else begin
 block[write_add_1] <= write_data_1;
 block[write_add_2] <= write_data_2;
 end
 end
 end
 endmodule