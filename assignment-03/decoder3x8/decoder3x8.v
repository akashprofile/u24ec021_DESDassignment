module decoder3x8 (
  output reg [7:0] out,
  input [2:0] in
);
  always @(in) update();

  task update ();
    begin
      out = 8'b1 << in;
    end
  endtask
endmodule