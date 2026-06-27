/*
 * Button debounder (button should be pressed for 10ms at 100 Mhz clock to register)
 * Button press will be registered if it remains stable HIGH for 10ms
 */

 module button_debouncer (
  input wire clk,             //+ve edge triggered
  input wire rst,             //active-low asynchronous reset
  input wire btnPressed,      //1 means pressed, 0 means released
  output reg btnRegister      //1 signals eligible button press to register
 );
  reg [19:0] pressedCycles, targetCycles;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      btnRegister <= 1'b0;
      pressedCycles <= 20'b0;
      targetCycles <= 20'd999_999;
    end
    else begin
      if (btnPressed) begin
        if (pressedCycles == targetCycles) begin
          //this is 1e+6 onwards clk since btn pressed
          btnRegister <= 1'b1;
        end
        else
          pressedCycles <= pressedCycles + 1; 
      end
      else begin
        pressedCycles <= 1'b0;
        btnRegister <= 1'b0;
      end
    end
  end
 endmodule