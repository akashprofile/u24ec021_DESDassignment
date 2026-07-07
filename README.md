# Assigments List

## Assignment-01

1. Construct all logic gates (and, or, not, nand, nor, xor, xnor) by gate-level, dataflow, and behavioral-level modeling.
2. Implement 2-bit comparator by dataflow, behavioral-level, and structural modeling.
3. Implement 3-bit full adder by dataflow, behavioral-level, and structural modeling.
4. Implement 4-bit ripple carry adder by dataflow, behavioral-level, and structural modeling.
5. Create XOR gate using NAND gates only by behavioral, and structural modelling.


## Assignment-02

1. Decoder circuits (2x4, 3x8)
2. Encoder circuits (4x2, 8x3)
3. MUX (2x1, 4x1, Nx1)
4. DEMUX (1x2, 1x4, 1xN)
5. Priority encoder (8-bit binary to octal)
6. Gray encoder (8-bits input)
7. BCD encoder (8-bits output)
8. Basic logic gates using 2x1 MUX


## Assignment-03

1. 8x3 Encoder using functions and tasks
2. 16x1 MUX using functions and tasks
3. 3x8 Decoder using functions and tasks
4. 1x16 DeMUX using functions and tasks
5. 8-bit, 16-bit array multiplier
6. 8-bit, 32-bit Booth's Multiplier using combinational approach

## Assignment-04

Implement parameterized Verilog modules for:

* RCA (Ripple Carry Adder)
* CSKA (Carry Skip Adder)
* CSA (Carry Select Adder)
* CLA (Carry Look-Ahead Adder)

Test all designs for N = 16 bits and verify their functionality using a testbench.

## Assignment-05

1. Synchronous Ring Counter
2. Switch Tail Counter (Johnson Counter)
3. Synchronous Up / Down Counter
4. Asynchronous Up / Down Counter
5. Serial In-Serial Out Register
6. Parallel In-Serial Out Register
7. Serial In-Parallel Out Register
8. Left Shift / Right Shift Register with Control
9. Counter which counts the sequence 1, 32, 62, 128 structural modelling only (using basic gates, no behavioral code)
10. BCD Counter with structural modelling (no behavioral code)
11. Button debounder (button should be pressed for 10ms at 100 Mhz clock to register)

## Assignment-06

1. Design a FSM to detect more than one 1s in the last 3 samples
```
i/p: 0 1 0 1 0 1 1 0 0 1
o/p: 0 0 0 1 0 1 1 1 0 0  
```
2. Design FSM for a pattern matching block: Output is asserted 1 if pattern `101` is detected in the last 4 inputs.
```
i/p: 0 1 0 0 1 0 0 1 1 0 1 0 1 0
o/p: 0 0 0 1 1 0 0 0 0 0 1 1 1 1
```
3. Design an FSM which gives o/p 1 if alternate 1's & 0's zre present int last 3 samples else 0
```
i/p: 0 0 1 0 1 0 1 1 0 1 0 0 0
o/p: 0 0 0 1 1 1 1 0 0 1 1 0 0
```
4. It is required to eliminate short length pulses from a sampled data. It means 0's in continuous 1's have to be made 1 & similarly 1's in 0's are to made 0's as shown in the following eample. Give the FSM for the same.
```
i/p: 0 1 0 0 1 1 0 1 1 0 0
o/p: 0 0 0 0 0 1 1 1 1 1 0
```