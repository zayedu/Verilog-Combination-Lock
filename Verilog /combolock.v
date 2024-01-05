module combolock(Clock, Resetn, switch, enter, change, leds, e_pulse, c_pulse,correct);
	input Clock, Resetn, enter, change;
	input [3:0] switch;
	output reg [0:6] leds;
	
	
	
	output wire e_pulse, c_pulse;
	output reg correct;
	reg [3:1] y, Y = 3'b000;
	reg [3:0] combo = 4'b0110;
	parameter [3:1] START = 3'b000, NEW = 3'b001, WRONG = 3'b010, ALARM = 3'b011, OPEN = 3'b100;
	
	inputcond incon1(Clock, enter, e_pulse);
	inputcond incon2(Clock, change, c_pulse);
	
	reg [3:0] temp = 4'b0110;
	// Check input with combo
	always @(switch, combo) begin
		if (switch == combo) correct = 1;
		else						correct = 0;
	end
	
	// Define the next state combinational circuit
	always @(enter, change) begin
		case (y)
			START: begin
				combo=temp;
				if (c_pulse & correct) Y = NEW;
				else if (e_pulse & correct) Y = OPEN;
				else if ((c_pulse & !correct)|(e_pulse & !correct)) Y = WRONG;
				else Y = START;
				end
			
			NEW: begin
				if (c_pulse || e_pulse) begin
					combo = switch;
					Y = START;
				end else Y = NEW;
				end
				
			WRONG: begin
				if (c_pulse & correct) Y = NEW;
				else if (e_pulse & correct) Y = OPEN;
				else if ((c_pulse & !correct)|(e_pulse & !correct)) Y = ALARM;
				else Y = WRONG;
				end
				
			ALARM: ;
			
			OPEN: if (e_pulse) Y = START;
			
			default: Y = 3'bxxx;
		endcase
	end
	
	// Define the sequential block
	always @(posedge Clock, negedge Resetn) begin
		if (Resetn == 0)
		begin
		y <= START;
		
		temp = 4'b0110;
		end
		else
		begin
		y <= Y;
		temp = combo;
	end
	end
	// Define output
	always @(y) begin
		case (y)
			NEW: leds = 7'b1101010;
			ALARM: leds = 7'b0001000;
			OPEN: leds = 7'b0000001;
			default: leds = 7'b1111110;
		endcase
	end
	
endmodule
