`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:12 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    ALUAdd.v 
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

module ALUAdd(pc_out, slout, add_out);
  input [31:0] pc_out;
  input [31:0] slout;
  output reg [31:0] add_out;
  always @(pc_out, slout)
    begin
      add_out <= pc_out + slout;
    end
endmodule
