`timescale 1ns/1ps

module decoders_tb;
  reg [1:0] I1;
  wire [3:0] Y1;
  reg E1;
  decoder2x4 u1(.y(Y1), .i(I1), .e(E1));
  
  reg [2:0] I2;
  wire [7:0] Y2;
  reg E2;
  decoder3x8 u2(.y(Y2), .i(I2), .e(E2));

  initial begin
    $dumpfile("decoders.vcd");
    $dumpvars(0, decoders_tb);
    #10 $finish;
  end

  initial begin
    #1 E1 = 1;
    for (integer  i = 0; i < 4; i = i + 1) begin
      I1 = i;
      #1;
    end
    E1 = 0;
  end

  initial begin
    #1 E2 = 1;
    for (integer  i = 0; i < 8; i = i + 1) begin
      I2 = i;
      #1;
    end
    E2 = 0;
  end
endmodule