; Optimized: DAXPY, Y[i] = A * X[i] + Y[i], 12 doubles, unrolled by 4.
; Registers: f0 = A, r3/r4 = X/Y pointers, r2 = remaining count, f1..f8 = four independent lanes.
; Technique: loop unrolling by 4 with grouped loads, four independent mul.d/add.d chains,
; and pointer/counter updates interleaved between dependent FP operations.
      .data
A:    .double 10.0
X:    .double 8.0, 1.0,2.0,3.0,4.0,5.0,7.0,8.0,9.0,10.0,11.0,12.0
Y:    .double 3.0,14.0,13.0,4.0,8.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0
N:    .word 12

 .code
      l.d   f0, A(r0)
      daddi r3, r0, X
      daddi r4, r0, Y
      ld    r2, N(r0)
loop: l.d   f1, 0(r3)
      l.d   f3, 8(r3)
      l.d   f5, 16(r3)
      l.d   f7, 24(r3)
      mul.d f1, f1, f0
      mul.d f3, f3, f0
      mul.d f5, f5, f0
      mul.d f7, f7, f0
      l.d   f2, 0(r4)
      l.d   f4, 8(r4)
      l.d   f6, 16(r4)
      l.d   f8, 24(r4)
      daddi r2, r2, -4
      daddi r3, r3, 32
      add.d f2, f2, f1
      add.d f4, f4, f3
      add.d f6, f6, f5
      add.d f8, f8, f7
      s.d   f2, 0(r4)
      s.d   f4, 8(r4)
      s.d   f6, 16(r4)
      s.d   f8, 24(r4)
      daddi r4, r4, 32
      bne   r2, r0, loop
      halt
