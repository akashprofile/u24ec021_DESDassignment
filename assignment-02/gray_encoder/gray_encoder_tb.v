`timescale 1ns/1ps

module gray_encoder_tb;
  reg [7:0] in;
  wire [7:0] out;
  
  gray_encoder u1(.out(out), .in(in));

  initial begin
    $dumpfile("gray_encoder.vcd");
    $dumpvars(0, gray_encoder_tb);
    #0 in = 4'o0;
    #1 in = 4'o1;
    #1 in = 4'o2;
    #1 in = 4'o3;
    #1 in = 4'o4;
    #1 in = 4'o5;
    #1 in = 4'o6;
    #1 in = 4'o7;
    #1 $finish;
  end
endmodule