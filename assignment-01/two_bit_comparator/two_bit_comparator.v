// Gate-Level Modeling
module two_bit_comparator_gl(
  output wor GT, LT,
  output wand EQ,
  input wire [1:0] A, B
);
  xnor(EQ, A[1], B[1]);
  xnor(EQ, A[0], B[0]);
  
  and(GT, A[0], ~B[1], ~B[0]);
  and(GT, A[1], A[0], ~B[0]);
  and(GT, A[1], ~B[1]);

  and(LT, ~A[1], ~A[0], B[0]);
  and(LT, ~A[0], B[1], B[0]);
  and(LT, ~A[1], B[1]);
endmodule

// Dataflow Modelling
module two_bit_comparator_df(
  output GT, LT, EQ,
  input wire [1:0] A, B
);
  assign GT = (A[0] & ~B[1] & ~B[0]) + (A[1] & A[0] & ~B[0]) + (A[1] & ~B[1]);
  assign LT = (~A[1] & ~A[0] & B[0]) + (~A[0] & B[1] & B[0]) + (~A[1] & B[1]);
  assign EQ = ~((A[1] ^ B[1]) | (A[0] ^ B[0]));
endmodule

// Behavioral Modeling
module two_bit_comparator_beh(
  output reg GT, LT, EQ,
  input wire [1:0] A, B
);
  always @(*) begin
    GT = (A[0] & ~B[1] & ~B[0]) + (A[1] & A[0] & ~B[0]) + (A[1] & ~B[1]);
    LT = (~A[1] & ~A[0] & B[0]) + (~A[0] & B[1] & B[0]) + (~A[1] & B[1]);
    EQ = ~((A[1] ^ B[1]) | (A[0] ^ B[0]));
  end
endmodule