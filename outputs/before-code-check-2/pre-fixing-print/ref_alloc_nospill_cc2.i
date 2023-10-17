// COMP 412 Reference Allocator (2023-1-1), k = 64
loadI  0 => r0                // from input block
loadI  4 => r1                // from input block
load   r0 => r2               // Mem[vr30] => vr18
add    r0, r1  => r0          // vr30, vr22 => vr29
load   r0 => r3               // Mem[vr29] => vr19
add    r0, r1  => r0          // vr29, vr22 => vr28
load   r0 => r4               // Mem[vr28] => vr16
add    r0, r1  => r0          // vr28, vr22 => vr27
load   r0 => r5               // Mem[vr27] => vr17
add    r0, r1  => r0          // vr27, vr22 => vr26
load   r0 => r6               // Mem[vr26] => vr14
add    r0, r1  => r0          // vr26, vr22 => vr25
load   r0 => r7               // Mem[vr25] => vr15
add    r0, r1  => r0          // vr25, vr22 => vr24
load   r0 => r8               // Mem[vr24] => vr12
add    r0, r1  => r0          // vr24, vr22 => vr23
load   r0 => r9               // Mem[vr23] => vr13
add    r0, r1  => r0          // vr23, vr22 => vr21
load   r0 => r10              // Mem[vr21] => vr10
add    r0, r1  => r1          // vr21, vr22 => vr20
load   r1 => r1               // Mem[vr20] => vr11
add    r2, r3  => r3          // vr18, vr19 => vr8
add    r4, r5  => r5          // vr16, vr17 => vr9
add    r6, r7  => r7          // vr14, vr15 => vr6
add    r8, r9  => r9          // vr12, vr13 => vr7
add    r10, r1  => r1         // vr10, vr11 => vr5
add    r3, r5  => r5          // vr8, vr9 => vr4
add    r7, r9  => r9          // vr6, vr7 => vr3
add    r5, r1  => r1          // vr4, vr5 => vr2
add    r1, r9  => r9          // vr2, vr3 => vr1
loadI  0 => r1                // from input block
store  r9 => r1               // vr1 => Mem[vr0]
output 0                      // as in the input