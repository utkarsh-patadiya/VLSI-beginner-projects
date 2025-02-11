`timescale 1ns / 1ps

module demux_1x2(In,Sel,Out0,Out1);
	input In,Sel;
	output Out0,Out1;
	assign { Out0 , Out1 } = { ~Sel & In , Sel & In};
endmodule
