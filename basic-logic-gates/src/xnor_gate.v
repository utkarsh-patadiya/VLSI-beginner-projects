`timescale 1ns / 1ps

module xnor_gate(a,b,c);
    input a,b;
    output c;
    assign c=~(a^b);
//    xnor(c,a,b); inbuilt xnor gate
endmodule
