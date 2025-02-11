`timescale 1ns / 1ps;

module full_adder(a,b,c,sum,carry);
	input a,b,c;
	output sum,carry;
	assign sum=a^b^c;
	assign carry = (a&b)|(b&c)|(c&a);
	
	// Another way using less gates 
/*
   // Internal wire to calculate sum
	wire s1, c1, c2;

	// sum = a ^ b ^ c
	xor (s1, a, b);
	xor (sum, s1, c);

	// Carry-out = (a & b) | (c & (a ^ b))
	and (c1, a, b);
	and (c2, c, s1);
	or  (Cout, c1, c2);
*/
endmodule
