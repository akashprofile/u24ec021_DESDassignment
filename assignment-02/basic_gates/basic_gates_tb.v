`timescale 1ns/1ps

module basic_gates_tb;
  reg a, b;
  wire y_and, y_or, y_not, y_nand, y_nor, y_xor, y_xnor;
  
  and_gate u1(y_and, a, b);
  or_gate u2(y_or, a, b);
  not_gate u3(y_not, a);
  nand_gate u4(y_nand, a, b);
  nor_gate u5(y_nor, a, b);
  xor_gate u6(y_xor, a, b);
  xnor_gate u7(y_xnor, a, b);

  initial begin
    $dumpfile("basic_gates.vcd");
    $dumpvars(0, basic_gates_tb);
    #0 a = 0; b = 0;
    #1 a = 0; b = 1;
    #1 a = 1; b = 0;
    #1 a = 1; b = 1;
    #1 $finish;
  end
endmodule