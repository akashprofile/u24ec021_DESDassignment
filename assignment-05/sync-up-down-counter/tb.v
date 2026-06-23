`timescale 1ns/100ps

module sync_up_down_counter_tb;
  reg clk, countDown, reset;
  wire [1:0] value;

  sync_up_down_counter#(2) u(.clk(clk), .countDown(countDown), .reset(reset), .value(value));

  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end

  initial begin
    $dumpfile("waveforms.vcd");
    $dumpvars(0, sync_up_down_counter_tb);
    reset = 1'b0;
    countDown = 1'b0; //count up
    #1.2 reset = 1'b1;
    #10 countDown = 1'b1;
    #10 countDown = 1'b0;

    #4 $finish;
  end
endmodule