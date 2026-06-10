`timescale 1ns/1ps

module demuxes_tb;
  initial begin
    $dumpfile("demuxes.vcd");
    $dumpvars(0, demuxes_tb);
    #10 $finish;
  end
  
  wire [1:0] y1;
  reg in1;
  reg s1;
  reg e1;
  demux1x2 u1(.out(y1), .in(in1), .sel(s1), .en(e1));
  
  initial begin
    e1 = 0; in1 = 1;
    #1 e1 = 1; s1 = 0;
    #1 s1 = 1;
    #1 in1 = 0; s1 = 0;
    #1 s1 = 1;
    #1 e1 = 0;
  end

  wire [3:0] y2;
  reg in2;
  reg [1:0] s2;
  reg e2;
  demux1x4 u2(.out(y2), .in(in2), .sel(s2), .en(e2));

  initial begin
    e2 = 0; in2 = 1;
    #1 e2 = 1; s2 = 2'b00;
    #1 s2 = 2'b01;
    #1 s2 = 2'b10;
    #1 s2 = 2'b11;
    #1 in2 = 0; s2 = 2'b00;
    #1 s2 = 2'b01;
    #1 s2 = 2'b10;
    #1 s2 = 2'b11;
    #1 e2 = 0;
  end
  
  wire [7:0] y3;
  reg in3;
  reg [2:0] s3;
  reg e3;
  demux1xN #(8, 3) u3(.out(y3), .in(in3), .sel(s3), .en(e3));

  initial begin
    e3 = 0; in3 = 1;
    #1 e3 = 1; s3 = 3'b000;
    #1 s3 = 3'b001;
    #1 s3 = 3'b010;
    #1 s3 = 3'b011;
    #1 s3 = 3'b100;
    #1 s3 = 3'b101;
    #1 s3 = 3'b110;
    #1 s3 = 3'b111;
    #1 e3 = 0;
  end

endmodule