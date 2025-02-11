`timescale 1ns / 1ps;

module adder_4_bit_tb();
    reg [3:0] A;        // 4-bit input A
    reg [3:0] B;        // 4-bit input B
    reg Cin;            // Carry input
    wire [3:0] Sum;     // 4-bit Sum output
    wire Cout;          // Carry output

    // Instantiate the 4-bit adder
    adder_4_bit UUT (
        A,B,Cin,Sum,Cout
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;
        
        // Apply test vectors
        #10 A = 4'b0101; B = 4'b0011; Cin = 0;  // Test case 1
        #10 A = 4'b1100; B = 4'b1010; Cin = 0;  // Test case 2
        #10 A = 4'b1111; B = 4'b0001; Cin = 1;  // Test case 3
        #10 A = 4'b1001; B = 4'b0110; Cin = 0;  // Test case 4
        #10 A = 4'b1110; B = 4'b1001; Cin = 1;  // Test case 5

        // Finish simulation
        #10 $finish;
    end
endmodule
