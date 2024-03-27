// Code your design here
module PulseGenerator (
    input wire wb_clk_i,          // Clock input
    input wire wb_rst_i,  
    input  [2:0] la_data_in, 
    output reg  la_data_out,
    input  [2:0] la_oenb,       // Reset input
    output reg io_out     // Output pulse
);

// Parameters for pulse generation
//parameter PULSE_WIDTH = 10; // Pulse width in clock cycles
wire [2:0] NUM_PULSES;   // Number of pulses to generate
reg h_tag;
reg [2:0] pulse_count; 


//wire [BITS-1:0] rdata; 
//wire [BITS-1:0] wdata;


initial begin
  
    h_tag=0;
end
// Internal counters and state variables
    // Counter for number of pulses generated
//reg [3:0] width_count;      // Counter for pulse width
assign la_oenb=3'b000;
assign  NUM_PULSES=la_data_in;


//assign valid = wbs_cyc_i && wbs_stb_i; 
//assign wbs_dat_o = {{(32-BITS){1'b0}}, rdata};
//assign wdata = wbs_dat_i[BITS-1:0];

//LA
//assign la_data_out = {{(128-BITS){1'b0}}, count};
//try la_oenb=0 1st 
//assign la_write = ~la_oenb[63:64-BITS] & ~{BITS{valid}};



// State machine for pulse generation
always @(posedge clk or posedge rst) begin
    h_tag=~h_tag;
    if (rst) begin
        pulse_count <= 0;
        //width_count <= 0;
        io_out <= 0;
        la_data_out<=0;
    end else begin
        // Check if all pulses have been generated
      if (pulse_count < NUM_PULSES && h_tag==0) begin
            // Generate pulse when width_count reaches PULSE_WIDTH
             pulse_count <= pulse_count+1;
            
             io_out <= 1;
             la_data_out<=1;
      end else begin
           //pulse_count <= 0;
            
            io_out <= 0;
            la_data_out<=0;
       
    end
end
end
endmodule

