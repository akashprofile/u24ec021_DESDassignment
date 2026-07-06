`timescale 1ns/100ps

module tb;
  reg rst, clk, x;
  wire y;
  reg [0:9] seq_in, out_actual, out_expected;
  
  fsm dut(.rst(rst), .clk(clk), .x(x), .y(y));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, tb);
    clk = 1'b0;
    forever
      #5 clk = ~clk;
  end

  initial begin
    rst = 1'b0;
    seq_in = 10'b0101011001;
    out_expected = 10'b0001011100;
    #3;
    
    rst = 1'b1;
    for (integer i = 0; i < 10; i = i + 1) begin
      x = seq_in[i]; #5;
      out_actual[i] = y; #5;
    end

    $display("seq_in      :  %b", seq_in);
    $display("out_actual  :  %b", out_actual);
    $display("out_expected:  %b", out_expected);

    #5 $finish;
  end

endmodule