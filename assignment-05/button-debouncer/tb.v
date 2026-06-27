`timescale 1ns/1ns

module button_debouncer_tb;
  localparam integer full_dt = 10_000_000, half_dt = 5_000_000, quarter_dt = 2_500_000;

  reg clk, rst, btnPressed;
  wire btnRegister;
  
  button_debouncer dut(.clk(clk), .rst(rst), .btnPressed(btnPressed), .btnRegister(btnRegister));

  initial begin
    $dumpfile("traces.vcd");
    $dumpvars(0, button_debouncer_tb);
    clk = 1'b0;
    forever
      #5 clk = ~clk;  //100 MHz
  end

  initial begin
    rst = 1'b0;
    btnPressed = 1'b0;
    $display("#%11d    btnPressed = %b   btnRegister = %b   //start", $time, btnPressed, btnRegister);

    #quarter_dt;
    rst = 1'b1;
    btnPressed = 1'b1;   //1. button pressed
    $display("#%11d    btnPressed = %b   btnRegister = %b   //1.", $time, btnPressed, btnRegister);
    
    #quarter_dt;
    btnPressed = 1'b0;   //2. released before debounce time period
    $display("#%11d    btnPressed = %b   btnRegister = %b   //2.", $time, btnPressed, btnRegister);

    #quarter_dt;
    btnPressed = 1'b1;   //3. pressed again
    $display("#%11d    btnPressed = %b   btnRegister = %b   //3.", $time, btnPressed, btnRegister);

    #full_dt;
    btnPressed = 1'b0;   //4. released after debounce time period
    $display("#%11d    btnPressed = %b   btnRegister = %b   //4.", $time, btnPressed, btnRegister);

    #quarter_dt;
    btnPressed = 1'b1;   //5. pressed again
    $display("#%11d    btnPressed = %b   btnRegister = %b   //5.", $time, btnPressed, btnRegister);

    #full_dt;
    #half_dt;
    btnPressed = 1'b0;   //6. release after 1.5 times debounce time period
    $display("#%11d    btnPressed = %b   btnRegister = %b   //6.", $time, btnPressed, btnRegister);

    #quarter_dt;
    $display("#%11d    btnPressed = %b   btnRegister = %b   //end", $time, btnPressed, btnRegister);
    $finish;
  end
endmodule