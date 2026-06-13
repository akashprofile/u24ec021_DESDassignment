module mux16x1 (
  output reg out,
  input [15:0] in,
  input [3:0] sel
);
  always @(in, sel) rewire();

  task rewire ();
    begin
      out = in[sel];
    end
  endtask
endmodule