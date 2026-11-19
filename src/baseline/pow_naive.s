; Baseline: w = x^n by n successive multiplications (x = 2.0, n = 5).
; Registers: f0 = x, f2 = running product w, r1 = remaining multiplications.
; Executes n dependent mul.d instructions; skips the loop when n = 0.
.data
x: .double 2.0
w: .double 1.0
n: .word 5
.code
      l.d   f0, x(r0)
      l.d   f2, w(r0)
      ld    r1, n(r0)
      beqz  r1, done
loop: mul.d f2, f2, f0
      daddi r1, r1, -1
      bnez  r1, loop
done: s.d   f2, w(r0)
      halt
