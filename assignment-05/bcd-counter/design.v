/**
 * Task: BCD counter
 * 0000 -> 1001 / MOD-10 counter
 * Restriction: no behavioral code allowed
 */

 module clock_gated_d_latch (
  input wire clk,    //high level sensitive
  input wire d,
  input wire rst,    //active-low asynchronus reset to 0
  output wire q
);
  wire t1, t2, t3, t4, t5, t6, t7;
  not (t1, d);
  and (t2, t1, clk);
  and (t3, d, clk);
  or (t5, t2, t4);
  not (t4, rst);
  and (t6, t3, rst);
  nor (q, t5, t7);
  nor (t7, q, t6);
endmodule

//OK Tested
module d_ff (
  input wire clk,    //+ve edge triggered
  input wire d,
  input wire rst,    //active-low asynchronus reset to 0
  output wire q
);
  wire t, neg_clk;
  assign neg_clk = ~clk;
  clock_gated_d_latch u1(.clk(neg_clk), .d(d), .rst(rst), .q(t));
  clock_gated_d_latch u2(.clk(clk), .d(t), .rst(rst), .q(q));
endmodule

module bcd_counter (
  input wire clk,          //+ve edge triggered
  input wire rst,          //active-low asynchronus reset to 0000
  output wire [3:0] count
);
  wire [3:0] state;        //I know it is extra but it gives more sense
  assign count = state;

  //inputs for D flip flops got after reduction using K-map
  wire t0, t1, t2, t3;
  assign t0 = ~state[0];
  assign t1 = (~state[3] & ~state[1] & state[0]) | (state[1] & ~state[0]);
  assign t2 = (state[2] & ~state[1]) | (state[2] & ~state[0]) | (~state[2] & state[1] & state[0]);
  assign t3 = (state[3] & ~state[0]) | (state[2] & state[1] & state[0]);

  d_ff f1(.clk(clk), .d(t0), .rst(rst), .q(state[0]));
  d_ff f2(.clk(clk), .d(t1), .rst(rst), .q(state[1]));
  d_ff f3(.clk(clk), .d(t2), .rst(rst), .q(state[2]));
  d_ff f4(.clk(clk), .d(t3), .rst(rst), .q(state[3]));
endmodule