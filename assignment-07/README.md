# Assigment

You have to build an ALU with an associated register file and control mechanisms. The input will be an instruction in the following format:

`{opcode, source reg 1, source reg 2, immediate}`.

Generally the input will not contain the operands, instead it contains the address of registers containing the 2 operands. The required operations the ALU should perform are: Addition, Subtraction, Negation, Bitwise AND, Bitwise OR, Bitwise XOR, left shift, right shift and arithmetic right shift. for now, all operations have to be performed in a single cycle by the ALU. Note that out of these, negations (e.g converting 4 to -4 or -5 to 5) is the only operation that only requires 1 operand. The add, sub, left shift, right shift and arithmetic right shift operations should have 2 variants: first variant, e.g 'add' where the operands in the 2 source registers are added, and 2nd variant such as 'add immediate' or 'addi' should perform the operation between the operand in source register 1 and the immediate value supplied with the instruction. the immediate value will be an 8 bit signed integer. Of course, to implement this, you will need to select whether you are taking the input of the ALU from the register file or the immediate value based on the instruction.

All operands in the register file have to be 32bit. This means your ALU will be 32 bit. This also means that you have to sign extend the 8 bit immediate value into 32 bits before using it in the ALU.

A total of 16 registers must be present in the register file.

Note that for this assignment, you are not writing the result of the ALU back to anywhere, you can directly provide the output. Also creating a program memory for the input instructions is also not needed at this stage, input instructions can be directly given through the testbench.

Based on the above instructions, you have to work out the opcode size, register address size and so on.

```plain
$ iverilog -o sim.vvp design.v tb.v && vvp sim.vvp
ADD:   0000ffff  +  ffff0000  =  ffffffff
tb.v:53: $finish called at 170 (100ps)
```