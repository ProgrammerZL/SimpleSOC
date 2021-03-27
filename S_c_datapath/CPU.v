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
            .ALUOp(aluctrl);
            // output
            .Zero(Zero),
            .ALUOutput(ALUOutput)
      );
      
      // Connect to ALUCtrl
      output wire [3:0] ALUCtrl;
      ALUCtrl aluctrl_0(
            .aluop(aluop),
            .opfield(instr[5:0])
            //
            .aluctrl(aluctrl)
      );
      
      // Connect to ALUAdd
      output wire [31:0] add_out;
      ALUAdd aluadd(
            .pc_out(pc_out),
            .slout(slout),
            //
            .add_out(add_out)
      );

      // Connect to Sign Extend
      output wire [31:0] ext_result;
      SE se_0(
            .instr(instr[15:0]),
            //output
            .ext_result(ext_result)
      );
      
      // Connect to Shift Logic
      output wire [31:0] slout;
      SL sl_0(
            .ext_result(ext_result),
            // output
            .slout(slout)
      );
      
      // Connect to ALU MUX
      output wire [31:0] data_in2;
      ALUMUX alumux_0(
            .r_data2(r_data2),
            .ALUSrc(ALUSrc),
            .ext_result(ext_result),
            // output
            .data_in2(data_in2)
      );
      
      // Connect to AND Gate
      output wire and_out;
      ANDGate andgate_0(
            .Branch(Branch),
            .Zero(Zero),
            //
            and_out
      );
      
      // Connect to DM
      output wire [31:0] r_data;
      DM dm_0(
            .clk(clk),
            .addr(ALUOutput),
            .r_mem(MemRead),
            .w_mem(MemWrite),
            .dm_w_data(r_data2),
            //
            .r_data(r_data)
      );
      
      // Connect to Memory MUX
      output wire [31:0] w_data;
      MemMUX memmux_0(
            .r_data(r_data),
            .ALUOutput(ALUOutput),
            .MemtoReg(MemtoReg),
            //
            .w_data(w_data)
      );
      
      // Connect to MUXtoPC
      output wire [31:0] pc_in;
      MUXtoPC muxtopc_0(
            .pc_out(pc_out),
            .add_out(add_out),
            .and_out(and_out),
            //
            .pc_in(pc_in)
      );
      
      // Connect to MainCtrl
      output wire RegDst, Branch, MemRead, RegWrite;
      output wire MemtoReg, ALUSrc, MemWrite;
      output wire [1:0] ALUOp;
      MainCtrl mainctrl_0(
            .Opcode(instr[31:26]),
            //
            .RegDst(RegDst),
            .Branch(Branch),
            .MemRead(MemRead),
            .MemtoReg(MemtoReg),
            .ALUOp(ALUOp),
            .MemWrite(MemWrite),
            .ALUSrc(ALUSrc),
            .RegWrite(RegWrite)
      );
