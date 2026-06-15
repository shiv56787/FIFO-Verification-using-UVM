# FIFO-Verification-using-UVM
Synchronous FIFO verification using UVM methodology in SystemVerilog — Driver, Monitor, Scoreboard, and 5 test sequences included.
 # FIFO Verification using UVM | SystemVerilog

## Overview
Parameterized synchronous FIFO (8-deep, 8-bit) with a complete 
UVM-based testbench including constrained-random and directed tests.

## UVM Components
- Sequence Item, Driver, Monitor, Agent
- Scoreboard (self-checking reference model)
- 5 Sequences: Write, Read, Random, Overflow, Underflow

## Tests
| Test Name           | Description              |
|---------------------|--------------------------|
| fifo_wr_rd_test     | Write then Read sanity   |
| fifo_random_test    | Constrained random mix   |
| fifo_corner_test    | Overflow & Underflow      |

## Tools
- Language: SystemVerilog
- Methodology: UVM 1.2
- Simulator: VCS / Questa

## Run
vcs -sverilog -ntb_opts uvm-1.2 rtl/fifo.sv tb/top/fifo_tb_top.sv -o simv
./simv +UVM_TESTNAME=fifo_random_test
