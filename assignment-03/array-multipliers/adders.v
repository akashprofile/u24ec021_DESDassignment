module half_adder (
  input x, y,
  output S, C
);
  assign S = x ^ y;
  assign C = x & y;
endmodule

module full_adder (
  input x, y, z,
  output S, C
);
  assign S = x ^ y ^ z;
  assign C = ((x ^ y) & z) | (x & y);
endmodule
