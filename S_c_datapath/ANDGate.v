`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:12 03/23/2021 
// Design Name:    Zezhong Wang
// Module Name:    ANDGate 
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

module ANDGate(Branch, Zero, and_out);
  
  input Branch;
  input Zero;
  output and_out;
  

  always @(*)
    begin
      and_out <= Branch && Zero;
    end
endmodule
