module inputcond(Clock, w, z);
	input Clock, w;
	output z;
	reg [2:1] y, Y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10;
	
	// Define the next state combinational circuit
	always @(w, y) begin
		case (y)
			A: if (w) Y = A;
				else	 Y = B;
			B: if (w) Y = A;
				else	 Y = C;
			C: if (w) Y = A;
				else 	 Y = C;
			default: Y = 2'bxx;
		endcase
	end
	
	// Define the sequential block
	always @(posedge Clock)
		y <= Y;
	
	// Define output
	assign z = (y == B);
	
endmodule
