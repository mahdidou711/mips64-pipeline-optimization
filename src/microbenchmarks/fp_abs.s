; Microbenchmark: absolute value, B1 = |A1|, using an FP compare and branch.
; Registers: f0 = 0.0, f2 = A1, f4 = result; condition flag 7 holds A1 < 0.
; Measured with A1 = -10.0 (negative case only).
      .data
A1:   .double -10.0
B1:   .double 0.0
zero: .double 0.0
      .text
main:

      l.d f0,zero(r0)
      l.d f2, A1(r0)        ; f2 = A1
      mov.d f4, f2          ; f4 = B1 = A1
      c.lt.d 7, f2, f0      ; A1 < 0 ?
      bc1f 7, done          ; if false, nothing to do
      sub.d f4, f0, f2      ; f4 = -A1 = |A1| = 0.0 - f2
done: s.d f4,B1(r0)
      halt
