/** Function
 * 11011011   <=  subject
 * 10110110   <=  left-shift one bit
 * 01101101   <=  right-shift one bit
 * takes serial input
 * gives serial output
 * new bit comes from serial input
 * https://www.geeksforgeeks.org/digital-logic/bidirectional-shift-register/
 */

module bidirectional_shift_register #(
  parameter N = 8             //number of bits to operate on 
) (
  input wire clk,             //+ve edge triggered
  input wire rst,             //active-low asynchronous reset to all 0's
  input wire en,              //enable register operation / data transfer
  input wire shiftRight,      //if 1: shifts right, otherwise shifts left              
  input wire d_in,            //input bit
  output wire d_out_left,     //output left bit
  output wire d_out_right     //output right bit
);
  reg [N-1:0] data_stored;
  assign d_out_left = data_stored[N-1];
  assign d_out_right = data_stored[0];

  always @(posedge clk or negedge rst) begin
    if (!rst)
      data_stored <= {N{1'b0}};
    else
      if (en)
        if (shiftRight)
          data_stored <= {d_in, data_stored[N-1:1]};
        else
          data_stored <= {data_stored[N-2:0], d_in};

    //I know it it not synthesizable, just for looking into memory
    $strobe("#%3d  >>  data_stored: %b", $time, data_stored);
  end
endmodule