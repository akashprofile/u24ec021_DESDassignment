module tff (
  input clk, t,
  input reset,                //active-low
  output reg q
);
  //+ve edge trigerred, asynchronous active-low preset
  always @(posedge clk or negedge reset)
    if (!reset)
      q <= 1'b0;
    else
      if (t)
        q <= ~q;
endmodule

module async_up_down_counter #(
  parameter N = 8
) (
  input clk,
  input countDown,            //if 1'b0 count up otherwise down
  input reset,                //active-low
  output [N-1:0] value
);
  wire [N-1:1] aux_clk;
  //If the "clk" input of next FF is connected to output "q" of previous FF, resultant is Down counter
  //If the "clk" input of next FF is connected to output "qbar" of previous FF, resultant is Up counter
  assign aux_clk = (countDown)? value[N-2:0] : ~value[N-2:0];

  tff first(.clk(clk), .t(1'b1), .reset(reset), .q(value[0]));

  genvar p;
  generate
    for (p = 1; p < N; p = p + 1) begin : g1
      tff ff(.clk(aux_clk[p]), .t(1'b1), .reset(reset), .q(value[p]));
    end
  endgenerate
endmodule