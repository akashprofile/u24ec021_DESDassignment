module encoder8x3 (
  output reg [2:0] out,
  input [7:0] in
);
  always @(in) rewire();

  task rewire;
    begin
      case (in)
        8'b0000_0001: out = 3'h0;
        8'b0000_0010: out = 3'h1;
        8'b0000_0100: out = 3'h2;
        8'b0000_1000: out = 3'h3;
        8'b0001_0000: out = 3'h4;
        8'b0010_0000: out = 3'h5;
        8'b0100_0000: out = 3'h6;
        8'b1000_0000: out = 3'h7;
        default:      out = 3'h0;
      endcase
    end
  endtask
endmodule