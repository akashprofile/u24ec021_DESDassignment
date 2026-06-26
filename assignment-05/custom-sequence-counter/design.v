/**
 * Task: count sequence 1, 32, 64, 128
 * Restriction: No behavioral code allowed. 
 */

//OK Tested
//map: 00 -> 1, 01 -> 32, 10 -> 64, 11 -> 128
module custom_decoder (
  input wire [1:0] state,
  output wire [7:0] decoded
);
  assign decoded[0] = ~state[1] & ~state[0];
  assign decoded[1] = state[1] & ~state[0];
  assign decoded[2] = state[1] & ~state[0];
  assign decoded[3] = state[1] & ~state[0];
  assign decoded[4] = state[1] & ~state[0];
  assign decoded[5] = state[1] ^ state[0];
  assign decoded[6] = 1'b0;
  assign decoded[7] = state[1] & state[0];
endmodule

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

module custom_sequence_counter (
  input wire clk,    //+ve edge triggered
  input wire rst,    //active-low reset
  output wire [7:0] count
);
  wire [1:0] state;
  custom_decoder u(.state(state), .decoded(count));
  wire t0, t1;
  assign t0 = ~state[0];
  assign t1 = state[0] ^ state[1]; 
  d_ff f0(.clk(clk), .d(t0), .rst(rst), .q(state[0]));
  d_ff f1(.clk(clk), .d(t1), .rst(rst), .q(state[1]));
endmodule