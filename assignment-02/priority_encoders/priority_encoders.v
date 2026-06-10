module priority_encoder4x2 (
  output reg [1:0] out,
  input wire [3:0] in,
  input wire en
);
  always @(*) begin
    if (en === 1) begin
      casez (in)
        4'b1???: out = 3;
        4'b01??: out = 2;
        4'b001?: out = 1;
        4'b0001: out = 0;
        default: out = 0;
      endcase
    end
    else
      out = 0;
  end
endmodule

module priority_encoder8x3 (
  output reg [2:0] out,
  input wire [7:0] in,
  input wire en
);
  always @(*) begin
    if (en === 1) begin
      casez (in)
        8'b1???_????: out = 7;
        8'b01??_????: out = 6;
        8'b001?_????: out = 5;
        8'b0001_????: out = 4;
        8'b0000_1???: out = 3;
        8'b0000_01??: out = 2;
        8'b0000_001?: out = 1;
        8'b0000_0001: out = 0;
        default: out = 0;
      endcase
    end
    else
      out = 0;
  end
endmodule