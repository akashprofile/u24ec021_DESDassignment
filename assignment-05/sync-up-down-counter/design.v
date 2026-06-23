module sync_up_down_counter #(
  parameter N = 8  //no. of bits to use
) (
  output reg [N-1:0] value,
  input countDown, // if 1'b1 count down else up     
  input clk,       //clock pulse
  input reset      //active-low
);
  always @(posedge clk or negedge reset) begin
    if (!reset)
      value = {N{1'b0}};
    else begin
      if (countDown) begin
        value = (value == {N{1'b0}})? {N{1'b1}} : value - 1;
      end
      else begin
        value = (value == {N{1'b1}})? {N{1'b0}} : value + 1;
      end
    end
  end
endmodule