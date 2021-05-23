`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 15:07:16
// Design Name: 
// Module Name: L2SHIFT
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


module L2SHIFT1(
    in,out
    );
    
    input wire [25:0] in;
    output wire [27:0] out;
    
    assign out={in,2'b00};
endmodule
