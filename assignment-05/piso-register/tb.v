`timescale 1ns/100ps

module piso_register_tb;
  reg clk, rst, en, wrt;
  reg [3:0] d_in;
  wire d_out;

  piso_register#(4) dut(.clk(clk), .rst(rst), .en(en), .wrt(wrt), .d_in(d_in), .d_out(d_out));

  reg [3:0] data_out;

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, piso_register_tb);
    data_out = 4'b0;
    en = 1'b0;         //disabled
    wrt = 1'b0;        //read-mode
    rst = 1'b0;        //resetted
    rst = 1'b1;        //released
    clk = 1'b0;
    forever
      #5 clk = ~clk;   //100 MHz clock
  end
  
  always @(negedge clk)
    $display("# %3d >>  rst = %b  en = %b  wrt = %b  d_in = %4b  d_out = %b  data_out = %4b", $time, rst, en, wrt, d_in, d_out, data_out);

  initial begin
    #2;
    //writing data
    en = 1'b1;
    wrt = 1'b1;
    d_in = 4'b1111;
    #10;

    //holding data
    en = 1'b0;
    d_in = 4'b0;
    #20;

    //reading the data
    en = 1'b1;
    wrt = 1'b0;
    for (integer i = 3; i > -1; i = i - 1) begin
      data_out = {data_out[2:0], d_out}; #10;
    end

    //resetting the register
    rst = 1'b0;
    for (integer i = 3; i > -1; i = i - 1) begin
      data_out = {data_out[2:0], d_out}; #10;
    end
    
    rst = 1'b1;
    
    //writing data
    wrt = 1'b1;
    d_in = 4'b1001;
    #10;
    
    //reading the data
    wrt = 1'b0;
    for (integer i = 3; i > -1; i = i - 1) begin
      data_out = {data_out[2:0], d_out}; #10;
    end

    //disable and reset
    rst = 1'b0;
    en = 1'b0;

    #10 $finish;
  end
endmodule