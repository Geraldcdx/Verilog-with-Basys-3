`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2018 09:32:40 PM
// Design Name: 
// Module Name: loop
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


module loop(
    input PLAY,
    input clk_write,
    input [11:0]data_in,
    output reg [11:0]data_out
    );
    
    reg [11:0] memory [0:35002];
    reg [15:0] i=0;
    reg [15:0] j=0;
    
    always @ (posedge clk_write) begin
        case(PLAY)
            0: begin
                    i=0; j=0;
                    data_out <= data_in; 
               end
            1: begin
                    memory[i] <= data_in;
                    data_out <= memory[j];
                    i <= (i == 35001) ? i : i+1;
                    j <= (j == 35000) ? 0 : j+1;
               end
         endcase
    end
    
endmodule
