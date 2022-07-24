module SevenSegEncoder(

	input [6:0] stopwatch_unit_mins,
	
	input [5:0] stopwatch_unit_secs,
	
	input [6:0] stopwatch_unit_decs,
	
	output [7:0] hex_10_mins,
	
	output [7:0] hex_1_min,
	
	output [7:0] hex_10_secs,
	
	output [7:0] hex_1_sec,
	
	output [7:0] hex_hundredths,
	
	output [7:0] hex_tenths
	
);

	wire [11:0] BCDOut1;
	
	wire [11:0] BCDOut2;
	
	wire [11:0] BCDOut3;
	
	reg [3:0] dec_10_mins;
	
	reg [3:0] dec_1_min;
	
	reg [3:0] dec_10_secs;
	
	reg [3:0] dec_1_sec;
	
	reg [3:0] dec_hundredths;
	
	reg [3:0] dec_tenths;
	
 
	BCDEncoder b0({1'b0, stopwatch_unit_mins[6:0]}, BCDOut1);
	
	BCDEncoder b1({1'b0, 1'b0, stopwatch_unit_secs[5:0]}, BCDOut2);
	
	BCDEncoder b2({1'b0, stopwatch_unit_decs[6:0]}, BCDOut3);
	
	always @ (*) begin
	
		dec_10_mins[3:0] <= BCDOut1[7:4];
		
		dec_1_min[3:0] <= BCDOut1[3:0];
		
		dec_10_secs[3:0] <= BCDOut2[7:4];
	
		dec_1_sec[3:0] <= BCDOut2[3:0];
		
		dec_hundredths[3:0] <= BCDOut3[7:4];
		
		dec_tenths[3:0] <= BCDOut3[3:0];
		
	end
	
	SevenSegDisplay dis0(
	
		dec_hundredths[3:0],
		
		hex_hundredths[7:0]
		
	);
	
	SevenSegDisplay dis1(
	
		dec_tenths[3:0],
		
		hex_tenths[7:0]
		
	);
	
	SevenSegDisplay dis2(
	
		dec_1_sec[3:0],
		
		hex_1_sec[7:0]
		
	);
	
	SevenSegDisplay dis3(
	
		dec_10_secs[3:0],
		
		hex_10_secs[7:0]
		
	);
	
	SevenSegDisplay dis4(
	
		dec_1_min[3:0],
		
		hex_1_min[7:0]
		
	);
	
	SevenSegDisplay dis5(
	
		dec_10_mins[3:0],
		
		hex_10_mins[7:0]
		
	);
	
endmodule
