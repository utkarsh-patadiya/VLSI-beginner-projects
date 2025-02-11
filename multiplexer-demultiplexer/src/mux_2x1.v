`timescale 1ns / 1ps

module mux_2x1(a,b,sel,enable,out);
	input a,b,sel,enable;
	output out;
	assign out = enable & (( ~sel & a ) | ( sel & b ));
endmodule
