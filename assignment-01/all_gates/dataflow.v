module and_df (
  output y,
  input a, b
);
  assign y = a & b;
endmodule

module or_df (
  output y,
  input a, b
);
  assign y = a | b;
endmodule

module not_df (
  output y,
  input a
);
  assign y = ~a;
endmodule

module nand_df (
  output y,
  input a, b
);
  assign y = ~(a & b);
endmodule

module nor_df (
  output y,
  input a, b
);
  assign y = ~(a | b);
endmodule

module xor_df (
  output y,
  input a, b
);
  assign y = (~a & b) | (a & ~b); 
endmodule

module xnor_df(
  output y,
  input a, b
);
  assign y = (~a & ~b) | (a & b);
endmodule