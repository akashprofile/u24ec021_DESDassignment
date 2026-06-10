module bm_32_bit (
  input signed [31:0] M, Q,  //multiplicand, multiplier
  output reg [63:0] r //product
);
  reg signed [32:0] acc;
  reg signed [65:0] seq;

  always @(*) begin
    acc = 33'b0;
    seq = {acc, Q, 1'b0};

    for (integer i = 0; i < 32; i = i + 1) begin
      case (seq[1:0])
        2'b10: acc = acc - {M[31], M};
        2'b01: acc = acc + {M[31], M};
        default: acc = acc;
      endcase
      
      seq[65:33] = acc;
      seq = seq >>> 1;
      acc = seq[65:33];
    end
    
    r = seq[64:1];
  end
endmodule