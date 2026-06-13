`timescale 1ns/1ps

module encoder8x3_tb;
  reg [7:0] a;
  wire [2:0] y;
  
  encoder8x3 u1(.out(y), .in(a));

  initial begin
    $dumpfile("encoder8x3.vcd");
    $dumpvars(0, encoder8x3_tb);

    for (integer i = 1; i < 2 ** 8; i = i * 2) begin
      a = i; #1;
    end
    a = 8'b1000_0001; #1; //invalid
    a = 8'b0000_0000; #1; //invalid
    $finish;
  end
endmodule