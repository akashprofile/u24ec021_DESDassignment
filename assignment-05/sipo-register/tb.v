`timescale 1ns/100ps

module sipo_reg_tb;
  reg [3:0] data_in;
  
  reg clk, d_in, en, rst;
  wire [3:0] d_out;
  
  sipo_register#(4) dut(.clk(clk), .en(en), .rst(rst), .d_in(d_in), .d_out(d_out));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, sipo_reg_tb);
    data_in = 4'b1001;   //data to be written
    clk = 1'b0;
    forever
      #5 clk = ~clk;         //100 MHz clock
  end
  
  always @(posedge clk)
    #1 $display("#%5d >>  en = %b  rst = %b  d_in = %b  d_out = %4b  data_in = %4b", $time, en, rst, d_in, d_out, data_in);
      
  initial begin
    en = 1'b1;               //enable register for operations
    rst = 1'b0;              //reset register
    #1 rst = 1'b1;           //releasing register data transfers
    
    #3; //taking setup time 1 time unit
    for (integer i = 3; i > -1; i = i - 1) begin
      d_in = data_in[i]; #10;
    end

    en = 1'b0; #20;          //retaining data

    en = 1'b1;               //writing another data
    data_in = 4'b1110;
    for (integer i = 3; i > -1; i = i - 1) begin
      d_in = data_in[i]; #10;
    end
    en = 1'b0; #10;          //retaining data
    $finish;
  end
endmodule