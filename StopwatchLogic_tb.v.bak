`timescale 1 ns / 100 ps

module SevenSegEncoder_tb;
	
	reg [6:0] stopwatch_unit_mins;
	
	reg [5:0] stopwatch_unit_secs;
	
	reg [6:0] stopwatch_unit_decs;
	
	wire [7:0] hex_10_mins;
	
	wire [7:0] hex_1_min;
	
	wire [7:0] hex_10_secs;
	
	wire [7:0] hex_1_sec;
	
	wire [7:0] hex_hundredths;
	
	wire [7:0] hex_tenths;
	
	SevenSegEncoder dut(
	
		stopwatch_unit_mins[6:0],
	
		stopwatch_unit_secs[5:0],
	
		stopwatch_unit_decs[6:0],
	
		hex_10_mins[7:0],
	
		hex_1_min[7:0],
	
		hex_10_secs[7:0],
	
		hex_1_sec[7:0],
	
		hex_hundredths[7:0],
	
		hex_tenths[7:0]
		
	);
	
	integer i, j, k;
	
	initial begin
		
		for (i=0;i<20;i=i+1) begin
			
			for (j=0;j<20;j=j+1) begin
			
				for (k=0;k<20;k=k+1) begin
		
					$display("Test for (i,j,k) = (%d,%d,%d)",i,j,k);
					
					stopwatch_unit_mins = i;
					
					stopwatch_unit_secs = j;
					
					stopwatch_unit_decs = k;
					
					#10;
					
				end
				
			end
		
		end
		
		$stop;
		
	end
	
endmodule
