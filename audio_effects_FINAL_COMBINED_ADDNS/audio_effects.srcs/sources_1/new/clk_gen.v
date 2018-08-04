`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2018 14:58:34
// Design Name: 
// Module Name: clk_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_gen(
    input CLOCK,
    output reg clk_20k,
    output reg clk_50M,
    output reg clk_20hz
    );
    
     reg [11:0] count_20k = 0;
     reg [21:0] count_20hz = 0;
       
       initial begin
           clk_20k = 0;
           clk_50M = 0;
       end
       
       always @ (posedge CLOCK) begin
           count_20k <= (count_20k == 2499) ? 0 : count_20k + 1;
           count_20hz <= (count_20hz == 2499999) ? 0 : count_20hz + 1;
           clk_20k <= (count_20k == 0) ? ~clk_20k : clk_20k;
           clk_50M <= (count_20k[0] == 0) ? ~clk_50M : clk_50M;
           clk_20hz <= (count_20hz == 0) ? ~clk_20hz : clk_20hz;
       end
       
endmodule
