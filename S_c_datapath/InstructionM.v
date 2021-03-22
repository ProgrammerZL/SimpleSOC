`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:28 03/22/2021 
// Design Name:    Zezhong Wang
// Module Name:    InstructionM 
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

module I_M(
    Addr,
    instr
);
  
  input   [31:0]  Addr;
  output  [31:0]  instr;
  
  reg   [31:0]  memory [0 : 255];
  
  integer i;
  
  initial begin
    for(i = 0; i < 256; i++)  begin
      memory[i] = 32'b0;
    end
    
    // Load Instruction
    $readmemb("instruction.txt", memory);
  end
  
  assign instr = memory[addr>>2];
  
endmodule
