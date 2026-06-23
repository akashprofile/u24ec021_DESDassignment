`timescale 1ns/100ps

module async_up_down_counter_tb;
  reg clk, countDown, reset;
  wire [1:0] value;

  async_up_down_counter#(2) u(.clk(clk), .reset(reset), .countDown(countDown), .value(value));

  initial begin
    clk = 1'b0;
    countDown = 1'b0;      //count up
    forever #5 clk = ~clk; //100 MHz frequency 
  end

  initial begin
    $dumpfile("waveforms.vcd");
    $dumpvars(0, async_up_down_counter_tb);
    
    //resetting te FF
    #1 reset = 1'b0;
    #1 reset = 1'b1;

    //One clock cycle elapsed

    #60 countDown = 1'b1;
    #60 countDown = 1'b0;

    #4 $finish;
  end
endmodule