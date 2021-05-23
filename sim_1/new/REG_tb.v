`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/06 11:55:49
// Design Name: 
// Module Name: REG_tb
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


module REG_tb();
    reg clk=1,RegWrite;
    reg [5:0] Read1,Read2,WriteReg;
    reg [31:0] WriteData;
    wire [31:0] Data1,Data2;

    REGISTER register(clk,RegWrite,Read1,Read2,WriteReg,WriteData,Data1,Data2);

    initial begin
    $finish;
    end
    
    always #50 begin
        clk=~clk;
    end
endmodule
