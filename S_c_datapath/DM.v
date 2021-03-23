`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:00 03/22/2015 
// Design Name:    Zezhong Wang
// Module Name:    DM 
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

module DM(
    clk, 
    addr, 
    w_data, 
    r_data, 
    r_mem,
    w_mem
);
    
    input clk;
    input [31:0]    addr;
    input [31:0]    w_data;
    input r_mem;
    input w_mem;
    output [31:0]   r_data;
    
    // Data memory is byte-addressable.
    // I defined the memory with 32-bit width and 256 depth.
    // Because it's 32 bits width equal 4 bytes, the address will 
    // add 4 to jump to next address.
    reg    [31:0] memory [0:255];
    
    // Initial data memory
    integer i;
    initial begin
        for(i = 0; i < 255; i++) begin
            memory[i] <= 32'b0;
        end
    end
    
    // Write Data
    always @(posedge clk)
        begin
            if(w_mem == 1)
                memory[addr>>2] <= w_data;
        end
    
    always @(negedge clk)
        begin
            if(r_mem == 1)
                r_data  <= memory[addr>>2];
        end
endmodule
