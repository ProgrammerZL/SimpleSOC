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
    r_reg1, 
    r_reg2, 
    w_reg, 
    w_data, 
    r_data1, 
    r_data2, 
    reg_write
);
    input clk;
    input reg_write;
    input [4:0] r_reg1;
    input [4:0] r_reg2;
    input [4:0] w_reg;
    input [31:0] w_data;
    output [31:0]   r_data1;
    output [31:0]   r_data2;
    
    reg [31:0] reg_mem [0:31];
    
    always @(posedge clk)
        begin
            if(reg_write)
                reg_mem[w_reg] <= w_data;
            if(r_reg1 == 5'b0)
                r_data1 <= 32'b0;
            else
                r_data1 <= reg_mem[r_reg1];
            if(r_reg2 == 5'b0)
                r_data2 <= 5'b0;
            else
                r_data2 <= reg_mem[r_reg2];
        end
endmodule
