`default_nettype none
module user_proj_example (
    `ifdef USE_POWER_PINS
        inout vdda1,	// User area 1 3.3V supply
       
        inout vssa1,	// User area 1 analog ground
        
        inout vccd1,	// User area 1 1.8V supply
      
        inout vssd1,	// User area 1 digital ground
        
   `endif
    input wire wb_clk_i,
    input wire wb_rst_i,
    //input wire [7:0] amplitude, // 8-bit amplitude control
    //input wire [15:0] duty_cycle_percent, // 16-bit duty cycle control
    output reg [1:0] analog_io
);
wire [15:0] duty_cycle_percent;
reg [15:0] counter;
wire pulse_2V2;
wire pulse_0V5;
assign duty_cycle_percent=30;
always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if (wb_rst_i) begin
        counter <= 16'h0000;
        analog_io<=2'b00;
    end else begin
        counter <= counter + 1;
        
        if (counter >= 16'hFFFF) begin
            counter <= 16'h0000;
            analog_io<=2'b00;
        end else begin
            if (counter < (duty_cycle_percent * 16'hFFFF) / 100) begin
                  analog_io[0] <= pulse_2V2;
                  analog_io[1] <= pulse_0V5;
            end else begin
                  analog_io<=2'b00;
            end
        end
    end
end

shifter shifter(
`ifdef USE_POWER_PINS
	.vdda1(vdda1),	// User area 1 1.8V power
	.vssa1(vssa1),	// User area 1 digital ground
`endif
    .pulse_2V2(pulse_2V2),
    .pulse_0V5(pulse_0V5)
  );
endmodule

(* blackbox *)
module shifter(
`ifdef USE_POWER_PINS
	inout vdda1,	// User area 1 1.8V power
	inout vssa1,	// User area 1 digital ground
`endif

output pulse_2V2,
output pulse_0V5
);
endmodule

`default_nettype wire