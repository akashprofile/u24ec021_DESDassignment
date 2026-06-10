module demux1x2 (
  output reg [1:0] out,
  input wire in, sel, en
);
  always @(*) begin
    if (en == 1) begin
      out = 2'b00;
      out[sel] = in;
    end
    else
      out = 2'b00;
  end
endmodule

module demux1x4 (
  output reg [3:0] out,
  input wire in,
  input wire [1:0] sel,
  input wire en
);
  always @(*) begin
    if (en == 1) begin
      out = 4'b0000;
      out[sel] = in;
    end
    else
      out = 4'b0000;
  end
endmodule

module demux1xN #(
  parameter N = 8,
  parameter SEL_W = 3
) (
  output reg [N-1:0] out,
  input wire in,
  input wire [SEL_W-1:0] sel,
  input wire en
);
  always @(*) begin
    if (en == 1) begin
      out = {N{1'b0}};
      out[sel] = in;
    end
    else
      out = {N{1'b0}};
  end

  initial begin //guardrail
    if (2 ** SEL_W != N) begin
      $display("Error: muxNx1 instantiated improperly. Required 2 ** SEL_W== N. But got, SEL_W=%d and N=%d", SEL_W, N);
      $finish;
    end
  end
endmodule