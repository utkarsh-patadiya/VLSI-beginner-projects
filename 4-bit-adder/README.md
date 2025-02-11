# Four Bit Adder
This project implements Four Bit Adder using Verilog (using Vivado).

## Files
- `src/full_adder.v`: Implements full adder using basic gates.
- `src/adder_4_bit.v`: Implements four bit adder using 4 full adders.
- `tb/adder_4_bit_tb.v` : Testbench for verification.
- `sim/`: Contains output waveform with an png.
- `vivado_project/`: Contains Vivado xpr file for the project.

## Running the Simulation
1. Open a new project in Vivado (name it adder_4_bit).
2. Add `adder_4_bit_tb.v` to Simulation source and all design files in `src/` to Design Sources.
3. Run Simulation and check the output waveform.
