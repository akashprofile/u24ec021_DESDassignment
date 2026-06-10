`timescale 1ns/1ps

module priority_encoders_tb;
  reg [3:0] I1;
  reg E1;
  wire [1:0] Y1;
  priority_encoder4x2 u1(.out(Y1), .in(I1), .en(E1));

  reg [7:0] I2;
  reg E2;
  wire [2:0] Y2;
  priority_encoder8x3 u2(.out(Y2), .in(I2), .en(E2));
  
  initial begin
    $dumpfile("priority_encoders.vcd");
    $dumpvars(0, priority_encoders_tb);
    #12 $finish;
  end

  initial begin
    E1 = 0;
    #1 E1 = 1;
    for (integer i = 0; i < 4; i = i + 1) begin
      I1 = 1 << i;
      #1;
    end
    I1 = 4'b1001; #1; // valid
    I1 = 4'b0011; #1; // valid
    E1 = 0;
  end
  
  initial begin
    E2 = 0;
    #1 E2 = 1;
    for (integer i = 0; i < 8; i = i + 1) begin
      I2 = 1 << i;
      #1;
    end
    I2 = 8'b1000_0001; #1; //valid
    I2 = 8'b0000_1001; #1; //valid
    E2 = 0;
  end
endmodule