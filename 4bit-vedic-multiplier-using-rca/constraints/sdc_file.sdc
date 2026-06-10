set_units -time ns -resistance kOhm -capacitance pF -voltage 
V -current mA 
set_current_design vedic4 
create_clock -name main_clk -period 10.0 
set_input_delay -clock main_clk 2.0 [all_inputs] 
set_output_delay -clock main_clk 2.0 [all_outputs] 
set_max_fanout 20 [current_design] 
set_max_transition 0.5 [current_design]