`timescale 1ns / 1ps

module or_gate(a,b,c);
    input a,b;
    output c;
    assign c=a|b;
//    or(c,a,b); inbuilt or gate
endmodule
