module block_tb;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  reg [4:0] temp;

  block u1(.sum(sum), .cout(cout), .a(a), .b(b), .cin(cin));
  
  task show_result ();
    begin
      $display("a = %4b  b = %4b  cin = %b  sum = %4b cout = %b", a, b, cin, sum, cout);
      temp = a + b + cin;
      $display("Expected: sum = %4b  cout = %1b\n", temp[3:0], temp[4]);
    end
  endtask
  
  initial begin
    a = 4'b1010; b = 4'b0101; cin = 1'b0; #1; show_result();
    a = 4'b1010; b = 4'b0101; cin = 1'b1; #1; show_result();
    a = 4'b1000; b = 4'b0011; cin = 1'b0; #1; show_result();
    a = 4'b1000; b = 4'b0011; cin = 1'b1; #1; show_result();
    a = 4'b0100; b = 4'b0001; cin = 1'b1; #1; show_result();
  end
endmodule