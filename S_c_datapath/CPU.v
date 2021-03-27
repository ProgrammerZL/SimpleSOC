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
  RegMUX regmux_0(
        .instr1(instr[20:16]),
        .instr2(instr[15:11]),
        .RegDst(RegDst),
        // output
        .w_reg(w_reg)
  );
  
 // Connect to Register File
 output wire [31:0] r_data1, r_data2;
 RegFile regfile_0(
       .clk(clk),
       .r_reg1(instr[25:21]),
       .r_reg2(instr[20:16]),
       .w_reg(w_reg),
       .w_data(w_data),
       .RegWrite(RegWrite),
       // output
       .r_data1(r_data1),
       .r_data2(r_data2)
 );

// Connect to ALU
      output wire [31:0] ALUOutput;
      output wire Zero;
      ALU alu_0(
            .data_in1(r_data1),
            .data_in2(data_in2),
            .ALUOp(ALUCtrl);
            // output
            .Zero(Zero),
            .ALUOutput(addr)
      );
// Connect to ALUCtrl
      output wire [3:0] ALUCtrl;
      ALUCtrl aluctrl_0(
            .ALUOp(ALUOp),
            .OpField(instr[5:0])
            //
            .ALUCtrl(ALUCtrl)
      );

      // Connect to 
