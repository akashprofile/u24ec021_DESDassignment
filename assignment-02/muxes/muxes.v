module mux2x1 (
  output wire out,
  input wire [1:0] in,
  input wire sel, en
);
  assign out = en? in[sel] : 0;
endmodule

module mux4x1 (
  output wire out,
  input wire [3:0] in,
  input wire [1:0] sel,
  input wire en
);
  assign out = en? in[sel] : 0;
endmodule

module muxNx1 #(
  parameter N = 8,
  parameter SEL_W = 3
) (
  output wire out,
  input wire [N-1:0] in,
  input wire [SEL_W-1:0] sel,
  input wire en
);
  assign out = en? in[sel] : 0;

  initial begin //guardrail
    if (2 ** SEL_W != N) begin
      $display("Error: muxNx1 instantiated improperly. Required 2 ** SEL_W== N. But got, SEL_W=%d and N=%d", SEL_W, N);
      $finish;
    end
  end
endmodule