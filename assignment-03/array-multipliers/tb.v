`timescale 1ns/1ps

module testbench;
  reg [7:0] M1, Q1;
  wire [15:0] R1;
  reg [15:0] expected16;
  am_8_bit u1(.r(R1), .M(M1), .Q(Q1));

  reg [31:0] M2, Q2;
  wire [63:0] R2;
  reg [63:0] expected64;
  am_32_bit u2(.r(R2), .M(M2), .Q(Q2));
  
  integer i;

  initial begin
    $display(">>> Testing 8 bit array multiplier");

    M1 = 8'h0; Q1 = 8'h0;
    #1 $display("M1 = %3d   Q1 = %3d   R1 = %5d   expected = %5d", M1, Q1, R1, {8'b0, M1} * {8'b0, Q1});

    M1 = 8'hff; Q1 = 8'hff;
    #1 $display("M1 = %3d   Q1 = %3d   R1 = %5d   expected = %5d", M1, Q1, R1, {8'b0, M1} * {8'b0, Q1});

    M1 = 8'hff; Q1 = 8'h01;
    #1 $display("M1 = %3d   Q1 = %3d   R1 = %5d   expected = %5d", M1, Q1, R1, {8'b0, M1} * {8'b0, Q1});

    M1 = 8'h01; Q1 = 8'hff;
    #1 $display("M1 = %3d   Q1 = %3d   R1 = %5d   expected = %5d", M1, Q1, R1, {8'b0, M1} * {8'b0, Q1});

    M1 = 8'h0f; Q1 = 8'h0f;
    #1 $display("M1 = %3d   Q1 = %3d   R1 = %5d   expected = %5d", M1, Q1, R1, {8'b0, M1} * {8'b0, Q1});

    M1 = 8'hf0; Q1 = 8'hf0;
    #1 $display("M1 = %3d   Q1 = %3d   R1 = %5d   expected = %5d", M1, Q1, R1, {8'b0, M1} * {8'b0, Q1});

    for (i = 0; i < 100; i = i + 1) begin
      M1 = $random; Q1 = $random;
      expected16 = {8'b0, M1} * {8'b0, Q1};
      #1;
      
      if (R1 !== expected16) begin
        $display("FAIL: M1=%h Q1=%h   got=%h   expected=%h", M1, Q1, R1, expected16);
        $finish;
      end
    end
    $display(">>> 8-bit random tests passed.");


    $display("\n>>> Testing 32 bit array multiplier");

    M2 = 32'h00000000; Q2 = 32'h00000000;
    #1 $display("M1 = %10d   Q1 = %10d   R1 = %20d   expected = %20d", M2, Q2, R2, {32'b0, M2} * {32'b0, Q2});

    M2 = 32'hffffffff; Q2 = 32'hffffffff;
    #1 $display("M1 = %10d   Q1 = %10d   R1 = %20d   expected = %20d", M2, Q2, R2, {32'b0, M2} * {32'b0, Q2});

    M2 = 32'hffffffff; Q2 = 32'h00000001;
    #1 $display("M1 = %10d   Q1 = %10d   R1 = %20d   expected = %20d", M2, Q2, R2, {32'b0, M2} * {32'b0, Q2});

    M2 = 32'h00000001; Q2 = 32'hffffffff;
    #1 $display("M1 = %10d   Q1 = %10d   R1 = %20d   expected = %20d", M2, Q2, R2, {32'b0, M2} * {32'b0, Q2});

    M2 = 32'h0000ffff; Q2 = 32'h0000ffff;
    #1 $display("M1 = %10d   Q1 = %10d   R1 = %20d   expected = %20d", M2, Q2, R2, {32'b0, M2} * {32'b0, Q2});

    M2 = 32'hffff0000; Q2 = 32'hffff0000;
    #1 $display("M1 = %10d   Q1 = %10d   R1 = %20d   expected = %20d", M2, Q2, R2, {32'b0, M2} * {32'b0, Q2});

    for (i = 0; i < 100; i = i + 1) begin
      M2 = $random; Q2 = $random;
      expected64 = {32'b0, M2} * {32'b0, Q2};
      #1;

      if (R2 !== expected64) begin
        $display("FAIL: M2=%h Q2=%h got=%h expected=%h", M2, Q2, R2, expected64);
        $finish;
      end
    end

    $display(">>> 32-bit random tests passed.");
    $finish;
  end
  

endmodule