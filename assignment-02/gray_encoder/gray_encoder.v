module gray_encoder (
  output reg [7:0] out,
  input wire [7:0] in
);
  always @(*) begin
    out[7] = in[7];
    for (integer i = 6; i >= 0; i = i - 1)
      out[i] = in[i+1] ^ in[i];
  end
endmodule