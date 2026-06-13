`timescale 1ns/1ps

module mux16x1_tb;
  reg [15:0] in;
  reg [3:0] sel;
  wire out;
  
  mux16x1 u1(.out(out), .in(in), .sel(sel));
  
  initial begin
    $dumpfile("mux16x1.vcd");
    $dumpvars(0, mux16x1_tb);

    in = 16'b1100_1100_1010_1111;
    for (integer i = 0; i < 16; i = i + 1) begin
      sel = i; #1;
    end
    
    $finish;
  end
endmodule