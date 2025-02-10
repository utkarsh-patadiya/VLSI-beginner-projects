`timescale 1ns / 1ps

module nor_gate(a,b,c);
    input a,b;
    output c;
    assign c=~(a|b);
//    nor(c,a,b); inbuilt nor gate
endmodule
