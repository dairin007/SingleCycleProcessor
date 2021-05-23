`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 11:07:44
// Design Name: 
// Module Name: MUX32b_tb
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


module MUX32b_tb();
    reg [31:0] a,b;
    reg ctl;
    wire [31:0] out;
    MUX32b mux32b(ctl,a,b,out);
    
    initial begin
        a<=32'hf0f0f0f0;
        b<=32'h0f0f0f0f;

        ctl<=0;
        #50
        ctl<=1;
        #50
        ctl<=0;
        #50
        $finish;
    end
endmodule
