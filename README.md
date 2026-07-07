# SPI-protcol-complete-Rtl-to-GdsII-flow
Complete RTL-to-GDSII implementation of an 8-bit SPI Master-Slave controller on 90nm GPDK using Cadence Xcelium, Genus, and Innovus 21.15. Covers functional verification, logic synthesis, floorplanning, placement, clock tree synthesis, routing, and GDS export. Achieves 100MHz timing closure with 0 DRC violations on a 55×54µm core.
# 8-bit SPI Master-Slave Controller — RTL to GDSII

Complete RTL-to-GDSII implementation of an 8-bit SPI Master-Slave 
controller using Cadence toolchain on 90nm GPDK process.

## Design Specifications
- **Technology:** 90nm GPDK (Cadence Generic PDK)
- **Tool Flow:** Xcelium → Genus → Innovus
- **Target Frequency:** 100 MHz
- **Core Area:** 55.97 × 54.81 µm (65% utilization)
- **Standard Cells:** 479 cells (gsclib090)
- **Gate Count:** ~1,986 instances

## Flow Stages
| Stage | Tool | Status |
|---|---|---|
| RTL Simulation | Xcelium 22.09 | 14/14 checks PASSED |
| Logic Synthesis | Genus 21.14 | WNS +7387ps, TNS 0ps |
| Floorplan | Innovus 21.15 | 55.97×54.81µm core |
| Placement | Innovus 21.15 | 142 instances placed |
| CTS | Innovus 21.15 | 69 flip-flops |
| Routing | Innovus 21.15 | 0 DRC violations |
| GDS Export | Innovus 21.15 | spi_final.gds |

## Key Results
- **WNS:** +7.387ns (no setup violations)
- **DRC Violations:** 0
- **Metal Stack:** Metal1–Metal9 (90nm GPDK)
- **Power Rings:** Metal5/Metal6
- **Power Stripes:** Metal5 vertical

## Repository Structure
- `rtl/` — Verilog RTL source (spi_top.v)
- `constraints/` — SDC timing constraints
- `scripts/` — Synthesis (synth.tcl) and PnR (innovus.tcl) scripts
- `results/` — GDS, netlist, timing/area/power reports
