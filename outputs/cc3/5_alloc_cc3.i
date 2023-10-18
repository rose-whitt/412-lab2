// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  0 => r0                // from input block
add    r0, r0  => r1          // vr0, vr0 => vr2
loadI  4 => r2                // from input block
load   r1 => r3               // Mem[vr2] => vr19
loadI  65536 => r4            // spill pr0 (vr0) => Mem[65536]
store  r0 => r4 
add    r1, r2  => r0          // vr2, vr21 => vr9
loadI  65540 => r4            // spill pr1 (vr2) => Mem[65540]
store  r1 => r4 
load   r0 => r1               // Mem[vr9] => vr18
add    r0, r2  => r2          // vr9, vr21 => vr20
load   r2 => r2               // Mem[vr20] => vr17
add    r3, r1  => r3          // vr19, vr18 => vr16
add    r2, r1  => r1          // vr17, vr18 => vr12
add    r3, r1  => r3          // vr16, vr12 => vr14
add    r3, r1  => r2          // vr14, vr12 => vr15
loadI  65544 => r4            // spill pr1 (vr12) => Mem[65544]
store  r1 => r4 
loadI  65540 => r1            // restore  Mem[65540] (vr2) => pr 1
load   r1 => r1 
store  r2 => r1               // vr15 => Mem[vr2]
load   r0 => r2               // Mem[vr9] => vr13
add    r3, r2  => r3          // vr14, vr13 => vr11
loadI  65548 => r4            // spill pr0 (vr9) => Mem[65548]
store  r0 => r4 
loadI  65544 => r0            // restore  Mem[65544] (vr12) => pr 0
load   r0 => r0 
add    r0, r2  => r2          // vr12, vr13 => vr6
add    r3, r2  => r3          // vr11, vr6 => vr8
add    r3, r2  => r0          // vr8, vr6 => vr10
store  r0 => r1               // vr10 => Mem[vr2]
loadI  65548 => r0            // restore  Mem[65548] (vr9) => pr 0
load   r0 => r0 
load   r0 => r0               // Mem[vr9] => vr7
add    r3, r0  => r3          // vr8, vr7 => vr5
add    r2, r0  => r0          // vr6, vr7 => vr4
add    r3, r0  => r3          // vr5, vr4 => vr3
add    r3, r0  => r0          // vr3, vr4 => vr1
store  r0 => r1               // vr1 => Mem[vr2]
loadI  65536 => r1            // restore  Mem[65536] (vr0) => pr 1
load   r1 => r1 
store  r0 => r1               // vr1 => Mem[vr0]
output 0                      // as in the input