// Dataflow Modeling
module three_bit_full_adder_df(
  output [2:0] Sum,
  output Cout,
  input [2:0] A, B,
  input Cin
);
  wire c1, c2;
  assign {c1, Sum[0]} = A[0] + B[0] + Cin;
  assign {c2, Sum[1]} = A[1] + B[1] + c1;
  assign {Cout, Sum[2]} = A[2] + B[2] + c2;
endmodule

// Behavioral modelling
module three_bit_full_adder_beh(
  output reg [2:0] Sum,
  output reg Cout,
  input [2:0] A, B,
  input Cin
);
  always @(*) begin
    {Cout, Sum} = A + B + Cin;
  end
endmodule


module FA(
  output S, C,
  input wire x, y, z
);
  assign S = x ^ y ^ z;
  assign C = (x & y) | (y & z) | (x & z);
endmodule

// Structural modelling
module three_bit_full_adder_st(
  output [2:0] Sum,
  output Cout,
  input [2:0] A, B,
  input Cin
);
  wire w1, w2;
  FA g1(.S(Sum[0]), .C(w1), .x(A[0]), .y(B[0]), .z(Cin));
  FA g2(.S(Sum[1]), .C(w2), .x(A[1]), .y(B[1]), .z(w1));
  FA g3(.S(Sum[2]), .C(Cout), .x(A[2]), .y(B[2]), .z(w2));
endmodule

