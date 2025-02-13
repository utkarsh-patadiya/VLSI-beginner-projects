`timescale 1ns / 1ps

module dff(d,clk,reset,q);
	input d,clk,reset;
	output reg q;
	always @(posedge clk)
	begin 
		if(reset)
			q<=0;
		else
			q<=d;
	end
endmodule
