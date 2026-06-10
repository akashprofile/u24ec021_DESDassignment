`timescale 1ns/1ps

module three_bit_full_adder;
  reg [2:0] A, B;
  reg Cin;
  wire [2:0] Sum_df, Sum_beh, Sum_st;
  wire Cout_df, Cout_beh, Cout_st;

  three_bit_full_adder_df g1(.A(A), .B(B), .Cin(Cin), .Sum(Sum_df), .Cout(Cout_df));
  three_bit_full_adder_beh g2(.A(A), .B(B), .Cin(Cin), .Sum(Sum_beh), .Cout(Cout_beh));
  three_bit_full_adder_st g3(.A(A), .B(B), .Cin(Cin), .Sum(Sum_st), .Cout(Cout_st));
  
  // integer file;
  initial begin
    $dumpfile("three_bit_full_adder.vcd");
    $dumpvars(0, three_bit_full_adder);
    // file = $fopen("./output.txt", "w");
    // $fmonitor(file, $time, "   A = %3b   B = %3b   Cin = %b   Sum_df = %3b   Sum_beh = %3d   Sum_st = %3d   Cout_df = %b   Cout_beh = %b   Cout_st = %b", A, B, Cin, Sum_df, Sum_beh, Sum_st, Cout_df, Cout_beh, Cout_st);
    
    // for (integer i = 0; i < 128; i = i + 1) begin
    //   {A, B, Cin} = i;
    //   #1;
    // end
    {A, B, Cin} = {3'b000, 3'b000, 1'b0};
    #1 {A, B, Cin} = {3'b100, 3'b011, 1'b0};
    #1 {A, B, Cin} = {3'b100, 3'b111, 1'b0};
    #1 {A, B, Cin} = {3'b011, 3'b100, 1'b0};
    #1 {A, B, Cin} = {3'b111, 3'b000, 1'b0};
    #1 {A, B, Cin} = {3'b111, 3'b001, 1'b0};
    #1 {A, B, Cin} = {3'b111, 3'b000, 1'b1};
    #1 {A, B, Cin} = {3'b110, 3'b001, 1'b1};
    #1 {A, B, Cin} = {3'b100, 3'b011, 1'b1};
    #1 {A, B, Cin} = {3'b001, 3'b101, 1'b1};
    #1 {A, B, Cin} = {3'b101, 3'b010, 1'b1};
    #1 {A, B, Cin} = {3'b000, 3'b100, 1'b1};
    #1 {A, B, Cin} = {3'b100, 3'b000, 1'b1};
    #1 $finish;
  end
endmodule