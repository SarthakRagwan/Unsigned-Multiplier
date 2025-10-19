# Unsigned-Multiplier
Parameterizable unsigned multiplier in Verilog with exhaustive testbench. Generates partial products using generate blocks and sums them to produce the final product. Suitable for FPGA/ASIC simulation.

Author: Sarhak Kumar

Overview

This repository contains a parameterized unsigned multiplier written in Verilog. It multiplies two binary numbers of configurable widths using partial products and bitwise addition. The design is modular, readable, and suitable for FPGA/ASIC implementation.

Module: multiplier.v
Parameters

M : Width of the multiplicand A (default = 6)

N : Width of the multiplier B (default = 4)

Inputs

A : M-bit unsigned multiplicand

B : N-bit unsigned multiplier

Outputs

P : (M+N)-bit unsigned product

Theory

An unsigned multiplier works by generating partial products for each bit of the multiplier and then summing them appropriately:

Each bit of B is ANDed with all bits of A to form a partial product.

Each partial product is shifted according to its bit position in B.

All shifted partial products are summed to obtain the final product P.

This design uses generate blocks to create partial products dynamically based on parameterized widths.

Testbench: tb.v

The testbench verifies the multiplier by exhaustively testing all possible input combinations:

Loops over all values of A and B using for loops.

Applies a small delay (#5) between each input combination.

Monitors and prints the inputs and resulting product to the console.

Dumps simulation data to a .vcd file for waveform viewing.

This ensures the multiplier works correctly for all input combinations of the defined widths.

Example Output

A = 0  |  B = 2  |  P =  0

A = 1  |  B = 3  |  P =  3

A = 2  |  B = 3  |  P =  6

A = 3  |  B = 3  |  P =  9

A = 4  |  B = 1  |  P =  4

A = 5  |  B = 3  |  P = 15

A = 6  |  B = 2  |  P = 12

A = 7  |  B = 3  |  P = 21


Features

Fully parameterized (adjust M and N).

Uses structural Verilog concepts (generate blocks).

Exhaustive testbench for verification.

Ready for FPGA or ASIC implementation.

