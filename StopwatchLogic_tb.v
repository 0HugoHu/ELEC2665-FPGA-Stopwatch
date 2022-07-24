`timescale 1 ns / 100 ps

module StopwatchLogic_tb;

	reg CLK_100Hz;
	
	reg reset_n;
	
	reg start_stop;
	
	reg hold;
	
	reg [23:0] testtime1;
	
	reg [23:0] testtime2;
	
	reg [23:0] holdtime1;
	
	reg [23:0] testresult;
	
	wire [6:0] stopwatch_unit_mins;
	
	wire [5:0] stopwatch_unit_secs;
	
	wire [6:0] stopwatch_unit_decs;
	
	wire stopwatch_overflow;
	
	always begin
		#1;
		CLK_100Hz <= ~CLK_100Hz;
	end
	integer i;
	initial begin
		// verify 50 sets of test
		for (i = 0; i < 50; i = i + 1) begin 
			reset_n = 1;
			start_stop = 1;
			hold = 1;
			CLK_100Hz = 1;
			// timescale 1 ns (unit)
			testtime1 = $urandom_range(1000,10000);  
			testtime2 = $urandom_range(1000,10000);
			holdtime1 = $urandom_range(1000,10000);
			testresult = (testtime1 + testtime2 + 2) / 2;  
			// must divided by 2 to record one cycle													  
			#1 start_stop = 0;
			#testtime1;
			hold = $random % 2;
			if (~hold) begin
				#holdtime1;
				hold = 1;
			end
			#testtime2;
			start_stop = 1;
			#1 start_stop = 0;
			#1 start_stop = 1;
			#1;
			// result for start/stop, hold, reset test
			if (stopwatch_unit_mins == testresult / 6000 % 100 
				&& stopwatch_unit_secs == testresult / 100 % 60
				&& (stopwatch_unit_decs - testresult % 100 <= 2
				|| testresult % 100 - stopwatch_unit_decs <= 2)) begin
				$display("Passed test %d", i + 1);
			end else begin
				$display("Failed test %d", i + 1);
			end
			#1 reset_n = 0;
			#1 reset_n = 1;
			#1;
		end
		// result for overflow test
		reset_n = 1;
		start_stop = 1;
		hold = 1;
		CLK_100Hz = 1;
		#1 start_stop = 0;
		#1200000;  // a little bit larger than twice 
					  // of the threshold 599,999
		start_stop = 1;
		#1 start_stop = 0;
		#1 start_stop = 1;
		#1;
		if (stopwatch_overflow == 1) begin
			$display("Passed overflow test");
		end else begin
			$display("Failed overflow test");
		end
		#1 reset_n = 0;
		#1 reset_n = 1;
		#1;
	$stop;
	end
	
	StopwatchLogic dut(
	
		CLK_100Hz,
	
		reset_n,
	
		start_stop,
	
		hold,
		
		stopwatch_unit_mins[6:0],
	
		stopwatch_unit_secs[5:0],
	
		stopwatch_unit_decs[6:0],
	
		stopwatch_overflow
		
	);
	
endmodule
