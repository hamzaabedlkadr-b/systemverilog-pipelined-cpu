# 16-Bit Pipelined Processor in SystemVerilog

This repository contains an academic digital design project that implements a small pipelined processor using SystemVerilog and Intel Quartus schematic blocks.

The project focuses on CPU datapath and control integration rather than application software. It combines HDL modules with Quartus Block Diagram Files to model a multi-stage processor with hazard handling, forwarding, instruction memory, and data memory.

## Highlights

- 16-bit processor datapath
- Multi-stage pipeline with dedicated pipeline registers
- Control unit plus ALU control logic
- Forwarding and hazard-detection units
- Branch support and immediate generation
- Register file, instruction memory, and data memory
- Built for Intel Cyclone V in Quartus Prime Lite

## Main Files

- `Block_proccesor.bdf`: top-level processor integration
- `ALU.bdf`: ALU subsystem integration
- `instruction_memory.sv`: instruction ROM loader
- `rammem.v`: data memory block
- `IF_ID.sv`, `ID_EX.sv`, `EX_MEM.sv`, `ME_WB.sv`: pipeline registers
- `control_Unit.sv`, `ALU_CU.sv`: control path
- `ForwardingUnit.sv`, `HazardDetection.sv`, `BranchForwardingUnit.sv`, `BranchHazardUnit.sv`: pipeline hazard logic

## Toolchain

- Intel Quartus Prime Lite 18.1
- Cyclone V target device: `5CSEMA6F31C6`
- SystemVerilog + Quartus `.bdf` schematic design files

## How To Open

1. Open `ALUPROJECT.qpf` in Quartus Prime.
2. Confirm the top-level entity is `Block_proccesor`.
3. Compile the project from Quartus.

## What This Project Demonstrates

- Datapath/control partitioning
- Pipeline register design
- Hazard mitigation with forwarding and stalling logic
- FPGA-oriented project organization in Quartus
- Mixing HDL modules with schematic-level integration

## Repository Notes

- Generated Quartus databases and output folders are intentionally excluded from version control.
- This repo is meant to showcase the source design itself, not temporary build artifacts.
- The project is strongest as a digital design / computer architecture portfolio piece.

## Next Improvements

- Add an automated testbench flow
- Reduce remaining Quartus warnings
- Clean up legacy or duplicate files
- Add board-specific constraints if targeting deployment hardware
