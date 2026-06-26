`timescale 1ns/100ps

module bidirectional_shift_register_tb;
  reg clk, rst, en, shiftRight, d_in;
  wire d_out_left, d_out_right;
  
  reg [3:0] data_in;  //container for input bits.

  bidirectional_shift_register#(4) dut(.clk(clk), .rst(rst), .en(en), .shiftRight(shiftRight), .d_in(d_in), .d_out_left(d_out_left), .d_out_right(d_out_right));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, bidirectional_shift_register_tb);
    data_in = 4'b0;
    rst = 1'b0;         //reset
    en = 1'b0;          //disabled
    shiftRight = 1'b0;  //left-shift
    clk = 1'b0;
    forever
      #5 clk = ~clk;    //100 MHz clock frequency
  end
  
  //operations will be performed on posedge of clock and result will be observed on negedge of clock. I will setup the inputs #2 time units before arrival of +ve edge of clock, at the next -ve edge I can observe past inputs, that I will be using to mimick the data stored in the register.
  always @(negedge clk) begin
    $display("#%3d  >>  rst = %b  en = %b  shiftRight = %b  d_in = %b  d_out_left = %b  d_out_right = %b  data_in = %4b", $time, rst, en, shiftRight, d_in, d_out_left, d_out_right, data_in);
  end

  initial begin
    #1;
    data_in = 4'b1010;
    en = 1'b1;
    rst = 1'b1;
    #2;
    for (integer i = 0; i < 4; i = i + 1) begin
      d_in = data_in[i]; #10;
    end
    
    en = 1'b0; #20;   //retaining data for two clock cycles
    
    shiftRight = 1'b1;
    en = 1'b1;
    data_in = 4'b0101;
    for (integer i = 0; i < 4; i = i + 1) begin
      d_in = data_in[i]; #10;
    end
    $finish;
  end
endmodule