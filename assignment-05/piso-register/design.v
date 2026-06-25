module piso_register #(
  parameter N = 8
) (
  input wire clk,             //+ve edge triggered
  input wire rst,             //asynchronous active-low reset to all 0's
  input wire en,              //enable register to perform operation
  input wire wrt,             //write data into register
  input wire [N-1:0] d_in,    //data input
  output wire d_out           //data output bit
);
  reg [N-1:0] data_stored;
  assign d_out = data_stored[N-1];

  always @(posedge clk or negedge rst) begin
    if (!rst)
      data_stored <= {N{1'b0}};
    else
      if (en)
        if (wrt)
          data_stored <= d_in;
        else
          data_stored <= data_stored[N-2:0] << 1;
  end
endmodule