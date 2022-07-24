module GetSecond(

	input CLK_100Hz,

	input [23:0] cnt,
	
	output reg [5:0] stopwatch_unit_secs
	
);

	reg [23:0] temp;
	
	initial begin
	
		temp = 0;
		
	end

	always @(negedge CLK_100Hz) begin
		
		temp = cnt / 100;
	
		temp = temp % 60;

		stopwatch_unit_secs[5:0] = temp[5:0];
		
	end

endmodule