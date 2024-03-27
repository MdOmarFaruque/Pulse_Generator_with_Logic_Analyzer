###############################################################################
# Created by write_sdc
# Tue Mar 26 23:42:16 2024
###############################################################################
current_design user_proj_example
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 25.0000 [get_ports {wb_clk_i}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_clock_latency -source -min 4.6500 [get_clocks {clk}]
set_clock_latency -source -max 5.5700 [get_clocks {clk}]
set_input_delay 0.1800 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_data_in[0]}]
set_input_delay 1.8700 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_data_in[0]}]
set_input_delay 0.1800 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_data_in[1]}]
set_input_delay 1.8700 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_data_in[1]}]
set_input_delay 0.1800 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_data_in[2]}]
set_input_delay 1.8700 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_data_in[2]}]
set_input_delay 0.1800 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_data_in[3]}]
set_input_delay 1.8700 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_data_in[3]}]
set_input_delay 0.1800 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_data_in[4]}]
set_input_delay 1.8700 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_data_in[4]}]
set_input_delay 0.3000 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_oenb[0]}]
set_input_delay 1.8900 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_oenb[0]}]
set_input_delay 0.3000 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_oenb[1]}]
set_input_delay 1.8900 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_oenb[1]}]
set_input_delay 0.3000 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_oenb[2]}]
set_input_delay 1.8900 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_oenb[2]}]
set_input_delay 0.3000 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_oenb[3]}]
set_input_delay 1.8900 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_oenb[3]}]
set_input_delay 0.3000 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_oenb[4]}]
set_input_delay 1.8900 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_oenb[4]}]
set_input_delay 0.3000 -clock [get_clocks {clk}] -min -add_delay [get_ports {la_oenb[5]}]
set_input_delay 1.8900 -clock [get_clocks {clk}] -max -add_delay [get_ports {la_oenb[5]}]
set_input_delay 12.5000 -clock [get_clocks {clk}] -add_delay [get_ports {wb_rst_i}]
set_input_delay 1.6900 -clock [get_clocks {clk}] -min -add_delay [get_ports {wbs_cyc_i}]
set_input_delay 4.7400 -clock [get_clocks {clk}] -max -add_delay [get_ports {wbs_cyc_i}]
set_input_delay 1.8600 -clock [get_clocks {clk}] -min -add_delay [get_ports {wbs_stb_i}]
set_input_delay 4.1300 -clock [get_clocks {clk}] -max -add_delay [get_ports {wbs_stb_i}]
set_multicycle_path -hold\
    -through [list [get_ports {wbs_cyc_i}]\
           [get_ports {wbs_stb_i}]] 1
set_multicycle_path -setup\
    -through [list [get_ports {wbs_cyc_i}]\
           [get_ports {wbs_stb_i}]] 2
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.1900 [get_ports {la_data_out}]
set_input_transition 0.6100 [get_ports {wb_clk_i}]
set_input_transition -min 0.0900 [get_ports {wbs_cyc_i}]
set_input_transition -max 0.1700 [get_ports {wbs_cyc_i}]
set_input_transition 0.1500 [get_ports {wbs_stb_i}]
set_input_transition -min 0.0700 [get_ports {la_data_in[4]}]
set_input_transition -max 0.8600 [get_ports {la_data_in[4]}]
set_input_transition -min 0.0700 [get_ports {la_data_in[3]}]
set_input_transition -max 0.8600 [get_ports {la_data_in[3]}]
set_input_transition -min 0.0700 [get_ports {la_data_in[2]}]
set_input_transition -max 0.8600 [get_ports {la_data_in[2]}]
set_input_transition -min 0.0700 [get_ports {la_data_in[1]}]
set_input_transition -max 0.8600 [get_ports {la_data_in[1]}]
set_input_transition -min 0.0700 [get_ports {la_data_in[0]}]
set_input_transition -max 0.8600 [get_ports {la_data_in[0]}]
set_input_transition -min 0.0600 [get_ports {la_oenb[5]}]
set_input_transition -max 0.9700 [get_ports {la_oenb[5]}]
set_input_transition -min 0.0600 [get_ports {la_oenb[4]}]
set_input_transition -max 0.9700 [get_ports {la_oenb[4]}]
set_input_transition -min 0.0600 [get_ports {la_oenb[3]}]
set_input_transition -max 0.9700 [get_ports {la_oenb[3]}]
set_input_transition -min 0.0600 [get_ports {la_oenb[2]}]
set_input_transition -max 0.9700 [get_ports {la_oenb[2]}]
set_input_transition -min 0.0600 [get_ports {la_oenb[1]}]
set_input_transition -max 0.9700 [get_ports {la_oenb[1]}]
set_input_transition -min 0.0600 [get_ports {la_oenb[0]}]
set_input_transition -max 0.9700 [get_ports {la_oenb[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 1.0000 [current_design]
set_max_fanout 16.0000 [current_design]
