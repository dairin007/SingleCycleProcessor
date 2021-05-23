`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/04/09 11:06:11
// Design Name:
// Module Name: PC
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


module PC(
    clk,rst,Jump,Zero,Branch,ExtendSign,Inst
    );
    input clk,rst,Jump,Zero,Branch;
    input [31:0] ExtendSign;
    output [31:0] Inst;

	reg [31:0] PC=32'b0;
	wire [31:0] PCOut;
	wire [27:0] ShiftInst;
	wire [31:0] FAOut,ALUOut;
	wire [31:0] ShiftExtendSign;
	wire [31:0] JampAdd;
	wire [31:0] MUX2_0;
	wire [31:0] ToPC;
	wire ZeroBranch;
	assign ZeroBranch=Zero&Branch;

	assign PCOut=PC;
	FA32 fa1(PCOut,32'd4,FAOut);
	INST_MEM inst_mem(PCOut,Inst);
	assign ShiftInst={Inst[25:0],2'b00};
	L2SHIFT l2shift(ExtendSign,ShiftExtendSign);
	assign JampAdd={FAOut[31:28],ShiftInst[27:0]};
	FA32 fa2(FAOut,ShiftExtendSign,ALUOut);
	MUX32b mux1(ZeroBranch,FAOut,ALUOut,MUX2_0);
	MUX32b mux2(Jump,MUX2_0,JampAdd,ToPC);

	always @(posedge clk) begin
		PC<=(rst==1)?32'b0:ToPC;
	end
endmodule
