 module dflfl(output reg op, input ip, input clk);
 always @(posedge clk) begin
 op <= ip;
 end
 endmodule

 module four_bit_reg(output reg [3:0] out, input [3:0] ip, input clk, input rw);
 reg [3:0]intermed;
 reg [3:0]temp;

 dflfl g1(temp[3], rw ? ip[3]:temp[3], clk);
 dflfl g2(temp[2], rw ? ip[2]:temp[2], clk);
 dflfl g3(temp[1], rw ? ip[1]:temp[1], clk);
 dflfl g4(temp[0], rw ? ip[0]:temp[0], clk);

 always @(*) begin
 if(rw==1'b1) intermed <= temp; // storing previous value in intermed
 end


 always @(posedge clk) begin
 if(rw==1'b1) out <= intermed; // if a write occurs then previously read value is displayed
 else out <= temp; // else in case of a read
 end
 endmodule