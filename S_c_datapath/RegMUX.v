`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:02 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    RegMUX 
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

module RegMUX(
    instr1,
    instr2,
    RegDst,
    w_reg
);
  
  input [20:16] instr1;
  input [15:11] instr2;
  input RegDst;
  output reg [4:0] w_reg;
  
  always @(RegDst, instr1, instr2)
    begin
      if(RegDst == 1)
        w_reg <= instr2;
      else if(RegDst == 0)
        w_reg <= instr1;
    end
endmodule
