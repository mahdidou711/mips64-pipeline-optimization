# Measurement Results

All figures come from manual runs in the eduMIPS64 web simulator with **Delay Slot disabled** and **Forwarding disabled** (off) or **enabled** (on). Counter values are transcribed from the *Statistics* panel screenshots; the configuration of each run is taken from the screenshot file name (`_nofwd_` / `_fwd_`), since the setting itself is not visible in the panels. The exact simulator build was not recorded.

Each pair is given as **forwarding off / forwarding on**. CPI and counters are as displayed; RAW, WAW and structural are the three stall counters of the *Statistics* panel. Their sum is not claimed to equal the number of waiting cycles.

## All programs (17 programs, 34 configurations)

| Group | Program | Variant | Cycles | Instructions | CPI | RAW | WAW | Structural | Statistics (off / on) |
|---|---|---|---:|---:|---:|---:|---:|---:|---|
| Microbenchmark | `int_add.s` | microbenchmark | 13 / 10 | 5 | 2.60 / 2.00 | 4 / 1 | 0 / 0 | 0 / 0 | [off](screenshots/microbenchmarks/int_add_nofwd_stats.png) / [on](screenshots/microbenchmarks/int_add_fwd_stats.png) |
| Microbenchmark | `int_mul.s` | microbenchmark | 16 / 11 | 6 | 2.67 / 1.83 | 6 / 1 | 0 / 0 | 0 / 0 | [off](screenshots/microbenchmarks/int_mul_nofwd_stats.png) / [on](screenshots/microbenchmarks/int_mul_fwd_stats.png) |
| Microbenchmark | `fp_add.s` | microbenchmark | 16 / 13 | 5 | 3.20 / 2.60 | 7 / 4 | 0 / 0 | 0 / 0 | [off](screenshots/microbenchmarks/fp_add_nofwd_stats.png) / [on](screenshots/microbenchmarks/fp_add_fwd_stats.png) |
| Microbenchmark | `fp_mul.s` | microbenchmark | 19 / 16 | 5 | 3.80 / 3.20 | 10 / 7 | 0 / 0 | 0 / 0 | [off](screenshots/microbenchmarks/fp_mul_nofwd_stats.png) / [on](screenshots/microbenchmarks/fp_mul_fwd_stats.png) |
| Microbenchmark | `fp_div.s` | microbenchmark | 36 / 33 | 5 | 7.20 / 6.60 | 27 / 24 | 0 / 0 | 0 / 0 | [off](screenshots/microbenchmarks/fp_div_nofwd_stats.png) / [on](screenshots/microbenchmarks/fp_div_fwd_stats.png) |
| Microbenchmark | `fp_abs.s` | microbenchmark | 19 / 16 | 8 | 2.38 / 2.00 | 7 / 4 | 0 / 0 | 0 / 0 | [off](screenshots/microbenchmarks/fp_abs_nofwd_stats.png) / [on](screenshots/microbenchmarks/fp_abs_fwd_stats.png) |
| Microbenchmark | `fp_double.s` | microbenchmark | 90 / 83 | 25 | 3.60 / 3.32 | 38 / 29 | 0 / 0 | 23 / 27 | [off](screenshots/microbenchmarks/fp_double_nofwd_stats.png) / [on](screenshots/microbenchmarks/fp_double_fwd_stats.png) |
| Fibonacci | `fib.s` | baseline | 153 / 111 | 78 | 1.96 / 1.42 | 62 / 20 | 0 / 0 | 0 / 0 | [off](screenshots/fibonacci/fib_nofwd_stats.png) / [on](screenshots/fibonacci/fib_fwd_stats.png) |
| Fibonacci | `fib_reordered.s` | optimized | 102 / 91 | 78 | 1.31 / 1.17 | 11 / 0 | 0 / 0 | 0 / 0 | [off](screenshots/fibonacci/fib_reordered_nofwd_stats.png) / [on](screenshots/fibonacci/fib_reordered_fwd_stats.png) |
| DAXPY | `daxpy.s` | baseline | 309 / 236 | 101 | 3.06 / 2.34 | 193 / 120 | 0 / 0 | 0 / 0 | [off](screenshots/daxpy/daxpy_nofwd_stats.png) / [on](screenshots/daxpy/daxpy_fwd_stats.png) |
| DAXPY | `daxpy_unroll4.s` | optimized | 104 / 104 | 77 | 1.35 / 1.35 | 6 / 0 | 0 / 0 | 30 / 42 | [off](screenshots/daxpy/daxpy_unroll4_nofwd_stats.png) / [on](screenshots/daxpy/daxpy_unroll4_fwd_stats.png) |
| Alternating update | `alternating_update.s` | baseline | 231 / 181 | 118 | 1.96 / 1.53 | 86 / 36 | 0 / 0 | 0 / 0 | [off](screenshots/alternating_update/alternating_update_nofwd_stats.png) / [on](screenshots/alternating_update/alternating_update_fwd_stats.png) |
| Alternating update | `alternating_update_unroll2.s` | optimized | 116 / 97 | 76 | 1.53 / 1.28 | 19 / 0 | 0 / 0 | 24 / 24 | [off](screenshots/alternating_update/alternating_update_unroll2_nofwd_stats.png) / [on](screenshots/alternating_update/alternating_update_unroll2_fwd_stats.png) |
| Array sum | `array_sum.s` | baseline | 118 / 104 | 65 | 1.82 / 1.60 | 38 / 12 | 0 / 0 | 0 / 24 | [off](screenshots/array_sum/array_sum_nofwd_stats.png) / [on](screenshots/array_sum/array_sum_fwd_stats.png) |
| Array sum | `array_sum_unroll2.s` | optimized | 81 / 73 | 49 | 1.65 / 1.49 | 11 / 3 | 0 / 0 | 24 / 24 | [off](screenshots/array_sum/array_sum_unroll2_nofwd_stats.png) / [on](screenshots/array_sum/array_sum_unroll2_fwd_stats.png) |
| Power | `pow_naive.s` | baseline | 57 / 51 | 21 | 2.71 / 2.43 | 28 / 18 | 0 / 4 | 0 / 0 | [off](screenshots/power/pow_naive_nofwd_stats.png) / [on](screenshots/power/pow_naive_fwd_stats.png) |
| Power | `pow_square_multiply.s` | optimized | 49 / 43 | 23 | 2.13 / 1.87 | 17 / 10 | 0 / 0 | 4 / 6 | [off](screenshots/power/pow_square_multiply_nofwd_stats.png) / [on](screenshots/power/pow_square_multiply_fwd_stats.png) |

## Baseline versus optimized

Gain = (optimized - baseline) / baseline, computed from the displayed cycle counts.

| Case | Optimized variant | Cycles, forwarding off | Gain | Cycles, forwarding on | Gain |
|---|---|---:|---:|---:|---:|
| `fib.s` | `fib_reordered.s` | 153 -> 102 | -33.3% | 111 -> 91 | -18.0% |
| `daxpy.s` | `daxpy_unroll4.s` | 309 -> 104 | -66.3% | 236 -> 104 | -55.9% |
| `alternating_update.s` | `alternating_update_unroll2.s` | 231 -> 116 | -49.8% | 181 -> 97 | -46.4% |
| `array_sum.s` | `array_sum_unroll2.s` | 118 -> 81 | -31.4% | 104 -> 73 | -29.8% |
| `pow_naive.s` | `pow_square_multiply.s` | 57 -> 49 | -14.0% | 51 -> 43 | -15.7% |

## Pipeline timing diagrams

Cycle-diagram screenshots (35 files). Multi-part captures are numbered in order. Programs without a cycle capture are not listed.

| Program | Forwarding off | Forwarding on |
|---|---|---|
| `int_add.s` | [1](screenshots/microbenchmarks/int_add_nofwd_cycles.png) | [1](screenshots/microbenchmarks/int_add_fwd_cycles.png) |
| `int_mul.s` | [1](screenshots/microbenchmarks/int_mul_nofwd_cycles.png) | [1](screenshots/microbenchmarks/int_mul_fwd_cycles.png) |
| `fp_add.s` | [1](screenshots/microbenchmarks/fp_add_nofwd_cycles.png) | [1](screenshots/microbenchmarks/fp_add_fwd_cycles.png) |
| `fp_mul.s` | [1](screenshots/microbenchmarks/fp_mul_nofwd_cycles.png) | [1](screenshots/microbenchmarks/fp_mul_fwd_cycles.png) |
| `fp_div.s` | [1](screenshots/microbenchmarks/fp_div_nofwd_cycles.png) | [1](screenshots/microbenchmarks/fp_div_fwd_cycles.png) |
| `fp_abs.s` | [1](screenshots/microbenchmarks/fp_abs_nofwd_cycles.png) | [1](screenshots/microbenchmarks/fp_abs_fwd_cycles.png) |
| `fp_double.s` | [1](screenshots/microbenchmarks/fp_double_nofwd_cycles_part1.png), [2](screenshots/microbenchmarks/fp_double_nofwd_cycles_part2.png) | [1](screenshots/microbenchmarks/fp_double_fwd_cycles_part1.png), [2](screenshots/microbenchmarks/fp_double_fwd_cycles_part2.png) |
| `fib.s` | [1](screenshots/fibonacci/fib_nofwd_cycles_part1.png), [2](screenshots/fibonacci/fib_nofwd_cycles_part2.png), [3](screenshots/fibonacci/fib_nofwd_cycles_part3.png), [4](screenshots/fibonacci/fib_nofwd_cycles_part4.png) | [1](screenshots/fibonacci/fib_fwd_cycles_part1.png), [2](screenshots/fibonacci/fib_fwd_cycles_part2.png), [3](screenshots/fibonacci/fib_fwd_cycles_part3.png), [4](screenshots/fibonacci/fib_fwd_cycles_part4.png) |
| `daxpy.s` | [1](screenshots/daxpy/daxpy_nofwd_cycles_part1.png), [2](screenshots/daxpy/daxpy_nofwd_cycles_part2.png), [3](screenshots/daxpy/daxpy_nofwd_cycles_part3.png), [4](screenshots/daxpy/daxpy_nofwd_cycles_part4.png), [5](screenshots/daxpy/daxpy_nofwd_cycles_part5.png), [6](screenshots/daxpy/daxpy_nofwd_cycles_part6.png) | [1](screenshots/daxpy/daxpy_fwd_cycles_part1.png), [2](screenshots/daxpy/daxpy_fwd_cycles_part2.png), [3](screenshots/daxpy/daxpy_fwd_cycles_part3.png), [4](screenshots/daxpy/daxpy_fwd_cycles_part4.png), [5](screenshots/daxpy/daxpy_fwd_cycles_part5.png) |

## Notes

- Some *Statistics* panels display the warning "It is not a legal MIPS64 instruction" for WinMIPS64-style mnemonics (for example `bnez`, `halt`); its exact effect on the web simulator run is not established.
- The screenshots do not show final memory contents, so expected numerical results (for example 32 for x = 2, n = 5) are theoretical.
- For the power programs only the single case x = 2, n = 5 was measured.
