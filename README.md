# SimpleSOC
In this project, it' a test for build owner SOC. I will build it from a single cycle datapath(CPU), then I will try to enhance it through build multiple pipeline CPU, DSP module, flash watchdog and specify memory.
## Mission 1--Build Single Cycle Datapath.
In s_c_datapath folder. This Single cycle Datapath just a structure of CPU module and according to this simple module, I will extend it to multiple pipeline CPU.
### MainControl List
      R-format    lw    sw     beq
Op5       0        1     1      0
Op4       0        0     0      0
Op3       0        0     1      0
Op2       0        0     0      1
Op1       0        1     1      0
Op0       0        1     1      0
RegDst    1        0     x      x
ALUSrc    0        1     1      0
MemtoReg  0        1     x      x
RegWrite  1        1     0      0
MemRead   0        1     0      0
MemWrite  0        0     1      0
Branch    0        0     0      1
ALUOp1    1        0     0      0
ALUOp2    0        0     0      1
