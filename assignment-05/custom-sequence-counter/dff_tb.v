`timescale 1ns/100ps

module d_ff_tb;
  reg d, clk, rst;
  wire q;

  d_ff dut(.clk(clk), .rst(rst), .d(d), .q(q));

  initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0, d_ff_tb);
    clk = 1'b0;
    rst = 1'b0;
    forever
      #5 clk = ~clk;
  end

  initial begin
    #2;
    rst = 1'b1; //released
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    $finish;
  end
endmodule