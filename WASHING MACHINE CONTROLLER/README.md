# Washing Machine Controller in Verilog

## Overview

This project implements a Washing Machine Controller using Verilog HDL.
The controller is designed using a Finite State Machine (FSM) to control
different stages of a washing machine, including washing, rinsing, and spinning.

## Features

- FSM-based controller
- Start and stop control
- Washing cycle
- Rinsing cycle
- Spinning cycle
- Done indication
- Testbench for functional verification
- Simulation waveform

## States

The controller consists of the following states:

| State | Description |
|-------|-------------|
| IDLE  | Machine waits for start signal |
| WASH  | Washing operation |
| RINSE | Rinsing operation |
| SPIN  | Spinning operation |
| DONE  | Washing cycle completed |

## State Sequence

IDLE → WASH → RINSE → SPIN → DONE → IDLE

## Inputs

- `clk` - System clock
- `reset` - Reset signal
- `start` - Starts the washing cycle

## Outputs

- `wash` - Indicates washing operation
- `rinse` - Indicates rinsing operation
- `spin` - Indicates spinning operation
- `done` - Indicates completion of the washing cycle

## Tools Used

- Verilog HDL
- ModelSim / Vivado / Icarus Verilog
- GTKWave

## Project Files

- `washing_machine_controller.v` - Main Verilog design
- `washing_machine_controller_tb.v` - Testbench
- `simulation/waveform.png` - Simulation waveform
- `simulation/output.log` - Expected simulation output

## Simulation

The testbench starts the washing machine and verifies the complete sequence:

IDLE → WASH → RINSE → SPIN → DONE → IDLE

The waveform can be viewed using ModelSim, Vivado, or GTKWave.


