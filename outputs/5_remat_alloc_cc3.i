// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  0 => r0                // rematerialize vr0 => pr0
add    r0, r0  => r1          // vr0, vr0 => vr2
load   r1 => r2               // Mem[vr2] => vr19
loadI  4 => r3                // rematerialize vr21 => pr3
add    r1, r3  => r0          // vr2, vr21 => vr9
load   r0 => r3               // Mem[vr9] => vr18
loadI  65536 => r4            // spill pr0 (vr9) => Mem[65536]
store  r0 => r4 
loadI  4 => r4                // rematerialize vr21 => pr4
add    r0, r4  => r0          // vr9, vr21 => vr20
load   r0 => r0               // Mem[vr20] => vr17
add    r2, r3  => r2          // vr19, vr18 => vr16
add    r0, r3  => r3          // vr17, vr18 => vr12
add    r2, r3  => r2          // vr16, vr12 => vr14
add    r2, r3  => r0          // vr14, vr12 => vr15
store  r0 => r1               // vr15 => Mem[vr2]
loadI  65536 => r0            // restore  Mem[65536] (vr9) => pr 0
load   r0 => r0 
load   r0 => r0               // Mem[vr9] => vr13
add    r2, r0  => r2          // vr14, vr13 => vr11
add    r3, r0  => r0          // vr12, vr13 => vr6
add    r2, r0  => r2          // vr11, vr6 => vr8
add    r2, r0  => r3          // vr8, vr6 => vr10
store  r3 => r1               // vr10 => Mem[vr2]
loadI  65536 => r3            // restore  Mem[65536] (vr9) => pr 3
load   r3 => r3 
load   r3 => r3               // Mem[vr9] => vr7
add    r2, r3  => r2          // vr8, vr7 => vr5
add    r0, r3  => r3          // vr6, vr7 => vr4
add    r2, r3  => r2          // vr5, vr4 => vr3
add    r2, r3  => r3          // vr3, vr4 => vr1
store  r3 => r1               // vr1 => Mem[vr2]
loadI  0 => r1                // rematerialize vr0 => pr1
store  r3 => r1               // vr1 => Mem[vr0]
output 0                      // as in the input