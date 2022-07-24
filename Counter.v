module Counter(

	input CLK_100Hz,
	
	input reset,
	
	input started,
	
	input paused,
	
	output reg [23:0] cnt
	
);

	initial begin
	
		cnt[23:0] <= 0;
		
	end

	always @(negedge CLK_100Hz or negedge reset) begin
	
		if (~reset) begin
		
			cnt[23:0] <= 0;
		
		end
		
		else if (started || (~started && ~paused)) begin
		
			cnt <= cnt;
		
		end
	
		else if (~started && paused && cnt < 599999) begin
		
			cnt <= cnt + 1;
			
		end
		
		else begin
			
			cnt <= 599999;
			
		end
		
	end

endmodule
