`timescale 1ns / 1ps

module sequence_detector(data,clk,reset,detected);
	input data,clk,reset;
	output detected;
	
	wire Q0,Q1; // Internal wires for storing the state of the sequence

	// State transition logic: Define how states change for detecting "1011"
	// First flip-flop (Q0) - Transitions based on the combination of data and Q0/Q1
	dff dff0 (
		.d((~data & Q0) | (data & ~Q0 & Q1)), // Transition logic for Q0
		.clk(clk),
		.reset(reset),
		.q(Q0)
	);
	
	// Second flip-flop (Q1) - Tracks the next state after Q0
	dff dff1 (
		.d(data),  // Q1 transitions based on the current data bit
		.clk(clk),
		.reset(reset),
		.q(Q1)
	);
	
	assign detected = data&Q0&Q1;
	
endmodule
