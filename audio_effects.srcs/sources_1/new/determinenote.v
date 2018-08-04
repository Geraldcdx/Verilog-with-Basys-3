`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2018 08:20:44 PM
// Design Name: 
// Module Name: determinenote
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


module determinenote(
    input pulse1,
    input pulse2,
    input [7:0]key,
    input clock_20khz,
    output reg [11:0]clock=0
    );
    reg [7:0]value=0;
    reg [6:0]count=0;
    reg [5:0]x=17;
    reg [5:0]xcounter=0;
    reg [5:0]ycounter=0;
   
    always @ * begin
        case(key)
            8'b00000000:value=8'd0;
            8'b00000001:value=8'd37+x*xcounter-x*ycounter;
            8'b00000010:value=8'd33+x*xcounter-x*ycounter;
            8'b00000100:value=8'd29+x*xcounter-x*ycounter;
            8'b00001000:value=8'd28+x*xcounter-x*ycounter;
            8'b00010000:value=8'd25+x*xcounter-x*ycounter;
            8'b00100000:value=8'd22+x*xcounter-x*ycounter;
            8'b01000000:value=8'd20+x*xcounter-x*ycounter;
            8'b10000000:value=8'd19+x*xcounter-x*ycounter;
        endcase
     end
     
        always @(posedge pulse1) begin  
            xcounter=xcounter+1;
        end
        
        always @(posedge pulse2) begin
            ycounter=ycounter+1;
        end
        
        always @(posedge clock_20khz && value)begin
            count<=(count==value)? 0:(count+1);
            clock<=(count==0)?~clock:clock;    
        end
endmodule
