# Sequence Detector Verilog Design and Testbench

This repository contains the Verilog design for a **Sequence Detector**, which detects the sequence "1011" in a given input stream, and a testbench for simulating and verifying the functionality of the design.

## Directory Structure

- `src/` : Contains the Verilog design sources, including the `dff` and `sequence_detector` modules.
- `sim/` : Contains simulation results, including waveform files (.wfcg) and PNG images for visualization.
- `tb/` : Contains the testbench file used to simulate the modules and verify their behavior. The main testbench file is `sequence_detector_tb.v`.

## Design Modules Overview

### 1. **D Flip-Flop (DFF)**
The **D Flip-Flop (DFF)** stores a 1-bit value on the positive edge of the clock (`clk`) and can be reset asynchronously via the `reset` signal.

- **Inputs**: 
  - `d`: Data input.
  - `clk`: Clock signal.
  - `reset`: Asynchronous reset signal.
  
- **Outputs**: 
  - `q`: Stored data output.

### 2. **Sequence Detector**
The **Sequence Detector** detects the sequence "1011" in a stream of input data. It uses two D flip-flops to store the state of the detection process and transitions based on the input signal.

- **Inputs**: 
  - `data`: 1-bit input stream to detect the sequence.
  - `clk`: Clock signal.
  - `reset`: Asynchronous reset signal.

- **Outputs**: 
  - `detected`: A signal indicating whether the sequence "1011" has been detected.

### Sequence Detection Logic:
The sequence "1011" is detected by transitioning between states based on the input `data` and the current state of two flip-flops (`Q0` and `Q1`). The detection occurs when the sequence "1011" matches the stored state.

## Running the Simulation

1. Open a new project in Vivado (name it `sequence_detector`).
2. Add `sequence_detector_tb.v` to Simulation sources and all design files in `src/` to Design Sources.
3. Run the simulation and check the output waveform.

## Testbench Overview

The testbench `sequence_detector_tb.v` generates various test cases to simulate the functionality of the sequence detector. It includes:

- **Clock Generation**: A clock signal with a period of 10ns.
- **Reset**: An initial reset to initialize the design.
- **Test Sequences**: Various input data sequences including "1011", partial sequences, overlaps, and edge cases to verify correct detection behavior.

### Example Test Cases:
- **Test Sequence 1**: `1011` (Expected result: Sequence detected)
- **Test Sequence 2**: Overlapping sequences `1011` (Expected result: Multiple detections)
- **Edge Case 1**: `0000` (Expected result: No detection)
- **Edge Case 2**: Incomplete sequence `1010` (Expected result: No detection)

## Simulation Results

Simulation results are stored in the `sim/` directory and include waveform files (`.wfcg`) and PNG images for visual representation of the signal transitions.

---