module and_gl (
  output y,
  input a, b
);
  and(y, a, b);
endmodule

module or_gl (
  output y,
  input a, b
);
  or(y, a, b);
endmodule

module not_gl (
  output y,
  input a
);
  not(y, a);
endmodule

module nand_gl (
  output y,
  input a, b
);
  nand(y, a, b);
endmodule

module nor_gl (
  output y,
  input a, b
);
  nor(y, a, b);
endmodule

module xor_gl (
  output y,
  input a, b
);
  xor(y, a, b);
endmodule

module xnor_gl(
  output y,
  input a, b
);
  xnor(y, a, b);
endmodule