`timescale 1ns / 1ps

module demux_1x4(In,Sel,Out);
	input In;
	input [1:0] Sel;
	output [3:0] Out;
	
	assign Out[0] = In & ~Sel[0] & ~Sel[1]; // When Sel = 00, pass In to Out0
	assign Out[1] = In & Sel[0] & ~Sel[1];  // When Sel = 01, pass In to Out1
	assign Out[2] = In & ~Sel[0] & Sel[1];  // When Sel = 10, pass In to Out2
	assign Out[3] = In & Sel[0] & Sel[1];   // When Sel = 11, pass In to Out3
endmodule
