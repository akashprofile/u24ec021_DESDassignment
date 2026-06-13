`timescale 1ns/1ps

module demux1x16_tb;
  reg in;
  reg [3:0] sel;
  wire [15:0] out;

  demux1x16 u1(.out(out), .in(in), .sel(sel));

  initial begin
    $dumpfile("demux1x16.vcd");
    $dumpvars;

    in = 1'b1;
    for (integer i = 0; i < 16; i = i + 1) begin
      sel = i; #1;
    end
    
    $finish();
  end
endmodule