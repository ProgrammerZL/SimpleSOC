`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:32 03/27/2021 
// Design Name:    Zezhong Wang
// Module Name:    CPU.v 
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
module CPU(
      clk,
      rst_n,
      pc_in,
      pc_out,
      r_addr,
      instr,
      instr1,
      instr2,
      RegDst,
      w_reg,
     
  
);
  
  input clk;
  input rst_n;
  
// Connect to Program Counter
  output wire [31:0] pc_in, pc_out;
  PC pc_0(
    //input
    .clk(clk),
    .rst_n(rst_n),
    .pc_in(pc_in),
    //outputs
    .pc_out(pc_out)
  );
  
  // Connect to Instruction Memory
  output wire [31:0] instr;
  IM im_0(
      //input
    .clk(clk),
    .r_addr(pc_out),
    //output
    .instr(instr)
  );
  
  // Connect to RegMUX which is between Register File and Instruction Memory
  output wire [4:0] w_reg;
  RegMux
