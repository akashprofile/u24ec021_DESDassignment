`timescale 1ns/1ps

module two_bit_comparator_tb;
  reg [1:0] A, B;
  wire GT_gl, LT_gl, EQ_gl;
  wire GT_df, LT_df, EQ_df;
  wire GT_beh, LT_beh, EQ_beh;
  
  two_bit_comparator_gl g1(.GT(GT_gl), .LT(LT_gl), .EQ(EQ_gl), .A(A), .B(B));
  two_bit_comparator_df g2(.GT(GT_df), .LT(LT_df), .EQ(EQ_df), .A(A), .B(B));
  two_bit_comparator_beh g3(.GT(GT_beh), .LT(LT_beh), .EQ(EQ_beh), .A(A), .B(B));

  initial begin
    $dumpfile("two_bit_comparator.vcd");
    $dumpvars(0, two_bit_comparator_tb);
    for (integer i = 0; i < 16; i = i + 1) begin
      {A, B} = i;
      #1;
    end
    $finish;
  end
endmodule