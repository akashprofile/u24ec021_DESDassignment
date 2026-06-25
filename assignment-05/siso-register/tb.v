`timescale 1ns/100ps

module siso_reg_tb;
  reg [7:0] data_in, data_out;
  
  reg clk, d_in, en, rst;
  wire d_out;
  
  siso_register#(8) dut(.clk(clk), .en(en), .rst(rst), .d_in(d_in), .d_out(d_out));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, siso_reg_tb);
    data_in = 8'b10100101;   //data to be written
    data_out = 8'b0;
    clk = 1'b0;
    forever
      #5 clk = ~clk;         //100 MHz clock
  end
  
  always @(posedge clk)
    #1 $display("#%5d >>  en = %b  rst = %b  d_in = %b  d_out = %b  data_in = %8b  data_out = %8b", $time, en, rst, d_in, d_out, data_in, data_out);
      
  initial begin
    en = 1'b1;               //enable register for operations
    rst = 1'b0;              //reset register
    #1 rst = 1'b1;           //releasing register data transfers
    
    #3; //taking setup time 1 time unit
    for (integer i = 7; i > -1; i = i - 1) begin
      d_in = data_in[i]; #10;
    end

    en = 1'b0; #20;          //retaining data

    en = 1'b1;               //reading_data
    for (integer i = 0; i < 8; i = i + 1) begin
      data_out = {data_out[6:0], d_out}; #10;
    end

    #20 $finish;
  end
endmodule