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
  input [5:0]  FunCode;
  output reg [3:0]  ALUCtrl;
  
  always @(ALUOp or FunCode)
    begin
      if(ALUOp == 2'b00)
        ALUCtrl <= 4'b0010; // Load and Store Used Type
      else if(ALUOp == 2'b01)
        ALUCtrl <= 4'b0110; // Branch Used Type
      else if(ALUOp == 2'b10)
        begin
              if(FunCode == 6'b100100);
                    ALUCtrl <= 4'b0000; // AND
              else if(FunCode == 6'b100101)
                    ALUCtrl <= 4'b0001; // OR
              else if(FunCode == 6'b100000)
                    ALUCtrl <= 4'b0010; // ADD
              else if(FunCode == 6'b100010)
                    ALUCtrl <= 4'b0110; // SUBTRACT
              else if(FunCode == 6'b101010)
                    ALUCtrl <= 4'b0111; // SLT
              else if(FunCode == 6'b100111)
                    ALUCtrl <= 4'b1100;           
        end
    end
endmodule
