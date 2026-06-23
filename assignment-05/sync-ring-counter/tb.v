`timescale 1ns/100ps

module sync_ring_counter_tb;
  reg clk, reset;
  wire [3:0] value;

  sync_ring_counter#(4) u(.clk(clk), .reset(reset), .value(value));
  
  initial begin
    //clock generation
    clk = 1'b0;
    forever #1 clk = ~clk; //500MHz
  end

  initial begin
    $dumpfile("waveforms.vcd");
    $dumpvars(0, sync_ring_counter_tb);
    reset = 1'b0;
    #1.5 reset = 1'b1;

    #16 $finish;
  end
endmodule