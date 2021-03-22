`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:57 03/22/2021 
// Design Name:    Zezhong Wang
// Module Name:    RegFile 
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

module RegFile(
    clk,
    reg1,
    reg2,
    write_reg,
    write_data,
    read_data1,
    read_data2,
    reg_write
);
  
  input           clk;
  input   [4:0]   reg1;
  input   [4:0]   reg2;
  input   [4:0]   write_reg;
  input   [31:0]  write_data;
  input           reg_write;
  output  reg [31:0]  read_data1;
  output  reg [31:0]  read_data2;
  
  reg     [31:0]  register  [0:31];
  
  // Read/Write Data
    always @(*)
        begin
            if(reg1 == 5'b000)
                read_data1 <= 32'b0;
            else
                read_data1 <= register[reg1];
            if(reg2 == 5'b000)
                read_data2 <= 32'b0;
            else
                read_data2 <= register[reg2];
            if(reg_write == 1)
                register[write_reg] <= write_data;
        end
endmodule
  
  
