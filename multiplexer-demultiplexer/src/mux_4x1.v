`timescale 1ns / 1ps

module mux_4x1(In,Sel,Enable,Out);
	input [3:0] In;
	input [1:0] Sel;
	input Enable;
	output Out;
	assign Out = Enable & (
								( In[0] & ~Sel[0] & ~Sel[1] ) |
								( In[1] &   Sel[0] & ~Sel[1] ) | 
								( In[2] & ~Sel[0] &   Sel[1] ) |
								( In[3] &   Sel[0] &   Sel[1] )
								) ;
	
	// Using 2x1 Mux's
/*
	wire m1,m2;
	mux_2x1 mux1( In[0] , In[1] , Sel[0] , m1);
	mux_2x1 mux2( In[1] , In[2] , Sel[0] , m1);
	mux_2x1 mux3( m1 , m2 , Sel[1] , Out);
	assign Out = Enable&Out;
*/

endmodule
