module bm_8_bit (
  input signed [7:0]  M, Q,  //multiplicand, multiplier
  output reg signed [15:0] r //product
);
  reg signed [8:0] acc;      //accumulator
  reg signed [17:0] seq;     //{acc, Q, Qm1}

  always @(*) begin
    acc = 9'b0;
    seq = {acc, Q, 1'b0};
    
    for (integer i = 0; i < 8; i = i + 1) begin
      case (seq[1:0]) 
        2'b10: acc = acc - {M[7], M};
        2'b01: acc = acc + {M[7], M};
        default: acc = acc;
      endcase

      seq[17:9] = acc;
      seq = seq >>> 1;
      acc = seq[17:9];
    end

    r = seq[16:1];
  end
endmodule
