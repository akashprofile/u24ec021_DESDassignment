`timescale 1ns/1ps

module bcd_encoder_tb;
  reg [4:0] in;
  wire [4:0] out;
  bcd_encoder u1(.out(out), .in(in));
  
  initial begin
    $dumpfile("bcd_encoder.vcd");
    $dumpvars(0, bcd_encoder_tb);

    #0 in = 0;
    #1 in = 5;
    #1 in = 3;
    #1 in = 7;
    #1 in = 9;
    #1 in = 10;
    #1 in = 13;
    #1 in = 16;
    #1 in = 19;
    #1 in = 11;
    #1 $finish;
  end
endmodule