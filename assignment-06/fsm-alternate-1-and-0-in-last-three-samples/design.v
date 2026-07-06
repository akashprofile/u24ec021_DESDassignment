module fsm (
  input rst,     //active-low asynchronous reset
  input clk,     //+ve edge trigerred
  input x,
  output reg y
);
  reg [1:0] q;   //internal state
  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      q <= 2'b00;
      y <= 0;
    end
    else begin
      q[0] <= x;
      q[1] <= q[0];
      y <= (~q[1] & q[0] & ~x) | (q[1] & ~q[0] & x);
    end
  end
endmodule