module full_adder (
  output S, C,
  input x, y, z
);
  assign S = x ^ y ^ z;
  assign C = (x & y) | ((x ^ y) & z);
endmodule

module rca_4_bit (
  output [3:0] sum,
  output cout,
  input [3:0] a, b,
  input cin
);
  wire carries[2:0]; // intermediate carry outputs
  full_adder fa1(.S(sum[0]), .C(carries[0]), .x(a[0]), .y(b[0]), .z(cin));
  full_adder fa2(.S(sum[1]), .C(carries[1]), .x(a[1]), .y(b[1]), .z(carries[0]));
  full_adder fa3(.S(sum[2]), .C(carries[2]), .x(a[2]), .y(b[2]), .z(carries[1]));
  full_adder fa4(.S(sum[3]), .C(cout), .x(a[3]), .y(b[3]), .z(carries[2]));
endmodule

module mux2x1 (
  output out,
  input [1:0] in,
  input sel
);
  assign out = in[sel];
endmodule

//OK Tested
module block (
  output [3:0] sum,
  output cout,
  input [3:0] a, b,
  input cin
);
  wire [3:0] s0, s1;
  wire c0, c1;

  rca_4_bit u1(.sum(s0), .cout(c0), .a(a), .b(b), .cin(1'b0));
  rca_4_bit u2(.sum(s1), .cout(c1), .a(a), .b(b), .cin(1'b1));

  genvar p;
  generate
    for (p = 0; p < 4; p = p + 1) begin: wiring_sum
      mux2x1 m1(.out(sum[p]), .in({s1[p], s0[p]}), .sel(cin));
    end
    mux2x1 m2(.out(cout), .in({c1, c0}), .sel(cin));
  endgenerate
endmodule

module carry_select_adder #(
  parameter N = 2 //no of blocks
) (
  output [(4*N)-1:0] sum,
  output cout,
  input [(4*N)-1:0] a, b,
  input cin
);
  wire carries[N-1:0]; //intermediate carry outputs of blocks

  genvar p;
  generate
    for (p = 0; p < N; p = p + 1) begin : wiring_blocks
      if (p === 0) begin : first_block
        block b1(.sum(sum[3:0]), .cout(carries[0]), .a(a[3:0]), .b(b[3:0]), .cin(cin));
      end
      else begin : subsequent_blocks
        block b1(.sum(sum[4*(p+1)-1:4*p]), .cout(carries[p]), .a(a[4*(p+1)-1:4*p]), .b(b[4*(p+1)-1:4*p]), .cin(carries[p-1]));
      end
    end
  endgenerate

  assign cout = carries[N-1];
endmodule