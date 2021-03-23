`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:12 03/23/2015 
// Design Name:    Zezhong Wang
// Module Name:    ALUMUX 
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

module ALUMUX(
    r_data2,
    ext_result,
    data_in2,
    ALUSrc
);
  
  input [31:0] r_data2;
  input [31:0] ext_result;
  input ALUSrc;
  output reg [31:0] data_in2;
  
  always @(ALUSrc, r_data2, ext_result)
    begin
      if(ALUSrc == 0)
        data_in2 <= r_data2;
      else if(ALUSrc == 1)
        data_in2 <= ext_result;
    end
endmodule
