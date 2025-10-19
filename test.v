`timescale 10ns/1ns
`include "main.v"

module tb;
  // Parameters matching the multiplier module
  parameter M = 3;
  parameter N = 2;

  // Testbench signals
  reg [M-1:0] A;             // Multiplicand
  reg [N-1:0] B;             // Multiplier
  wire [M+N-1:0] P;          // Product

  // Instantiate the multiplier module
  multiplier dut(A, B, P);

  integer i, j;  // Loop indices

  initial begin
    // VCD dump for waveform viewing in GTKWave or other simulators
    $dumpfile("test.vcd");
    $dumpvars(0, tb);

    // Monitor to print simulation values in console
    $monitor("A = %d  |  B = %d  |  P = %d", A, B, P);

    // Exhaustive test: iterate through all combinations of A and B
    for (i = 0; i < (1 << M); i = i + 1) begin
      for (j = 0; j < (1 << N); j = j + 1) begin
        #5;           // Wait for 5 time units before updating inputs
        A = i;        // Apply multiplicand
        B = j;        // Apply multiplier
      end
    end

    #5 $finish;      // End simulation after all tests
  end
endmodule