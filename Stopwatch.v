module Stopwatch(

	input CLK_50,
	
	input reset_n,
	
	input start_stop,
	
	input hold,
	
	output [7:0] ten_mins_seven_seg,
	
	output [7:0] one_min_seven_seg,
	
	output [7:0] ten_secs_seven_seg,
	
	output [7:0] one_sec_seven_seg,
	
	output [7:0] tenths_seven_seg,
	
	output [7:0] hundredths_seven_seg,
	
	output overflow_flag
	
);

	wire CLK_100Hz;
	
	wire [23:0] cnt;
	
	wire[6:0] stopwatch_unit_mins;
	
	wire[5:0] stopwatch_unit_secs;
	
	wire[6:0] stopwatch_unit_decs;
	
	wire reset;
	
	assign reset = reset_n;

	ClockDivider50MHzTo100Hz divider0(
	
		CLK_50,
	
		reset,
		
		CLK_100Hz
	
	);
	
	StopwatchLogic logic0(
	
		CLK_100Hz,
		
		reset,
		
		start_stop,
		
		hold,
		
		stopwatch_unit_mins[6:0],
		
		stopwatch_unit_secs[5:0],
		
		stopwatch_unit_decs[6:0],
		
		overflow_flag
		
	);

	SevenSegEncoder sevenseg0(
	
		stopwatch_unit_mins[6:0],
	
		stopwatch_unit_secs[5:0],
		
		stopwatch_unit_decs[6:0],
		
		ten_mins_seven_seg[7:0],
		
		one_min_seven_seg[7:0],
		
		ten_secs_seven_seg[7:0],
		
		one_sec_seven_seg[7:0],
		
		tenths_seven_seg[7:0],
		
		hundredths_seven_seg[7:0]
		
	);
	


endmodule
