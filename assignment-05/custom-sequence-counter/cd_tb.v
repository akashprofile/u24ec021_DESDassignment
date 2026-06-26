`timescale 1ns/100ps

module custom_decoder_tb;
  reg [1:0] state;
  wire [7:0] decoded;
  
  custom_decoder dut(.state(state), .decoded(decoded));

  initial begin
    $monitor("state = %2b    decode = %d", state, decoded);
    state = 2'b00; #1;
    state = 2'b01; #1;
    state = 2'b10; #1;
    state = 2'b11; #1;
  end
endmodule