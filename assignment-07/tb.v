`timescale 1ns/100ps

module tb;
  reg rst, clk;
  reg [20:0] instruction;
  reg [0:511] registerFileFlat;
  wire [31:0] result;
  
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
    
        
    rst = 1'b0;
    #2;

    rst = 1'b1;
    instruction = {dut.ADD, 4'd0, 4'd1, 8'hFF};
    #5;
    $display("ADD:   %8h  +  %8h  =  %8h", getRegisterValue(0), getRegisterValue(1), result);

    #10;
    $finish;
  end

endmodule