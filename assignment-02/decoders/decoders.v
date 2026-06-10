module decoder2x4 (
  output wire [3:0] y,
  input wire [1:0] i,
  input wire e
);
  assign y = (e === 1'b1)? 1'b1 << i : 2'b00;
endmodule

module decoder3x8 (
  output wire [7:0] y,
  input wire [2:0] i,
  input wire e
);
  assign y = (e === 1'b1)? 1'b1 << i : 3'b000;
endmodule