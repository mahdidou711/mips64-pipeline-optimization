; Optimized: sum of 12 doubles with two independent accumulators.
; Registers: r1 = remaining count, r2 = pointer, f2/f4 = partial sums, f1/f3 = loaded elements.
; Technique: unrolling by 2 with multiple accumulators splits the serial add.d chain;
; the partial sums are combined once after the loop (both start from the zero-valued sum).
.data
N: .word 12
A: .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0
sum: .double 0.0
.code
      ld    r1, N(r0)
      daddi r2, r0, A
      l.d   f2, sum(r0)
      l.d   f4, sum(r0)
loop: l.d   f1, 0(r2)
      l.d   f3, 8(r2)
      add.d f2, f2, f1
      add.d f4, f4, f3
      daddi r1, r1, -2
      daddi r2, r2, 16
      bnez  r1, loop
      add.d f2, f2, f4
      s.d   f2, sum(r0)
      halt
