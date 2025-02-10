`timescale 1ns / 1ps

module and_gate(a,b,c);
    input a,b;
    output c;
    assign c=a&b;
//    and(c,a,b); inbuilt and gate
endmodule
