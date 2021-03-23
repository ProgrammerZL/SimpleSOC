`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:39 03/22/2021 
// Design Name:    Zezhong Wang
// Module Name:    PC 
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

module PC(
    clk,
    pc_in,
    pc_out,
    rst_n
);
    input clk;
    input rst_n;
    input      [31:0]    pc_in;
    output reg [31:0]    pc_out;
   
  
  always @(posedge clk or negedge rst_n)
    begin
      if(~rst_n == 1)
          pc_out <= 32'b0;
      else
          pc_out <= pc_in + 4;
    end
endmodule
