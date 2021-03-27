`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:29 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    MUXtoPC 
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

module MUXtoPC(pc_out, add_out, and_out, pc_in);
  input [31:0] pc_out;
  input [31:0] add_out;
  input and_out;
  output reg [31:0] pc_in;
  
  always @(and_out,pc_out,add_out)
    begin
      if(and_out == 1)
        pc_in <= add_out;
      else if(and_out == 0)
        pc_in <= pc_out;
    end
endmodule
