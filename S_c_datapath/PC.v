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
    input_pc,
    output_pc,
    rst_n
);
  
  reg   [31:0]  output_pc;
  
  always @(posedge clk or negedge rst_n)
    begin
      if(~rst_n == 1)
        begin
          output_pc <= 32'b0;
        end
      else
        begin
          output_pc <= input_pc;
        end
    end
endmodule
