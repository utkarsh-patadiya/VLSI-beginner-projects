# MUX and DEMUX Verilog Design and Testbench

This repository contains Verilog designs for **Multiplexers (MUX)** and **Demultiplexers (DEMUX)**, along with a testbench to simulate and verify their functionality.

## Directory Structure

- `src/` : Contains all the Verilog design sources, including the MUX and DEMUX modules.
- `sim/` : Contains simulation results, including waveform files (.wfcg) and PNG images for visualization.
- `tb/mux_demux_tb.v` : Contains the testbench file used to simulate the modules and verify their behavior.
- `vivado_project/`: Contains Vivado xpr file for the project.

## Design Modules Overview

### 1. **2x1 Multiplexer (MUX)**
A **2x1 MUX** selects one of two input signals (`a` or `b`) based on a 1-bit select signal (`sel`). The selected input is passed to the output when the `enable` signal is active.

### 2. **4x1 Multiplexer (MUX)**
A **4x1 MUX** selects one of four input signals (`In[3:0]`) based on a 2-bit select signal (`Sel`). The selected input is passed to the output when the `enable` signal is active.

### 3. **1x2 Demultiplexer (DEMUX)**
A **1x2 DEMUX** takes a single input signal (`In`) and directs it to one of two outputs (`Out0`, `Out1`) based on a 1-bit select signal (`Sel`).

### 4. **1x4 Demultiplexer (DEMUX)**
A **1x4 DEMUX** takes a single input signal (`In`) and directs it to one of four outputs (`Out[3:0]`) based on a 2-bit select signal (`Sel`).

## Running the Simulation
1. Open a new project in Vivado (name it mux_demux).
2. Add `mux_demux_tb.v` to Simulation source and all design files in `src/` to Design Sources.
3. Run Simulation and check the output waveform.
