`timescale 1ns/100ps

module tb;
  reg rst, clk;
  reg [20:0] instruction;
  reg [0:511] registerFileFlat;
  wire [31:0] result;
  wire [31:0] signExtendedImm8Value, zeroFilledImm8Value;

  assign signExtendedImm8Value = {{24{instruction[7]}}, instruction[7:0]};
  assign zeroFilledImm8Value = {24'b0, instruction[7:0]};

  ALU dut(
    .rst(rst),
    .clk(clk),
    .instruction(instruction),
    .registerFileFlat(registerFileFlat),
    .result(result)
  );
  
  task setRegisterValue;
    input [3:0] index;
    input [31:0] value;
    begin
      registerFileFlat[index * 32 +: 32] = value;
    end
  endtask

  function [31:0] getRegisterValue;
    input [3:0] index;
    begin
      getRegisterValue = registerFileFlat[index * 32 +: 32];
    end
  endfunction
  
  initial begin
    clk = 1'b0;
    forever
      #5 clk = ~clk;
  end
  
  initial begin
    //loading the data in register file, 16 x 32
    setRegisterValue(0, 32'h0000_FFFF);
    setRegisterValue(1, 32'hFFFF_0000);
    setRegisterValue(2, 32'hF000_FFFF);
    setRegisterValue(3, 32'hFFFF_000F);
    setRegisterValue(4, 32'h0000_000F);
    setRegisterValue(5, 32'hF000_0000);
    setRegisterValue(6, 32'h0000_0004);
    setRegisterValue(7, 32'h0000_0008);
        
    rst = 1'b0;
    #2;
    rst = 1'b1;
    instruction = {dut.ADD, 4'h0, 4'h1, 8'h88};
    #5;
    $display("ADD >>> instruction: %21b", instruction);
    $display("srcReg1 content : %d", $signed(getRegisterValue(0)));
    $display("srcReg2 content : %d", $signed(getRegisterValue(1)));
    $display("result          : %d", $signed(result));
    $display;
    #5;
    instruction = {dut.ADDI, 4'h0, 4'h1, 8'h88};
    #5;
    $display("ADDI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %d", $signed(getRegisterValue(0)));
    $display("signExtendedImm8: %d", $signed(signExtendedImm8Value));
    $display("result          : %d", $signed(result));
    $display;
    #5;
    instruction = {dut.SUB, 4'h0, 4'h1, 8'h88};
    #5;
    $display("SUB >>> instruction: %21b", instruction);
    $display("srcReg1 content : %d", $signed(getRegisterValue(0)));
    $display("srcReg2 content : %d", $signed(getRegisterValue(1)));
    $display("result          : %d", $signed(result));
    $display;
    #5;
    instruction = {dut.SUBI, 4'h0, 4'h1, 8'h88};
    #5;
    $display("SUBI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %d", $signed(getRegisterValue(0)));
    $display("signExtendedImm8: %d", $signed(signExtendedImm8Value));
    $display("result          : %d", $signed(result));
    $display;
    #5;
    instruction = {dut.AND, 4'h2, 4'h3, 8'h88};
    #5;
    $display("AND >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(2));
    $display("srcReg2 content : %32b", getRegisterValue(3));
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.ANDI, 4'h2, 4'h3, 8'h0F};
    #5;
    $display("ANDI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(2));
    $display("zeroFilledImm8  : %32b", zeroFilledImm8Value);
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.OR, 4'h2, 4'h3, 8'h88};
    #5;
    $display("OR >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(2));
    $display("srcReg2 content : %32b", getRegisterValue(3));
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.ORI, 4'h2, 4'h3, 8'h0F};
    #5;
    $display("ORI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(2));
    $display("zeroFilledImm8  : %32b", zeroFilledImm8Value);
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.XOR, 4'h2, 4'h3, 8'h88};
    #5;
    $display("XOR >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(2));
    $display("srcReg2 content : %32b", getRegisterValue(3));
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.XORI, 4'h2, 4'h3, 8'h0F};
    #5;
    $display("XORI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(2));
    $display("zeroFilledImm8  : %32b", zeroFilledImm8Value);
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.LSHIFT, 4'h4, 4'h6, 8'h88};
    #5;
    $display("LSHIFT >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(4));
    $display("srcReg2 content : %32d", getRegisterValue(6));
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.LSHIFTI, 4'h4, 4'h3, 8'h03};
    #5;
    $display("LSHIFTI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(4));
    $display("zeroFilledImm8  : %32d", zeroFilledImm8Value);
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.RSHIFT, 4'h5, 4'h6, 8'h88};
    #5;
    $display("RSHIFT >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(5));
    $display("srcReg2 content : %32d", getRegisterValue(6));
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.RSHIFTI, 4'h5, 4'h6, 8'h03};
    #5;
    $display("RSHIFTI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(5));
    $display("zeroFilledImm8  : %32d", zeroFilledImm8Value);
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.ARSHIFT, 4'h5, 4'h6, 8'h88};
    #5;
    $display("ARSHIFT >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(5));
    $display("srcReg2 content : %32d", getRegisterValue(6));
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.ARSHIFTI, 4'h5, 4'h6, 8'h03};
    #5;
    $display("ARSHIFTI >>> instruction: %21b", instruction);
    $display("srcReg1 content : %32b", getRegisterValue(5));
    $display("zeroFilledImm8  : %32d", zeroFilledImm8Value);
    $display("result          : %32b", result);
    $display;
    #5;
    instruction = {dut.NEG, 4'h0, 4'h6, 8'h03};
    #5;
    $display("NEG >>> instruction: %21b", instruction);
    $display("srcReg1 content : %d", $signed(getRegisterValue(0)));
    $display("result          : %d", $signed(result));
    $display;
    $finish;
  end

endmodule