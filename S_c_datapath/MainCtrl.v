`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:32 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    MainCtrl 
// Project Name:  
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module MainCtrl(
    Opcode,
    RegDst,
    Branch,
    MemRead,
    MemtoReg,
    ALUOp,
    MemWrite,
    ALUSrc,
    RegWrite
);
  
  input [5:0] Opcode;
  output reg RegDst;
  output reg Branch;
  output reg MemRead;
  output reg MemtoReg;
  output reg MemWrite;
  output reg ALUSrc;
  output reg RegWrite;
  output reg [1:0] ALUOp;
  
  always @(*)
    begin
      if(Opcode == 6'b000000) // R Type
        RegDst    <= 1;
        ALUSrc    <= 0;
        MemtoReg  <= 0;
        RegWrite  <= 1;
        MemRead   <= 0;
        MemWrite  <= 0;
        Branch    <= 0;
        ALUOp     <= 2'b10;
      else if(Opcode == 6'100011) // lw
        RegDst    <= 0;
        ALUSrc    <= 1;
        MemtoReg  <= 1;
        RegWrite  <= 1;
        MemRead   <= 1;
        MemWrite  <= 0;
        Branch    <= 0;
        ALUOp     <= 2'b00;
      else if(Opcode == 6'b101011) // sw
        RegDst    <= 0;
        ALUSrc    <= 1;
        MemtoReg  <= 0;
        RegWrite  <= 0;
        MemRead   <= 0;
        MemWrite  <= 1;
        Branch    <= 0;
        ALUOp     <= 2'b00;
      else if(Opcode == 6'b000100) // beq
        RegDst    <= 0;
        ALUSrc    <= 0;
        MemtoReg  <= 0;
        RegWrite  <= 0;
        MemRead   <= 0;
        MemWrite  <= 0;
        Branch    <= 1;
        ALUOp     <= 2'b01;
    end
endmodule
          
        
