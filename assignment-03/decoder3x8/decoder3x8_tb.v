`timescale 1ns/1ps

module decoder3x8_tb;
  reg [2:0] in;
  wire [7:0] out;

  decoder3x8 u1(.out(out), .in(in));

  initial begin
    $dumpfile("decoder3x8.vcd");
    $dumpvars;
    
    for (integer i = 0; i < 8; i = i + 1) begin
      in = i; #1;
    end

    $finish;
  end
endmodule