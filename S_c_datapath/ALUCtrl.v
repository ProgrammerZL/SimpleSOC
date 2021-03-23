`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:12 03/23/2015 
// Design Name:    Zezhong Wang
// Module Name:    ALUCtrl 
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

module ALUCtrl(
      ALUOp,
      OpField,
      ALUCtrl
);
  
  input [1:0]   ALUOp;
  input [10:0]  OpField;
  output reg [3:0]  ALUCtrl';
  
  always @(ALUOp or OpField)
    begin
      if(ALUOp == 2'b00)
        ALUCtrl <= 4'b0010; // Load and Store Used Type
      else if(ALUOp == 2'b01)
        ALUCtrl <= 4'b0111; // Branch Used Type
      else if(ALUOp == 2'b10)
        begin
          if(OpField == 11'b10001011000)
            ALUCtrl <= 4'b0010; // Add
          else if(OpField == 11'b11001011000)
            ALUCtrl <= 4'b0110; // Subtract
          else if(OpField == 11'b11001010000)
            ALUCtrl <= 4'b0000; // AND
          else if(OpField == 11'b10101010000)
            ALUCtrl <= 4'b0001; // OR
          else if(OpField == 11'b10001011001)
            ALUCtrl <= 4'b1100; // NOR
        end
    end
endmodule
          
