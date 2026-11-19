; Microbenchmark: 64-bit integer addition, C = A + B.
; Registers: r4 = A, r5 = B, r3 = result.
; Purpose: baseline RAW stall cost of load -> add -> store on integer ops.
      .data
A:    .word 10
B:    .word 8
C:    .word 0

      .text
main:
      ld r4,A(r0)
      ld r5,B(r0)
      dadd r3,r4,r5
      sd r3,C(r0)
      halt
