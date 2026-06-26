`timescale 1ns/100ps

module bcd_counter_tb;
  reg clk, rst;
  wire [3:0] count;
  
  bcd_counter dut(.clk(clk), .rst(rst), .count(count));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, bcd_counter_tb);
    clk = 1'b0;
    forever
      #5 clk = ~clk;
  end

  initial begin
    rst = 1'b0;  //resetted
    #1;
    rst = 1'b1;  //released

    for (integer i = 0; i < 16; i = i + 1) begin
      $display("#%3d count  =>    %4b  _2    %1d  _10", $time, count, count); #10;
    end

    $finish;
  end
endmodule