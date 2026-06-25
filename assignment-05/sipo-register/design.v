module sipo_register #(
  parameter N = 8
) (
  input wire clk,                //+ve edge triggered
  input wire rst,                //active-low reset to all 0's
  input wire en,                 //allow to load
  input wire d_in,               //input data bit
  output wire [N-1:0] d_out      //ouput data
);
  //data MSB first-in
  reg [N-1:0] data;
  assign d_out = data;

  always @(posedge clk or negedge rst) begin
    if (!rst)
      data <= {N{1'b0}};
    else
      if (en)
        data <= {data[N-2:0], d_in};
  end
endmodule