; Optimized: first twelve Fibonacci numbers stored in a 12-word array.
; Registers: $t0 = array pointer, $t1 = loop counter, $t3/$t4 = F[n]/F[n+1], $t2 = F[n+2].
; Technique: values stay in registers (rotated with add) instead of being reloaded,
; and the counter update is placed between add and sw to cover the RAW dependency.
      .data
fibs: .space 48          ; array of 12 32-bit words to contain fib values
size: .word  12          ; size of the array
 .text
      addi $t0, r0, fibs
      lw   $t5, size(r0)
      addi $t3, r0, 1
      addi $t4, r0, 1
      sw   $t3, 0($t0)
      sw   $t4, 4($t0)
      addi $t1, $t5, -2
loop: add  $t2, $t3, $t4
      addi $t1, $t1, -1
      sw   $t2, 8($t0)
      add  $t3, $t4, r0
      add  $t4, $t2, r0
      addi $t0, $t0, 4
      bnez $t1, loop
      halt
