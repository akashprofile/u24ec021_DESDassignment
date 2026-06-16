module full_adder (
  output S, C,
  input x, y, z
);
  assign S = x ^ y ^ z;
  assign C = (x & y) | ((x ^ y) & z);
endmodule

module ripple_carry_adder #(
  parameter N = 8
) (
  output [N-1:0] sum,
  output cout,
  input [N-1:0] a, b,
  input cin
);
  wire carries[N-1:0]; // intermediate carry outputs

  genvar i;

  generate
    for (i = 0; i < N; i = i + 1) begin : g1
      if (i === 0) begin : g2
        full_adder fa(.S(sum[0]), .C(carries[0]), .x(a[0]), .y(b[0]), .z(cin));
      end
      else begin : g3
        full_adder fa(.S(sum[i]), .C(carries[i]), .x(a[i]), .y(b[i]), .z(carries[i-1]));
      end
    end
  endgenerate
  
  assign cout = carries[N-1];
endmodule