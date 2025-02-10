`timescale 1ns / 1ps

module basic_gates_tb( );
	reg a,b;
	wire and_gate_wire,or_gate_wire,not_gate_wire,nand_gate_wire,nor_gate_wire,xor_gate_wire,xnor_gate_wire;
	
	and_gate ag(a,b,and_gate_wire);
	
	or_gate og(a,b,or_gate_wire);
	
	not_gate ng(a,not_gate_wire);
	
	nand_gate nag(a,b,nand_gate_wire);
	
	nor_gate nog(a,b,nor_gate_wire);
	
	xor_gate xg(a,b,xor_gate_wire);
	
	xnor_gate xng(a,b,xnor_gate_wire);
	
	initial begin
	
	        a = 0; b = 0; #10;  // Test case 1	        
	        a = 0; b = 1; #10;  // Test case 2     
	        a = 1; b = 0; #10;  // Test case 3
	        a = 1; b = 1; #10;  // Test case 4

	        $finish;
	    end
endmodule
