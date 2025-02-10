`timescale 1ns / 1ps

module xor_gate(a,b,c);
    input a,b;
    output c;
    assign c=a^b;
//    xor(c,a,b); inbuilt xor gate
endmodule
