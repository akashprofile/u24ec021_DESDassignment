`timescale 1ns/100ps

module custom_sequence_counter_tb;
  wire [7:0] count;
  wire [1:0] s;
  reg clk, rst;
  
  custom_sequence_counter dut(.clk(clk), .rst(rst), .count(count));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, custom_sequence_counter_tb);
    clk = 1'b0;
    forever
      #5 clk = ~clk;
  end
  
  initial begin
    rst = 1'b0;
    #1;
    rst = 1'b1;
    
    for (integer i = 0; i < 10; i = i + 1) begin
      $display("#%3d  >> count = %3d", $time, count);
      #10;
    end

    $finish;
  end

endmodule