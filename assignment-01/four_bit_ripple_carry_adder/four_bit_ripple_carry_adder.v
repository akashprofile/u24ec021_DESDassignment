//Dataflow modelling
module four_bit_ripple_carry_adder_df(
  output [3:0] Sum,
  output Cout,
  input [3:0] A, B,
  input Cin
);
  assign {Cout, Sum} = A + B + Cin;
endmodule

//Behavioral Modelling
module four_bit_ripple_carry_adder_beh(
  output reg [3:0] Sum,
  output reg Cout,
  input [3:0] A, B,
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

// Structural Modelling
module four_bit_ripple_carry_adder_st(
  output [3:0] Sum,
  output Cout,
  input [3:0] A, B,
  input Cin
);
  wire w1, w2, w3;
  FA g1(.S(Sum[0]), .C(w1), .x(A[0]), .y(B[0]), .z(Cin));
  FA g2(.S(Sum[1]), .C(w2), .x(A[1]), .y(B[1]), .z(w1));
  FA g3(.S(Sum[2]), .C(w3), .x(A[2]), .y(B[2]), .z(w2));
  FA g4(.S(Sum[3]), .C(Cout), .x(A[3]), .y(B[3]), .z(w3));
endmodule