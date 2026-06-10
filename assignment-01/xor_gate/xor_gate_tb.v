`timescale 1ns/1ps

module xor_gate_tb;
  reg A, B;
  wire Y_gl, Y_df, Y_beh;
  
  xor_gate_gl g1(.Y(Y_gl), .A(A), .B(B));
  xor_gate_df g2(.Y(Y_df), .A(A), .B(B));
  xor_gate_beh g3(.Y(Y_beh), .A(A), .B(B));

  initial begin
    $dumpfile("xor_gate.vcd");
    $dumpvars(0, xor_gate_tb);
    A = 0; B = 0;
    #1 A = 0; B = 1;
    #1 A = 1; B = 0;
    #1 A = 1; B = 1;
    #1 $finish; 
  end
endmodule