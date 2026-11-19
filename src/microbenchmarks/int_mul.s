; Microbenchmark: 64-bit integer multiplication, C = A * B.
; Registers: r4 = A, r5 = B, r3 = low 64 bits of the product (via mflo).
; Purpose: RAW stall cost of dmult/mflo compared with a plain integer add.
      .data
A:    .word 2
B:    .word 3
C:    .word 0

      .text
main:
      ld r4,A(r0)
      ld r5,B(r0)
      dmult r4,r5
      mflo r3
      sd r3, C(r0)
      halt
