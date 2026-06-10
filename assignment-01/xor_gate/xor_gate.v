// Gate-Level Modeling
module xor_gate_gl(
  output wire Y,
  input wire A, B
);
  wire w1, w2, w3;
  nand(w1, A, B);
  nand(w2, A, w1);
  nand(w3, B, w1);
  nand(Y, w2, w3);
endmodule

// Dataflow Modeling
module xor_gate_df(
  output wire Y,
  input wire A, B
);
  wire w1, w2, w3;
  assign w1 = ~(A & B);
  assign w2 = ~(A & w1);
  assign w3 = ~(B & w1);
  assign Y = ~(w2 & w3);
endmodule

// Behavioral Modeling
module xor_gate_beh(
  output reg Y,
  input wire A, B
);
  always @(*) begin
    Y = A ^ B;
  end
endmodule