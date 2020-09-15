/*
 * schoolMIPS - small MIPS CPU for "Young Russian Chip Architects" 
 *              summer school ( yrca@googlegroups.com )
 *
 * originally based on Sarah L. Harris MIPS CPU 
 * 
 * Copyright(c) 2017 Stanislav Zhelnio 
 *                   Aleksandr Romanov 
 */ 

//ALU commands
`define ALU_ADD     4'b0000
`define ALU_OR      4'b0001
`define ALU_LUI     4'b0010
`define ALU_SRL     4'b0011
`define ALU_SLTU    4'b0100
`define ALU_SUBU    4'b0101
`define ALU_XOR     4'b0110
`define ALU_NOR     4'b0111
`define ALU_SLL     4'b1000

//instruction operation code
`define C_SPEC      6'b000000 // Special instructions (depends on function field)
`define C_ADDIU     6'b001001 // I-type, Integer Add Immediate Unsigned
                              //         Rd = Rs + Immed
`define C_BEQ       6'b000100 // I-type, Branch On Equal
                              //         if (Rs == Rt) PC += (int)offset
`define C_LUI       6'b001111 // I-type, Load Upper Immediate
                              //         Rt = Immed << 16
`define C_BNE       6'b000101 // I-type, Branch on Not Equal
                              //         if (Rs != Rt) PC += (int)offset
`define C_J			6'b000010 // J-type, Jump
`define C_XORI      6'b001110 // I-type, xori

//instruction function field
`define F_ADDU      6'b100001 // R-type, Integer Add Unsigned
                              //         Rd = Rs + Rt
`define F_OR        6'b100101 // R-type, Logical OR
                              //         Rd = Rs | Rt
`define F_SRL       6'b000010 // R-type, Shift Right Logical
                              //         Rd = Rs∅ >> shift
`define F_SLTU      6'b101011 // R-type, Set on Less Than Unsigned
                              //         Rd = (Rs∅ < Rt∅) ? 1 : 0
`define F_SUBU      6'b100011 // R-type, Unsigned Subtract
                              //         Rd = Rs – Rt
`define F_SLLV      6'b000100 // shift left logical variable
`define F_NOR       6'b100111 // nor
`define F_ANY       6'b??????
