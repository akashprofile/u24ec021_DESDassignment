module carry_look_ahead_adder #(
  parameter N = 8
) (
  output [N-1:0] sum,
  output cout,
  input [N-1:0] a, b,
  input cin
);
  wire [N-1:0] p, g; //propagates, generates
  wire [N-1:-1] carries;
  
  assign carries[-1] = cin;
  assign p = a ^ b;
  assign g = a & b;

  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : g1
      assign sum[i] = p[i] ^ carries[i-1];
      assign carries[i] = g[i] | (p[i] & carries[i-1]);
    end
  endgenerate
  
  assign cout = carries[N-1];
endmodule