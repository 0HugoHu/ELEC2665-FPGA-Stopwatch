 module BCDEncoder(
 
    input [7:0] BinaryIn,
	 
    output reg [11:0] BCDOut
	 
);
    
	reg [3:0] i;   
		  
	always @(BinaryIn)

	  begin
	  
			BCDOut = 0; 
			
			for (i = 4'd0; i < 4'd8; i = i + 4'd1) begin
			
				 BCDOut = {BCDOut[10:0],BinaryIn[7-i]}; 
					  
				 if(i < 7 && BCDOut[3:0] > 4) 
				 
					  BCDOut[3:0] = BCDOut[3:0] + 4'd3;
					  
				 if(i < 7 && BCDOut[7:4] > 4)
				 
					  BCDOut[7:4] = BCDOut[7:4] + 4'd3;
					  
				 if(i < 7 && BCDOut[11:8] > 4)
				 
					  BCDOut[11:8] = BCDOut[11:8] + 4'd3;  
				  
			end
			
	end     
				 
endmodule
