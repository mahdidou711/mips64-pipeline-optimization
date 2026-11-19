; Optimized: alternating update over 12 doubles, B[i] -= A[i] (even i), B[i] += A[i] (odd i).
; Registers: r1 = remaining count, r3/r4 = A/B pointers, f1/f2 = even pair, f3/f4 = odd pair.
; Technique: unrolling by 2 resolves the parity statically, removing the parity test,
; the branch and the jump; stores use negative offsets after the pointer update.
.data
N: .word 12
A: .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0
B: .double 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0
.code
      ld    r1, N(r0)
      daddi r3, r0, A
      daddi r4, r0, B
loop: l.d   f1, 0(r3)
      l.d   f2, 0(r4)
      l.d   f3, 8(r3)
      l.d   f4, 8(r4)
      sub.d f2, f2, f1
      add.d f4, f4, f3
      daddi r1, r1, -2
      daddi r3, r3, 16
      daddi r4, r4, 16
      s.d   f2, -16(r4)
      s.d   f4, -8(r4)
      bnez  r1, loop
      halt
