module demux1x16 (
  output reg [15:0] out,
  input in,
  input [3:0] sel
);
  always @(in, sel) update();

  task update ();
    begin
      out = 16'b0;
      out[sel] = in;
    end
  endtask
endmodule