`timescale 1ns/100ps

module rca_tb;
  reg [15:0] a, b;
  reg cin;
  wire [15:0] sum;
  wire cout;
  reg [16:0] temp;
  ripple_carry_adder#(16) rca(.sum(sum), .cout(cout), .a(a), .b(b), .cin(cin));

  initial begin
    for (integer i = 0; i < 7; i = i + 1) begin
      a = $random;
      b = $random;
      cin = $random;
      #1; //assign statements require delta time

      $display("a = %16b  b = %16b  cin = %b    sum = %16b  cout = %b", a, b, cin, sum, cout);

      temp = a + b + cin;
      $display("Expected: sum = %16b  cout = %b\n", temp[15:0], temp[16]);

      if (sum != temp[15:0] || cout != temp[16]) begin
        $display("Error");
        $finish;
      end
      
    end
  end
endmodule