module combocheck(switch, correct);
	input [3:0] switch;
	reg [3:0] combo = 4'b0110;
	output reg correct;
	
	always @(switch, combo) begin
		if (switch == combo) correct = 1;
		else						correct = 0;
	end
endmodule