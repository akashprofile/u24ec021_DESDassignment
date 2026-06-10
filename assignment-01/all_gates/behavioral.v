module and_beh (
  output reg y,
  input a, b
);
  always @(*)
    y = a & b;
endmodule

module or_beh (
  output reg y,
  input a, b
);
  always @(*)
    y = a | b;
endmodule

module not_beh (
  output reg y,
  input a
);
  always @(*)
    y = ~a;
endmodule

module nand_beh (
  output reg y,
  input a, b
);
  always @(*)
    y = ~(a & b);
endmodule

module nor_beh (
  output reg y,
  input a, b
);
  always @(*)
    y = ~(a | b);
endmodule

module xor_beh (
  output reg y,
  input a, b
);
  always @(*)
    y = a ^ b;
endmodule

module xnor_beh(
  output reg y,
  input a, b
);
  always @(*)
    y = ~(a ^ b);
endmodule