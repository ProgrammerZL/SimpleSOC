`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:20 03/22/2021 
// Design Name:    Zezhong Wang
// Module Name:    ALU 
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

module alu(
  data_in1, 
  data_in2, 
  ALUOp, 
  ALUOutput, 
  Zero
);
  
  input   [31:0]  data_in1;
  input   [31:0]  data_in2;
  input   [3:0]   ALUOp;
  
  output reg  [31:0]  ALUOutput;
  output  Zero;
  
  assign Zero = (ALUOutput == 0);
  
  always @(data_in1, data_in2, ALUOp) begin
    case (ALUOp)
      0:  ALUOutput <= data_in1 & data_in2;
      1:  ALUOutput <= data_in1 | data_in2;
      2:  ALUOutput <= data_in1 + data_in2;
      6:  ALUOutput <= data_in1 - data_in2;
      7:  ALUOutput <= data_in1 < data_in2 ? 1:0;
      12: ALUOutput <= ~(data_in1 | data_in2);
      default: ALUOutput <= 0;
    endcase
  end
endmodule
