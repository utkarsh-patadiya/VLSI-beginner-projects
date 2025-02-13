`timescale 1ns / 1ps

module sequence_detector_tb();
    reg clk;
    reg reset;
    reg data;
    wire detected;

    // Instantiate the sequence_detector module
    sequence_detector uut (
        .data(data),
        .clk(clk),
        .reset(reset),
        .detected(detected)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        data = 0;

        // Reset the DUT
        #10 reset = 0;

        // Test sequence: 1011 (should detect the sequence)
        #10 data = 1;  // First '1'
        #10 data = 0;  // Second '0'
        #10 data = 1;  // Third '1'
        #10 data = 1;  // Fourth '1' - Sequence "1011" detected

        // Additional test: Overlap check
        #10 data = 1;  // Overlap starts again with '1' (second "1011")
        #10 data = 0;  // '0'
        #10 data = 1;  // '1'
        #10 data = 1;  // '1' - Another "1011" detected

        // Edge case 1: No match (shouldn't detect anything)
        #10 data = 0;  // '0'
        #10 data = 1;  // '1'
        #10 data = 0;  // '0'
        #10 data = 0;  // '0' - No sequence "1011"

        // Edge case 2: Sequence starts but doesn't complete (no detection)
        #10 data = 1;  // First '1'
        #10 data = 0;  // Second '0'
        #10 data = 1;  // Third '1'
        #10 data = 0;  // Fourth '0' - Partial sequence, no detection

        // Edge case 3: Multiple sequences with interspersed data (testing multiple detections)
        #10 data = 1;  // First '1' (start of sequence)
        #10 data = 0;  // '0'
        #10 data = 1;  // '1'
        #10 data = 1;  // '1' - First sequence "1011" 
        #10 data = 0;  // '0'
        #10 data = 1;  // '1'
        #10 data = 1;  // '1' - Second sequence "1011" (overlapping)
        
        // Edge case 4: No sequence, all zeros
        #10 data = 0;  // No sequence
        #10 data = 0;  // No sequence
        #10 data = 1;  // No sequence
        #10 data = 0;  // No sequence

        // End of simulation
        #20 $finish;
    end

    // Monitor detected output
    initial begin
        $monitor("Time = %0t, data = %b, detected = %b", $time, data, detected);
    end
endmodule
