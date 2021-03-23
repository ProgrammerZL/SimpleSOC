`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:28 03/22/2021 
// Design Name:    Zezhong Wang
// Module Name:    IM 
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

module I_M(clk, r_addr, instr);
    
    input   clk;
    input       [31:0]  r_addr;
    output  reg [31:0]  instr;
    // Instruction memory is byte addressable, which include 256 32-bit words
    reg [31:0]  memory [0 : 255];
 
    
    // Load Instruction
    initial begin
        $readmemb("instruction.txt", memory);
    end
  
    assign instr = memory[r_addr>>2];
  
endmodule
