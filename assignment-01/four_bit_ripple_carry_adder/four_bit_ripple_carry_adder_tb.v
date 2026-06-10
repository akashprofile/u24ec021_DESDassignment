module four_bit_ripple_carry_adder_tb;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum_df, sum_beh, sum_st;
  wire cout_df, cout_beh, cout_st;
  
  four_bit_ripple_carry_adder_df u1(.Sum(sum_df), .Cout(cout_df), .A(a), .B(b), .Cin(cin));
  four_bit_ripple_carry_adder_beh u2(.Sum(sum_beh), .Cout(cout_beh), .A(a), .B(b), .Cin(cin));
  four_bit_ripple_carry_adder_st u3(.Sum(sum_st), .Cout(cout_st), .A(a), .B(b), .Cin(cin));

  initial begin
    $dumpfile("four_bit_ripple_carry_adder.vcd");
    $dumpvars(0, four_bit_ripple_carry_adder_tb);
    
       {a, b, cin} = {4'b0000, 4'b0000, 1'b0};
    #1 {a, b, cin} = {4'b0001, 4'b0001, 1'b0};
    #1 {a, b, cin} = {4'b0010, 4'b0001, 1'b0};
    #1 {a, b, cin} = {4'b0101, 4'b0010, 1'b0};
    #1 {a, b, cin} = {4'b0101, 4'b1001, 1'b0};
    #1 {a, b, cin} = {4'b1001, 4'b1101, 1'b0};
    #1 {a, b, cin} = {4'b1001, 4'b1110, 1'b0};
    #1 {a, b, cin} = {4'b0000, 4'b0000, 1'b1};
    #1 {a, b, cin} = {4'b0001, 4'b0001, 1'b1};
    #1 {a, b, cin} = {4'b0010, 4'b0001, 1'b1};
    #1 {a, b, cin} = {4'b0101, 4'b0010, 1'b1};
    #1 {a, b, cin} = {4'b0101, 4'b1001, 1'b1};
    #1 {a, b, cin} = {4'b1001, 4'b1101, 1'b1};
    #1 {a, b, cin} = {4'b1001, 4'b1110, 1'b1};
    #1 $finish;
  end
endmodule