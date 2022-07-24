module SevenSegDisplay(

	input [3:0] value,
	
	output reg [7:0] result
	
);

	always @ (value) begin
	
		case(value)
		
			4'b0000: result = 8'b11000000; // "0"
			
			4'b0001: result = 8'b11111001; // "1" 
			
			4'b0010: result = 8'b10100100; // "2" 
			
			4'b0011: result = 8'b10110000; // "3" 
			
			4'b0100: result = 8'b10011001; // "4" 
			
			4'b0101: result = 8'b10010010; // "5" 
			
			4'b0110: result = 8'b10000010; // "6" 
			
			4'b0111: result = 8'b11111000; // "7" 
			
			4'b1000: result = 8'b10000000; // "8"  
			
			4'b1001: result = 8'b10010000; // "9" 
			
			default: result = 8'b11000000; // "0"
		  
		endcase
		
	end

endmodule
