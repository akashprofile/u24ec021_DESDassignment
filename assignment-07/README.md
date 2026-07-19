# Assigment

You have to build an ALU with an associated register file and control mechanisms. The input will be an instruction in the following format:

`{opcode, source reg 1, source reg 2, immediate}`.

Generally the input will not contain the operands, instead it contains the address of registers containing the 2 operands. The required operations the ALU should perform are:

|Operation|Opcode name|Opcode|
|---|---|---|
|Addition|`ADD`|`00001`|
|Addition Immediate|`ADDI`|`10001`|
|Subtraction|`SUB`|`00010`|
|Subtraction Immediate|`SUBI`|`10010`|
|Bitwise AND|`AND`|`00011`|
|Bitwise AND Immediate|`ANDI`|`10011`|
|Bitwise OR|`OR`|`00100`|
|Bitwise OR Immediate|`ORI`|`10100`|
|Bitwise XOR|`XOR`|`00101`|
|Bitwise XOR Immediate|`XORI`|`10101`|
|Logical Left Shift|`LSHIFT`|`00110`|
|Logical Left Shift Immediate|`LSHIFTI`|`10110`|
|Logical Right Shift|`RSHIFT`|`00111`|
|Logical Right Shift Immediate|`RSHIFTI`|`10111`|
|Arithmetic Right Shift|`ARSHIFT`|`01000`|
|Arithmetic Right Shift Immediate|`ARSHIFTI`|`11000`|
|Two's Complement Negation|`NEG`|`01001`|
|Idle / No Operation|`IDLE`|`00000`|

**NOTE**: Observing the reuirements I used structure my intruction as `{opcode [20:16], source reg 1 [15:12], source reg 2 [11:8], immediate [7:0]}`.

For now, all operations have to be performed in a single cycle by the ALU. Note that out of these, negations (e.g converting 4 to -4 or -5 to 5) is the only operation that only requires 1 operand. The add, sub, left shift, right shift and arithmetic right shift operations should have **2 variants**: first variant, e.g 'add' where the operands in the 2 source registers are added, and 2nd variant such as 'add immediate' or 'addi' should perform the operation between the operand in source register 1 and the immediate value supplied with the instruction. the immediate value will be an 8 bit signed integer. Of course, to implement this, you will need to select whether you are taking the input of the ALU from the register file or the immediate value based on the instruction.

**All operands in the register file have to be 32bit**. This means your ALU will be 32 bit. This also means that you have to sign extend the 8 bit immediate value into 32 bits before using it in the ALU.

A total of **16 registers must be present in the register file**.

Note that for this assignment, you are not writing the result of the ALU back to anywhere, you can directly provide the output. Also creating a program memory for the input instructions is also not needed at this stage, input instructions can be directly given through the testbench.

Based on the above instructions, you have to work out the opcode size, register address size and so on.

```plain
$ iverilog -o sim.vvp design.v tb.v && vvp sim.vvp
ADD >>> instruction: 000010000000110001000
srcReg1 content :       65535
srcReg2 content :      -65536
result          :          -1

ADDI >>> instruction: 100010000000110001000
srcReg1 content :       65535
signExtendedImm8:        -120
result          :       65415

SUB >>> instruction: 000100000000110001000
srcReg1 content :       65535
srcReg2 content :      -65536
result          :      131071

SUBI >>> instruction: 100100000000110001000
srcReg1 content :       65535
signExtendedImm8:        -120
result          :       65655

AND >>> instruction: 000110010001110001000
srcReg1 content : 11110000000000001111111111111111
srcReg2 content : 11111111111111110000000000001111
result          : 11110000000000000000000000001111

ANDI >>> instruction: 100110010001100001111
srcReg1 content : 11110000000000001111111111111111
zeroFilledImm8  : 00000000000000000000000000001111
result          : 00000000000000000000000000001111

OR >>> instruction: 001000010001110001000
srcReg1 content : 11110000000000001111111111111111
srcReg2 content : 11111111111111110000000000001111
result          : 11111111111111111111111111111111

ORI >>> instruction: 101000010001100001111
srcReg1 content : 11110000000000001111111111111111
zeroFilledImm8  : 00000000000000000000000000001111
result          : 11110000000000001111111111111111

XOR >>> instruction: 001010010001110001000
srcReg1 content : 11110000000000001111111111111111
srcReg2 content : 11111111111111110000000000001111
result          : 00001111111111111111111111110000

XORI >>> instruction: 101010010001100001111
srcReg1 content : 11110000000000001111111111111111
zeroFilledImm8  : 00000000000000000000000000001111
result          : 11110000000000001111111111110000

LSHIFT >>> instruction: 001100100011010001000
srcReg1 content : 00000000000000000000000000001111
srcReg2 content :                                4
result          : 00000000000000000000000011110000

LSHIFTI >>> instruction: 101100100001100000011
srcReg1 content : 00000000000000000000000000001111
zeroFilledImm8  :                                3
result          : 00000000000000000000000001111000

RSHIFT >>> instruction: 001110101011010001000
srcReg1 content : 11110000000000000000000000000000
srcReg2 content :                                4
result          : 00001111000000000000000000000000

RSHIFTI >>> instruction: 101110101011000000011
srcReg1 content : 11110000000000000000000000000000
zeroFilledImm8  :                                3
result          : 00011110000000000000000000000000

ARSHIFT >>> instruction: 010000101011010001000
srcReg1 content : 11110000000000000000000000000000
srcReg2 content :                                4
result          : 11111111000000000000000000000000

ARSHIFTI >>> instruction: 110000101011000000011
srcReg1 content : 11110000000000000000000000000000
zeroFilledImm8  :                                3
result          : 11111110000000000000000000000000

NEG >>> instruction: 010010000011000000011
srcReg1 content :       65535
result          :      -65535

tb.v:190: $finish called at 1670 (100ps)
```