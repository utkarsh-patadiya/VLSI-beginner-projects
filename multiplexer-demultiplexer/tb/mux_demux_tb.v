`timescale 1ns / 1ps

// Testbench for all modules (MUX and Demux)
module mux_demux_tb;
    // Inputs for 2x1 MUX
    reg a, b, sel, enable;
    wire out_mux_2x1; // Output of 2x1 MUX

    // Inputs for 4x1 MUX
    reg [3:0] In_4x1;
    reg [1:0] Sel_4x1;
    wire out_mux_4x1; // Output of 4x1 MUX

    // Inputs for 1x2 DEMUX
    reg In_1x2, Sel_1x2;
    wire Out0_demux_1x2, Out1_demux_1x2; // Outputs of 1x2 DEMUX

    // Inputs for 1x4 DEMUX
    reg In_1x4_demux;
    reg [1:0] Sel_1x4_demux;
    wire [3:0] Out_demux_1x4; // Outputs of 1x4 DEMUX

    // Instantiate the 2x1 MUX
    mux_2x1 uut_mux_2x1 (
        .a(a),
        .b(b),
        .sel(sel),
        .enable(enable),
        .out(out_mux_2x1)
    );

    // Instantiate the 4x1 MUX
    mux_4x1 uut_mux_4x1 (
        .In(In_4x1),
        .Sel(Sel_4x1),
        .Enable(enable),
        .Out(out_mux_4x1)
    );

    // Instantiate the 1x2 DEMUX
    demux_1x2 uut_demux_1x2 (
        .In(In_1x2),
        .Sel(Sel_1x2),
        .Out0(Out0_demux_1x2),
        .Out1(Out1_demux_1x2)
    );

    // Instantiate the 1x4 DEMUX
    demux_1x4 uut_demux_1x4 (
        .In(In_1x4_demux),
        .Sel(Sel_1x4_demux),
        .Out(Out_demux_1x4)
    );

    // Test sequence
    initial begin
        // Testing 2x1 MUX
        $display("Testing 2x1 MUX");
        a = 0; b = 1; sel = 0; enable = 1; #10; // Expected output: a = 0
        a = 0; b = 1; sel = 1; enable = 1; #10; // Expected output: b = 1
        a = 1; b = 0; sel = 0; enable = 1; #10; // Expected output: a = 1
        a = 1; b = 0; sel = 1; enable = 1; #10; // Expected output: b = 0

        // Testing 4x1 MUX
        $display("Testing 4x1 MUX");
        In_4x1 = 4'b1100; Sel_4x1 = 2'b00; enable = 1; #10; // Expected output: In[0] = 1
        In_4x1 = 4'b1100; Sel_4x1 = 2'b01; enable = 1; #10; // Expected output: In[1] = 1
        In_4x1 = 4'b1100; Sel_4x1 = 2'b10; enable = 1; #10; // Expected output: In[2] = 0
        In_4x1 = 4'b1100; Sel_4x1 = 2'b11; enable = 1; #10; // Expected output: In[3] = 0

        // Testing 1x2 Demux
        $display("Testing 2x1 DEMUX");
        In_1x2 = 1; Sel_1x2 = 0; #10; // Expected output: Out0 = 1, Out1 = 0
        In_1x2 = 1; Sel_1x2 = 1; #10; // Expected output: Out0 = 0, Out1 = 1

        // Testing 1x4 Demux
        $display("Testing 4x1 DEMUX");
        In_1x4_demux = 1; Sel_1x4_demux = 2'b00; #10; // Expected output: Out[0] = 1
        In_1x4_demux = 1; Sel_1x4_demux = 2'b01; #10; // Expected output: Out[1] = 1
        In_1x4_demux = 0; Sel_1x4_demux = 2'b10; #10; // Expected output: Out[2] = 0
        In_1x4_demux = 1; Sel_1x4_demux = 2'b11; #10; // Expected output: Out[3] = 1

        // Finish the simulation
        $finish;
    end
endmodule