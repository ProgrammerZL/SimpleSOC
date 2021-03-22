`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:00 03/22/2015 
// Design Name:    Zezhong Wang
// Module Name:    Data Memory 
// Project Name:   Simple Cycle Datapath
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
module Data_Memory(
    clk,
    Addr,
    input_data,
    output_data,
    mem_read,
    mem_write,
);
  
  input           clk;
  input   [31:0]  Addr;
  input   [31:0]  input_data;
  input           mem_read;
  input           mem_write;
  
  output  [31:0]  output_data;
  
  // define a 32 byte address memory
  integer i;
  parameter SIZE = 32;
  
  // memory store a byte which means 8 bits
  reg      [7:0] memory [SIZE - 1 : 0];
  
  initial begin
    for(i = 0; i < 32; i++) begin
      memory[i] = 8'b0;
    end
  end
  
  // Write data
  always @(posedge clk)
    begin
      if(mem_wirte == 1)
        begin
          memory[Addr*4]    <=  input_data[7:0];
          memory[Addr*4+1]  <=  input_data[15:8];
          memory[Addr*4+2]  <=  input_data[23:16];
          memory[Addr*4+3]  <=  input_data[31:24];
        end
    end
  
  // Read Data
  always @(negedge clk)
    begin
      if(mem_read == 1)
        begin
          output_data[7:0]    <=  memory[Addr*4];
          output_data[15:8]   <=  memory[Addr*4+1];
          output_data[23:16]  <=  memory[Addr*4+2];
          output_data[31:24]  <=  memory[Addr*4+3];
        end
    end
endmodule
  
  
