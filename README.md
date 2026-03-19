# 16-Bit Pipelined Processor in SystemVerilog

This repository presents a 16-bit pipelined processor developed as a digital design and computer architecture project using SystemVerilog and Intel Quartus Prime Lite.

The design combines HDL modules with Quartus Block Diagram Files (`.bdf`) to implement the processor datapath, control path, pipeline registers, memory blocks, and hazard-management logic. The project is intended to showcase practical FPGA-oriented CPU design, including forwarding, stalling, branching, and modular hardware integration.

## Project Overview

The processor is organized as a multi-stage pipeline with dedicated registers between stages and supporting control logic for instruction flow and data dependencies. The implementation emphasizes:

- datapath and control separation
- modular hardware design in SystemVerilog
- pipeline hazard detection and forwarding
- branch and jump handling
- FPGA workflow familiarity using Quartus Prime Lite

## Architecture

The processor is built around a staged pipeline and supporting subsystems:

```text
Instruction Fetch
  PC -> Instruction Memory -> IF/ID

Instruction Decode
  Register File -> Control Unit -> Immediate Generator -> Branch Logic

Execute
  Forwarding Logic -> ALU Control -> ALU -> ID/EX and EX/MEM pipeline flow

Memory
  Data Memory access through RAM block

Write Back
  Result selection -> Register File update
```

### Main Architectural Blocks

- `Block_proccesor.bdf`: top-level system integration for the processor datapath and control connections.
- `ALU.bdf` and `ALU_32.sv`: arithmetic and logic execution path, including ALU control and shift/rotate support.
- `IF_ID.sv`, `ID_EX.sv`, `EX_MEM.sv`, `ME_WB.sv`: pipeline registers that isolate stage behavior and move control/data signals across the pipeline.
- `control_Unit.sv` and `ALU_CU.sv`: core instruction decode and ALU operation selection logic.
- `ForwardingUnit.sv`, `HazardDetection.sv`, `BranchForwardingUnit.sv`, `BranchHazardUnit.sv`: hazard mitigation logic used to reduce incorrect execution caused by data and branch dependencies.
- `rgfile.bdf`, `register0.sv`, `rg.sv`: register file implementation and supporting register modules.
- `instruction_memory.sv`, `rom_init.hex`, `rammem.v`: instruction and data memory components used by the processor.

## Key Features

- 16-bit processor datapath
- pipelined execution model
- forwarding support for dependent instructions
- hazard detection and stall/flush control
- branch and jump support
- Quartus-based schematic and HDL co-design
- Cyclone V target configuration

## Toolchain

- Intel Quartus Prime Lite 18.1
- Target FPGA family: Cyclone V
- Target device: `5CSEMA6F31C6`
- Languages and formats: SystemVerilog and Quartus Block Diagram Files (`.bdf`)

## Repository Structure

- `*.sv`, `*.v`: source HDL modules for datapath, control, pipeline registers, and memory.
- `*.bdf`: Quartus schematic files used to integrate major hardware blocks.
- `ALUPROJECT.qpf`, `ALUPROJECT.qsf`: Quartus project and settings files.
- `rom_init.hex`: instruction memory initialization contents.

## How To Open and Build

1. Open `ALUPROJECT.qpf` in Quartus Prime Lite.
2. Confirm the top-level entity is `Block_proccesor`.
3. Compile the project from Quartus.

## What This Project Demonstrates

This project highlights practical experience with:

- processor datapath design
- control-path development
- hardware pipelining
- dependency handling through forwarding and hazard detection
- schematic and HDL integration in an FPGA development workflow

## Notes

- Generated Quartus databases and output folders are intentionally excluded from version control.
- The repository is structured to showcase the source design rather than temporary build artifacts.
- This project is best presented as a digital design, FPGA, and computer architecture portfolio piece.

## Future Improvements

- add automated testbenches
- reduce remaining synthesis warnings
- remove legacy or duplicate source files
- add board-specific timing and pin constraints for deployment
