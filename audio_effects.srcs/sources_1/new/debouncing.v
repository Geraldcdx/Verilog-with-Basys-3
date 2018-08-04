`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2018 05:59:41 PM
// Design Name: 
// Module Name: debouncing
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


module debouncing(
    input clk,
    input pb,
    output single_pulse
    );
    
    wire q1;
    wire q2;
    
    my_dff u1(clk, pb, q1);
    my_dff u2(clk, q1, q2);
    
    assign single_pulse = q1 & ~q2;
    
endmodule
