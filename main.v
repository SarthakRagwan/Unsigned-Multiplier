// ================================================================
// Module Name   : Multiplier
// Author        : Sarthak Kumar
// Description   : Parameterized Unsigned Multiplier
//                 Multiplies an M-bit number 'A' with an N-bit number 'B'
//                 using generate blocks to create partial products and
//                 then sums them to form the final product 'P'.
// Parameters    : 
//     M : Width of input A (default 3)
//     N : Width of input B (default 2)
// Inputs        : 
//     A : M-bit unsigned multiplicand
//     B : N-bit unsigned multiplier
// Outputs       : 
//     P : (M+N)-bit unsigned product
// ================================================================

module multiplier(A, B, P);
  // Parameter declarations for input widths
  parameter M = 3;
  parameter N = 2;

  // Inputs
  input [M-1:0] A;
  input [N-1:0] B;

  // Output
  output reg [M+N-1:0] P;

  // Partial products: array of N rows, each with M bits
  wire [M-1:0] pp[N-1:0];

  // Generate block to create bitwise AND for each partial product
  generate 
    for (genvar i = 0; i < N; i = i + 1) begin : row
      for (genvar j = 0; j < M; j = j + 1) begin : col
        assign pp[i][j] = A[j] & B[i];  // Bitwise AND to form partial product
      end
    end
  endgenerate

  // Sum all partial products after shifting to get the final product
  integer k;
  always @(*) begin
    P = 0;
    for (k = 0; k < N; k = k + 1) begin
      P = P + (pp[k] << k);  // Shift each partial product according to its bit position and add
    end
  end
endmodule

