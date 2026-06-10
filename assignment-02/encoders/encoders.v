module encoder4x2 (
  output reg [1:0] out,
  input wire [3:0] in,
  input wire en
);
  always @(*) begin
    if (en === 1) begin
      case (in)
        4'b0001: out = 0;
        4'b0010: out = 1;
        4'b0100: out = 2;
        4'b1000: out = 3;
        default: out = 0;
      endcase
    end
    else
      out = 0;
  end
endmodule

module encoder8x3 (
  output reg [2:0] out,
  input wire [7:0] in,
  input wire en
);
  always @(*) begin
    if (en === 1) begin
      case (in)
        8'b0000_0001: out = 0;
        8'b0000_0010: out = 1;
        8'b0000_0100: out = 2;
        8'b0000_1000: out = 3;
        8'b0001_0000: out = 4;
        8'b0010_0000: out = 5;
        8'b0100_0000: out = 6;
        8'b1000_0000: out = 7;
        default: out = 0;
      endcase
    end
    else
      out = 0;
  end
endmodule