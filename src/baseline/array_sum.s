; Baseline: sum of 12 doubles into a single accumulator.
; Registers: r1 = remaining count, r2 = byte offset, f1 = A[i], f2 = running sum.
; Every add.d depends on the previous one through f2 (serial FP dependency chain).
.data
N: .word 12
A: .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0
sum: .double 0.0
.code
      ld    r1, N(r0)
      dadd  r2, r0, r0
      l.d   f2, sum(r0)
loop: l.d   f1, A(r2)
      add.d f2, f2, f1
      daddi r1, r1, -1
      daddi r2, r2, 8
      bnez  r1, loop
      s.d   f2, sum(r0)
      halt
