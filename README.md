# Project P.H.A.N.T.O.M
### Pipelined Hardware Architecture Natively Targeting Original Microarchitecture

> A cycle-accurate RV32I pipelined processor implemented in SystemVerilog, targeting the Altera MAX10 FPGA.

---

## Overview

P.H.A.N.T.O.M is a from-scratch implementation of the RISC-V RV32I ISA using a classic 5-stage pipeline, built as a direct replica of the pipelined datapath from Patterson & Hennessy. The goal was to go beyond simulation — synthesizing a fully functional processor onto real hardware, complete with forwarding, hazard handling, and (eventually) caching.

---

## Architecture

### Pipeline Stages
| Stage | Description |
|-------|-------------|
| IF | Instruction Fetch — PC logic, instruction memory |
| ID | Instruction Decode — register file read, control signals |
| EX | Execute — ALU, branch resolution |
| MEM | Memory Access — data memory read/write |
| WB | Write Back — result written to register file |

### Datapath Diagram
```
[ Insert block diagram here ]
```

### Key Features
- **Forwarding Unit** — resolves EX-EX and MEM-EX data hazards without stalls
- **Hazard Detection Unit** — detects load-use hazards, inserts pipeline stalls
- **Branch Handling** — flush on taken branches
- **Caching** *(in progress)* — L1 instruction and data cache

---

## Supported Instructions

Full RV32I base integer ISA:
- R-type: `ADD`, `SUB`, `AND`, `OR`, `XOR`, `SLL`, `SRL`, `SRA`, `SLT`, `SLTU`
- I-type: `ADDI`, `ANDI`, `ORI`, `XORI`, `SLTI`, `SLTIU`, `SLLI`, `SRLI`, `SRAI`, `LW`, `JALR`
- S-type: `SW`
- B-type: `BEQ`, `BNE`, `BLT`, `BGE`, `BLTU`, `BGEU`
- U-type: `LUI`, `AUIPC`
- J-type: `JAL`

---

## Repo Structure

```
PHANTOM/
├── rtl/
│   ├── core/
│   │   ├── fetch.sv
│   │   ├── decode.sv
│   │   ├── execute.sv
│   │   ├── mem.sv
│   │   └── writeback.sv
│   ├── hazard/
│   │   ├── forwarding_unit.sv
│   │   └── hazard_detection.sv
│   ├── memory/
│   │   ├── instr_mem.sv
│   │   └── data_mem.sv
│   └── top.sv
├── tb/
│   ├── tb_top.sv
│   └── tests/
├── constraints/
│   └── max10.qsf
├── scripts/
└── README.md
```

---

## Getting Started

### Tools Required
- **Quartus Prime** (Lite Edition is fine for MAX10)
- **ModelSim-Intel** or QuestaSim for simulation
- **RISC-V GNU Toolchain** (for compiling test programs)

### Simulate
```bash
# From repo root
vsim -do scripts/sim.do
```

### Synthesize & Flash
1. Open `PHANTOM.qpf` in Quartus
2. Run Analysis & Synthesis → Place & Route → Assembler
3. Flash via Quartus Programmer to the MAX10

---

## Testing & Verification

| Test | Description | Status |
|------|-------------|--------|
| ALU ops | All R/I-type arithmetic | ✅ |
| Load/Store | LW/SW with hazard cases | ✅ |
| Forwarding | EX-EX and MEM-EX paths | ✅ |
| Stall (load-use) | Pipeline stall insertion | ✅ |
| Branch flush | BEQ/BNE taken path | ✅ |
| Full program | Fibonacci, bubble sort | 🔄 |

---

## Known Limitations & Future Work

- [ ] Caching (L1 I$ and D$)
- [ ] RV32M extension (multiply/divide)
- [ ] Exceptions and trap handling
- [ ] Move to a larger FPGA (Cyclone V / DE1-SoC)
- [ ] Branch predictor (static → dynamic)

---

## References

- Patterson & Hennessy — *Computer Organization and Design: RISC-V Edition*
- [RISC-V ISA Specification](https://riscv.org/technical/specifications/)
- Altera MAX10 FPGA Device Handbook