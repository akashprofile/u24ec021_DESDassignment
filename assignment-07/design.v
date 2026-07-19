/** Instruction Format
 * zzzzx mmmm nnnn iiiiiiii
 * zzzzx    -> opcode 5-bits
 * mmmm     -> source register 1 address 4-bits
 * nnnn     -> source register 2 address 4-bits
 * iiiiiiii -> immediate value 8-bits
 */
module ALU (
  input wire rst,                         //active-low asynchronous reset
  input wire clk,                         //+ve edge trigerred
  input wire [20:0] instruction,          //{opcode[20:16], srcReg1[15:12], srcReg2[11:8], imm8[7:0]}
  input wire [0:511] registerFileFlat,    //ith word is at [i*32 -: 32]
  output reg [31:0] result                //result of the operation
);
  //opcodes
  localparam ADD     = 5'b0_0001, ADDI     = 5'b1_0001;
  localparam SUB     = 5'b0_0010, SUBI     = 5'b1_0010;
  localparam AND     = 5'b0_0011, ANDI     = 5'b1_0011;
  localparam OR      = 5'b0_0100, ORI      = 5'b1_0100;
  localparam XOR     = 5'b0_0101, XORI     = 5'b1_0101;
  localparam LSHIFT  = 5'b0_0110, LSHIFTI  = 5'b1_0110;
  localparam RSHIFT  = 5'b0_0111, RSHIFTI  = 5'b1_0111;
  localparam ARSHIFT = 5'b0_1000, ARSHIFTI = 5'b1_1000;
  localparam NEG     = 5'b0_1001, IDLE     = 5'b0_0000;

  //extracting useful parts from instruction
  wire [4:0] opcode;
  wire [3:0] srcReg1, srcReg2;
  wire [7:0] imm8;

  assign opcode = instruction[20:16];
  assign srcReg1 = instruction[15:12];
  assign srcReg2 = instruction[11:8];
  assign imm8 = instruction[7:0];
  
  reg [31:0] sr1_val, sr2_val, ximm8, zimm8;
  
  always @(posedge clk or negedge rst) begin
    //get operands data
    sr1_val = registerFileFlat[srcReg1 * 32 +: 32];
    sr2_val = registerFileFlat[srcReg2 * 32 +: 32];
    ximm8 = {{24{imm8[7]}}, imm8};
    zimm8 = {24'b0, imm8};

    if (!rst) 
      result <= 32'h0000_0000;
    else begin
      //check opcode and perform operations accordingly.
      case (opcode)
        IDLE:
          result <= result;
        ADD:
          result <= sr1_val + sr2_val;
        ADDI:
          result <= sr1_val + ximm8;
        SUB:
          result <= sr1_val - sr2_val;
        SUBI:
          result <= sr1_val - ximm8;
        AND:
          result <= sr1_val & sr2_val;
        ANDI:
          result <= sr1_val & zimm8;
        OR:
          result <= sr1_val | sr2_val;
        ORI:
          result <= sr1_val | zimm8;
        XOR:
          result <= sr1_val ^ sr2_val;
        XORI:
          result <= sr1_val ^ zimm8;
        LSHIFT:
          result <= sr1_val << sr2_val;
        LSHIFTI:
          result <= sr1_val << zimm8;
        RSHIFT:
          result <= sr1_val >> sr2_val;
        RSHIFTI:
          result <= sr1_val >> zimm8;
        ARSHIFT:
          result <= $signed(sr1_val) >>> sr2_val;
        ARSHIFTI:
          result <= $signed(sr1_val) >>> zimm8;
        NEG:
          result <= ~sr1_val + 1'b1;
        default:
          result <= 32'h0000_0000;
      endcase
    end
  end
endmodule