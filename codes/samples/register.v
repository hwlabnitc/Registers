module register(input clk, rst, rw, input [3:0] write_data, output [3:0] read_data);
 reg [3:0] block;
 always@(posedge clk) begin
 if(!rst) block <= 0;
 else begin
 if(rw==1) block <= write_data;
  else read_data <= block;
 end
 end
 endmodule