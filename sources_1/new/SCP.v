`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/08 11:23:12
// Design Name: 
// Module Name: SCP
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


module SCP(
    clk,rst
    );
    input clk,rst;

    wire RegDst,Jump,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Zero;
    wire [31:0] Inst,WriteDataR,Data1,Data2,ExtendSign,ALUIn,ALUOut,ReadDataM;
    wire [1:0] ALUOp;
    wire [3:0] ALUCtl;

    PC PC(clk,rst,Jump,Zero,Branch,ExtendSign,Inst);
    MAINCTL mainctl(Inst[31:26],RegDst,Jump,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);
    REGISTER regi(clk,RegWrite,RegDst,Inst[25:21],Inst[20:16],Inst[15:11],WriteDataR,Data1,Data2);
    SIGNEX signex(Inst[15:0],ExtendSign);
    ALUCTL aluctl(ALUOp,Inst[5:0],ALUCtl);
    MUX32b mux1(ALUSrc,Data2,ExtendSign,ALUIn);
    ALU32 alu32(ALUCtl,Data1,ALUIn,ALUOut,Zero);
    DATAMEM datamem(clk,MemWrite,MemRead,ALUOut,Data2,ReadDataM);
    MUX32b mux2(MemtoReg,ALUOut,ReadDataM,WriteDataR);

endmodule
