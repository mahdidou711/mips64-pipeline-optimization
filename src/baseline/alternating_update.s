; Baseline: alternating update over 12 doubles, B[i] -= A[i] for even i, B[i] += A[i] for odd i.
; Registers: r1 = N, r2 = i, r3 = byte offset, r4 = parity of i, f1/f2 = A[i]/B[i].
; A parity test and a branch (plus a jump on the even path) run on every element.
.data
N: .word 12
A: .double 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0
B: .double 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0, 10.0
.code
      ld    r1, N(r0)
      dadd  r2, r0, r0
      dadd  r3, r0, r0
loop: l.d   f1, A(r3)
      l.d   f2, B(r3)
      andi  r4, r2, 1
      bnez  r4, odd
      sub.d f2, f2, f1
      j     store
odd:
      add.d f2, f2, f1
store:
      s.d   f2, B(r3)
      daddi r2, r2, 1
      daddi r3, r3, 8
      bne   r2, r1, loop
      halt
