`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:41 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    SE 
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

module SE(
    instr,
    ext_result
);
  
  input [15:0]  instr;
  output reg [31:0] ext_result;
  
  always @(instr)
    begin
      ext_result[31:0] <= instr[15:0];
    end
endmodule
