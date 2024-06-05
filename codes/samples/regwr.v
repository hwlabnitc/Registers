module reg_wr(input clk, input rst, input rw, input [15:0] data1, data2, output reg [15:0]
read);
// perform writ1 & writ2 alternatively
 reg [15:0] block;
 reg track=0;
 always@(posedge clk) begin
 if(rst==0) begin // reset is active low
 read <= 0;
 end
 else if(rw==0) begin // write
 if(track==0) begin
 block <= data1;
 track <= 1;
 end
 else begin
 block <= data2;
 track <= 0;
 end
 end

 else begin // read
 read <= block;
 end
 end

 endmodule