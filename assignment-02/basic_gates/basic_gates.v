module mux2x1 (
  output wire out,
  input wire [1:0] in,
  input wire sel
);
  assign out = in[sel];
endmodule

// Y = I0.~S + I1.S

module and_gate (output y, input a, b);
  mux2x1 u(y, {a, 1'b0}, b);
endmodule

// A + ~AB = A + B
module or_gate (output y, input a, b);
  mux2x1 u(y, {1'b1, b}, a);
endmodule

module not_gate (output y, input a);
  mux2x1 u(y, {1'b0, 1'b1}, a);
endmodule

module nand_gate (output y, input a, b);
  wire t;
  mux2x1 u(t, {a, 1'b0}, b);
  mux2x1 v(y, {1'b0, 1'b1}, t);
endmodule

module nor_gate (output y, input a, b);
  wire t;
  mux2x1 u(t, {1'b1, b}, a);
  mux2x1 v(y, {1'b0, 1'b1}, t);
endmodule

module xor_gate (output y, input a, b);
  wire t1, t2, t3, t4;
  mux2x1 u(t1, {1'b0, 1'b1}, a); // ~a
  mux2x1 v(t2, {1'b0, 1'b1}, b); // ~b
  mux2x1 w(t3, {t1, 1'b0}, b);   // ~a.b
  mux2x1 x(t4, {a, 1'b0}, t2);   // a.~b
  mux2x1 z(y, {1'b1, t3}, t4);   // ~a.b + a.~b
endmodule

module xnor_gate (output y, input a, b);
  wire t1, t2, t3, t4;
  mux2x1 u(t1, {1'b0, 1'b1}, a); // ~a
  mux2x1 v(t2, {1'b0, 1'b1}, b); // ~b
  mux2x1 w(t3, {t1, 1'b0}, t2);   // ~a.~b
  mux2x1 x(t4, {a, 1'b0}, b);   // a.b
  mux2x1 z(y, {1'b1, t3}, t4);   // ~a.~b + a.b
endmodule
  
