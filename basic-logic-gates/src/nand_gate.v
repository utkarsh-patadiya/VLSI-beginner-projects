`timescale 1ns / 1ps

module nand_gate(a,b,c);
    input a,b;
    output c;
    assign c=~(a&b);
//    nand(c,a,b); inbuilt nand gate
endmodule
