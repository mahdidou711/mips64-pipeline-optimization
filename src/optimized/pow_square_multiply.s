; Optimized: w = x^n by square-and-multiply (x = 2.0, n = 5).
; Registers: f0 = x (squared every iteration), f2 = result w, r1 = n, r2 = low bit of n.
; Technique: binary exponentiation, O(log n) multiplications instead of n; the extra
; parity test and shift add control overhead that limits the gain for small n.
.data
x: .double 2.0
w: .double 1.0
n: .word 5
.code
      l.d   f0, x(r0)
      l.d   f2, w(r0)
      ld    r1, n(r0)
      beqz  r1, done
loop: andi  r2, r1, 1
      beqz  r2, even
      mul.d f2, f2, f0
even: mul.d f0, f0, f0
      dsrl  r1, r1, 1
      bnez  r1, loop
done: s.d   f2, w(r0)
      halt
