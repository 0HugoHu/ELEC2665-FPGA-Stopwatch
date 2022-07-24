module ClockDivider50MHzTo100Hz (

	input CLK_50_MHz,
	
	input reset_n,
	
	output reg CLK_100Hz
	
);
	
	reg[23:0] cnt;
	
	initial begin
	
		cnt[23:0] <= 0;
		
		CLK_100Hz <= 0;
		
	end
	
	always @(negedge CLK_50_MHz) begin
	
		if (cnt >= 250000) begin
		
			cnt <= 0;
			
			CLK_100Hz <= ~CLK_100Hz;
			
		end
		
		else if (cnt < 250000) begin
		
			cnt <= cnt + 1;
			
		end
		
		else if (~reset_n) begin
				
			CLK_100Hz = 0;
		
			cnt[23:0] <= 0;
			
		end
		
	end

endmodule
