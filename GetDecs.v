module GetDecs(

	input CLK_100Hz,

	input [23:0] cnt,
	
	output reg [6:0] stopwatch_unit_decs
	
);

	reg [23:0] temp;
	
	initial begin
	
		temp = 0;
		
	end

	always @(negedge CLK_100Hz) begin
		
		temp = cnt % 100;

		stopwatch_unit_decs[6:0] = temp[6:0];
		
	end

endmodule