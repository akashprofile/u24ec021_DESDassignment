`timescale 1ns/1ps

module muxes_tb;
  localparam N = 2;

  initial begin
    $dumpfile("muxes.vcd");
    $dumpvars(0, muxes_tb);
    #10 $finish;
  end

  reg [1:0] in1;
  reg s1, en1;
  wire y1;
  mux2x1 u1(.out(y1), .in(in1), .sel(s1), .en(en1));

  initial begin
    en1 = 0; in1 = 2'b10;
    #1 en1 = 1; s1 = 0;
    #1 s1 = 1;
    #1 in1 = 2'b01; s1 = 0;
    #1 s1 = 1;
    #1 in1 = 2'b11; s1 = 0;
    #1 s1 = 1;
    #1 en1 = 0;
  end

  reg [3:0] in2;
  reg [1:0] s2;
  reg en2;
  wire y2;
  mux4x1 u2(.out(y2), .in(in2), .sel(s2), .en(en2));

  initial begin
    en2 = 0; in2 = 4'b0101;
    #1 en2 = 1; s2 = 2'b00;
    #1 s2 = 2'b01;
    #1 s2 = 2'b10;
    #1 s2 = 2'b11;
    #1 in2 = 4'b1010; s2 = 2'b00;
    #1 s2 = 2'b01;
    #1 s2 = 2'b10;
    #1 s2 = 2'b11;
    #1 en2 = 0;
  end

  reg [7:0] in3;
  reg [2:0] s3;
  reg en3;
  wire y3;
  muxNx1 #(8, 3) u3(.out(y3), .in(in3), .sel(s3), .en(en3));

  initial begin
    en3 = 0; in3 = 8'b1100_1100;
    #1 en3 = 1; s3 = 0;
    #1 en3 = 1; s3 = 1;
    #1 en3 = 1; s3 = 2;
    #1 en3 = 1; s3 = 3;
    #1 en3 = 1; s3 = 4;
    #1 en3 = 1; s3 = 5;
    #1 en3 = 1; s3 = 6;
    #1 en3 = 1; s3 = 7;
    #1 en3 = 0;
  end
endmodule