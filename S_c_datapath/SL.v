`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:12 03/23/2015 
// Design Name:    Zezhong Wang
// Module Name:    SL 
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

module SL(ext_reult,slout);
  input [31:0] ext_result;
  output reg [31:0] slout;
  
  always@(*)
    begin
      slout <= (ext_result << 2);
    end
endmodule
  
