module StopwatchLogic(

	input CLK_100Hz,
	
	input reset_n,
	
	input start_stop,
	
	input hold,
	
	output [6:0] stopwatch_unit_mins,
	
	output [5:0] stopwatch_unit_secs,
	
	output [6:0] stopwatch_unit_decs,
	
	output stopwatch_overflow
	
);

	reg started;
	
	wire paused;
	
	reg overflow;
	
	wire[23:0] cnt;
	
	initial begin
	
		started = 1;
		
		overflow = 0;
		
	end
	
	assign stopwatch_overflow = overflow;
	
	
	// timer
	
	Counter count0(
	
		CLK_100Hz,
	
		reset_n,
		
		started,
		
		paused,
		
		cnt[23:0]
		
	);
	
	GetDecs decs0(
	
		CLK_100Hz,
	
		cnt[23:0],
		
		stopwatch_unit_decs[6:0]
		
	);
	
	GetSecond sec0(
	
		CLK_100Hz,
	
		cnt[23:0],
		
		stopwatch_unit_secs[5:0]
		
	);
	
	GetMinute min0(
	
		CLK_100Hz,
	
		cnt[23:0],
		
		stopwatch_unit_mins[6:0]
		
	);
	
	// stopwatch control
	
	always @(negedge start_stop) begin
	
		if (reset_n && paused) begin
	
			started <= ~started;
			
		end
	
	end
	 
	assign paused = hold ? 1 : 0;
	
	always @(negedge CLK_100Hz) begin
	
		if (cnt == 599999) begin
	
			overflow = 1;
			
		end else begin
		
			overflow = 0;
			
		end
		
	end
	

endmodule
