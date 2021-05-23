`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/05 17:13:10
// Design Name: 
// Module Name: MAINCTR
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


module MAINCTL(
    Inst31_26, RegDst,Jump,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop
    );
    input [5:0] Inst31_26;
    output RegDst,Jump,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
    output [1:0] ALUop;
    
    function [9:0]out;
        input [5:0]Inst31_26;
        begin
            case(Inst31_26)
                6'b000000:out=10'b10001000_10;
                6'b100011:out=10'b00111100_00;
                6'b101011:out=10'b00100010_00;
                6'b000100:out=10'b00000001_01;
                6'b000010:out=10'b01000000_00;
                default:  out=10'b00000000_00;
            endcase
        end
    endfunction
    assign {RegDst,Jump,ALUsrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop}=out(Inst31_26);
endmodule
