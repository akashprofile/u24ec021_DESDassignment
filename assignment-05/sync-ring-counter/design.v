module sync_ring_counter #(
  parameter N = 8  //no. of bits to use
) (
  output reg [N-1:0] value,
  input clk,       //clock pulse
  input reset      //active-low
);
  always @(posedge clk or negedge reset) begin
    if (!reset) begin
      value = {{N-2{1'b0}}, 1'b1};
    end
    else begin
      value <= value << 1;
      value[0] <= value[N-1];
    end
  end
endmodule