`timescale 1ns/1ps

module testbench;
  reg signed [7:0] M1, Q1;
  wire signed [15:0] R1;
  reg signed [15:0] expected16;
  bm_8_bit u1(.r(R1), .M(M1), .Q(Q1));

  reg signed [31:0] M2, Q2;
  wire signed [63:0] R2;
  reg signed [63:0] expected64;
  bm_32_bit u2(.r(R2), .M(M2), .Q(Q2));
  
  function signed [15:0] ext16bit;
    input signed [7:0] num;
    begin
      ext16bit = {{8{num[7]}}, num};
    end
  endfunction

  function signed [63:0] ext64bit;
    input signed [31:0] num;
    begin
      ext64bit = {{32{num[31]}}, num};
    end
  endfunction

  integer i;

  initial begin
    $display(">>> Testing 8 bit booth multiplier");
    
    // small numbers
    M1 = 8'sd51; Q1 = 8'sd49;
    #1 $display("M1 = %4d   Q1 = %4d   R1 = %6d   expected = %6d", M1, Q1, R1, ext16bit(M1) * ext16bit(Q1));
    
    M1 = -8'sd51; Q1 = 8'sd49;
    #1 $display("M1 = %4d   Q1 = %4d   R1 = %6d   expected = %6d", M1, Q1, R1, ext16bit(M1) * ext16bit(Q1));
    
    //limiting numbers
    M1 = 8'sd127; Q1 = 8'sd127;
    #1 $display("M1 = %4d   Q1 = %4d   R1 = %6d   expected = %6d", M1, Q1, R1, ext16bit(M1) * ext16bit(Q1));

    M1 = -8'sd127; Q1 = 8'sd127;
    #1 $display("M1 = %4d   Q1 = %4d   R1 = %6d   expected = %6d", M1, Q1, R1, ext16bit(M1) * ext16bit(Q1));

    M1 = -8'sd128; Q1 = -8'sd128;
    #1 $display("M1 = %4d   Q1 = %4d   R1 = %6d   expected = %6d", M1, Q1, R1, ext16bit(M1) * ext16bit(Q1));
    
    $display(">>> done!\n");

    $display(">>> Testing 32 bit booth multiplier");
    
    //small numbers
    M2 = 32'sh00ff; Q2 = 32'sh00ff;
    #1 $display("M2 = %11d   Q2 = %11d   R2 = %21d   expected = %21d", M2, Q2, R2, ext64bit(M2) * ext64bit(Q2));

    M2 = -32'sh00ff; Q2 = 32'sh00f1;
    #1 $display("M2 = %11d   Q2 = %11d   R2 = %21d   expected = %21d", M2, Q2, R2, ext64bit(M2) * ext64bit(Q2));

    //limiting numbers
    M2 = 32'sh7fff_ffff; Q2 = 32'sh7fff_ffff;
    #1 $display("M2 = %11d   Q2 = %11d   R2 = %21d   expected = %21d", M2, Q2, R2, ext64bit(M2) * ext64bit(Q2));

    M2 = -32'sh7fff_ffff; Q2 = 32'sh7fff_ffff;
    #1 $display("M2 = %11d   Q2 = %11d   R2 = %21d   expected = %21d", M2, Q2, R2, ext64bit(M2) * ext64bit(Q2));

    M2 = -32'sh8000_0000; Q2 = -32'sh8000_0000;
    #1 $display("M2 = %11d   Q2 = %11d   R2 = %21d   expected = %21d", M2, Q2, R2, ext64bit(M2) * ext64bit(Q2));

    M2 = -32'sh8000_0000; Q2 = 32'sh7fff_ffff;
    #1 $display("M2 = %11d   Q2 = %11d   R2 = %21d   expected = %21d", M2, Q2, R2, ext64bit(M2) * ext64bit(Q2));

    $display(">>> done!");
  end
  
endmodule