`timescale 1ns/1ps

module all_gates_tb;
  reg a, b;
  wire y_and_gl, y_and_df, y_and_beh;
  wire y_or_gl, y_or_df, y_or_beh;
  wire y_not_gl, y_not_df, y_not_beh;
  wire y_nand_gl, y_nand_df, y_nand_beh;
  wire y_nor_gl, y_nor_df, y_nor_beh;
  wire y_xor_gl, y_xor_df, y_xor_beh;
  wire y_xnor_gl, y_xnor_df, y_xnor_beh;
  
  and_gl u1(.y(y_and_gl), .a(a), .b(b));
  and_df u2(.y(y_and_df), .a(a), .b(b));
  and_beh u3(.y(y_and_beh), .a(a), .b(b));
  
  or_gl u4(.y(y_or_gl), .a(a), .b(b));
  or_df u5(.y(y_or_df), .a(a), .b(b));
  or_beh u6(.y(y_or_beh), .a(a), .b(b));
  
  not_gl u7(.y(y_not_gl), .a(a));
  not_df u8(.y(y_not_df), .a(a));
  not_beh u9(.y(y_not_beh), .a(a));

  nand_gl u10(.y(y_nand_gl), .a(a), .b(b));
  nand_df u11(.y(y_nand_df), .a(a), .b(b));
  nand_beh u12(.y(y_nand_beh), .a(a), .b(b));

  nor_gl u13(.y(y_nor_gl), .a(a), .b(b));
  nor_df u14(.y(y_nor_df), .a(a), .b(b));
  nor_beh u15(.y(y_nor_beh), .a(a), .b(b));

  xor_gl u16(.y(y_xor_gl), .a(a), .b(b));
  xor_df u17(.y(y_xor_df), .a(a), .b(b));
  xor_beh u18(.y(y_xor_beh), .a(a), .b(b));

  xnor_gl u19(.y(y_xnor_gl), .a(a), .b(b));
  xnor_df u20(.y(y_xnor_df), .a(a), .b(b));
  xnor_beh u21(.y(y_xnor_beh), .a(a), .b(b));

  initial begin
    $dumpfile("all_gates.vcd");
    $dumpvars(0, all_gates_tb);
    a = 1'b0; b = 1'b0;
    #1 a = 1'b0; b = 1'b1;
    #1  a = 1'b1; b = 1'b0;
    #1 a = 1'b1; b = 1'b1;
    #1 $finish;
  end
endmodule