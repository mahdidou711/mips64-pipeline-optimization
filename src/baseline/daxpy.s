; Baseline: DAXPY, Y[i] = A * X[i] + Y[i] for 12 doubles, one element per iteration.
; Registers: f0 = A, r1 = byte offset i, r2 = remaining count, f1/f2 = X[i]/Y[i] work values.
; The load -> mul.d -> add.d -> s.d chain is fully dependent (RAW stalls dominate).
      .data
A:    .double 10.0
X:    .double 8.0, 1.0,2.0,3.0,4.0,5.0,7.0,8.0,9.0,10.0,11.0,12.0
Y:    .double 3.0,14.0,13.0,4.0,8.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0
N:    .word 12

      .text
main:
      l.d   f0,A(r0)        ; f0 = A
      dadd  r1,r0,r0        ; r1 = i = 0
      ld    r2,N(r0)        ; r2 = N
loop: l.d   f1,X(r1)        ; f1 = x[i]
      l.d   f2,Y(r1)        ; f2 = y[i]
      mul.d f1,f1,f0        ; f1 = a * x[i]
      add.d f2,f2,f1        ; f2 = a * x[i] + y[i]
      s.d   f2,Y(r1)        ; y[i] = a * x[i] + y[i]
      daddi r1,r1,8         ; advance byte offset
      daddi r2,r2,-1        ; N--
      bne   r2,r0,loop
      nop
      halt
