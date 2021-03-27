`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:26 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    MemMUX 
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

module MemMUX(
    r_data,
    ALUOutput,
    MemtoReg,
    w_data
);
  
  input [31:0] r_data;
  input [31:0] ALUOutput;
  input MemtoReg;
  output reg [31:0] w_data;
  
  always @(MemtoReg, r_data, ALUOutput)
    begin
      if(MemtoReg == 0)
        w_data <= ALUOutput;
      else if(MemtoReg == 1)
        w_data <= r_data;
    end
endmodule
