module bcd_encoder (
  output wire [4:0] out,  
  input wire [4:0] in //19 can be represented in 5 bits
);
  assign out[3:0] = in % 10;
  assign out[4] = (in > 9)? 1 : 0;
endmodule