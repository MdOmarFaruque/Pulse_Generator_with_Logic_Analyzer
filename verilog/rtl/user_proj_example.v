// Code your design here
// Code your design here
`default_nettype none
module user_proj_example (
`ifdef USE_POWER_PINS
    inout vdda1,
    inout vssa1,
    inout vccd1,	// User area 1 1.8V supply  
    inout vssd1,	// User area 1 digital ground  
`endif  
    input  wb_clk_i,          // Clock input
    input  wb_rst_i,  
    input  wbs_stb_i,
    input  wbs_cyc_i,
    input   [127:0] la_data_in, 
    output   reg [127:0] la_data_out,
    input   [127:0] la_oenb,
    output reg analog_io2      // Reset input
    //output reg io_out     // Output pulse
);

// Parameters for pulse generation
//parameter PULSE_WIDTH = 10; // Pulse width in clock cycles
wire clk;
wire rst;
wire [2:0] NUM_PULSES;   // Number of pulses to generate
reg h_tag;
reg [2:0] pulse_count; 
wire valid;
wire [3:0] la_write;
//wire [BITS-1:0] rdata; 
//wire [BITS-1:0] wdata;
reg count;

initial begin
  
    h_tag=0;
end
// Internal counters and state variables
    // Counter for number of pulses generated
//reg [3:0] width_count;      // Counter for pulse width
//assign la_oenb = 4'b1000;
//assign la_oenb[3] = 1'b0;
assign  NUM_PULSES = la_data_in[63:61];


assign valid = wbs_cyc_i && wbs_stb_i; 
//assign wbs_dat_o = {{(32-BITS){1'b0}}, rdata};
//assign wdata = wbs_dat_i[BITS-1:0];

//LA
assign la_data_out = {{(127){1'b0}}, count};
//try la_oenb=0 1st 
assign la_write = ~la_oenb[63:61] & ~{3{valid}};
assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;


// State machine for pulse generation
always @(posedge clk) begin
    h_tag=~h_tag;
    if (|la_write) begin 
    if (rst) begin
        pulse_count <= 0;
        //width_count <= 0;
        //la_data_out <= 0;
        count<=0;
        analog_io2<=0;
        
    end else begin
        // Check if all pulses have been generated
      if (pulse_count < NUM_PULSES && h_tag==0) begin
            // Generate pulse when width_count reaches PULSE_WIDTH
             pulse_count <= pulse_count+1;
            
          //   la_data_out <= 1;
             count<=1;
             analog_io2<=1;
      end else begin
           //pulse_count <= 0;
            
            //la_data_out <= 0;
            count<=0;
            analog_io2<=0;
       
    end

end
end
end
endmodule
`default_nettype wire
