`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:12 03/23/2021 
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
      aluop,
      opfield,
      aluctrl
);
  
      input [1:0]   aluop;
      input [5:0]   opfield
      output reg [3:0]  aluctrl;
  
      always @(aluop or opfield)
      begin
            if(aluop == 2'b00)
            aluctrl <= 4'b0010; // Load and Store Used Type
            else if(aluop == 2'b01)
            aluctrl <= 4'b0110; // Branch Used Type
            else if(aluop == 2'b10)
             begin
                   if(opfield == 6'b100100);
                        opfield <= 4'b0000; // AND
                   else if(opfield == 6'b100101)
                        aluctrl <= 4'b0001; // OR
                   else if(opfield == 6'b100000)
                        aluctrl <= 4'b0010; // ADD
                   else if(opfield == 6'b100010)
                        aluctrl <= 4'b0110; // SUBTRACT
                   else if(opfield == 6'b101010)
                        aluctrl <= 4'b0111; // SLT
                   else if(opfield == 6'b100111)
                        aluctrl <= 4'b1100;           
             end
      end
endmodule
