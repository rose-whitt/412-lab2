// ERROR 10:       Definition of source register r0 has no uses.
// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  0 => r0                // rematerialize vr22 => pr0
loadI  1 => r1                // rematerialize vr23 => pr1
add    r0, r1  => r1          // vr22, vr23 => vr20
add    r1, r0  => r2          // vr20, vr22 => vr18
add    r2, r1  => r3          // vr18, vr20 => vr16
add    r3, r2  => r0          // vr16, vr18 => vr14
loadI  65536 => r4            // spill pr3 (vr16) => Mem[65536]
store  r3 => r4 
add    r0, r3  => r3          // vr14, vr16 => vr12
loadI  65540 => r4            // spill pr0 (vr14) => Mem[65540]
store  r0 => r4 
add    r3, r0  => r0          // vr12, vr14 => vr10
loadI  65544 => r4            // spill pr3 (vr12) => Mem[65544]
store  r3 => r4 
add    r0, r3  => r3          // vr10, vr12 => vr8
loadI  65548 => r4            // spill pr0 (vr10) => Mem[65548]
store  r0 => r4 
add    r3, r0  => r0          // vr8, vr10 => vr6
loadI  65552 => r4            // spill pr3 (vr8) => Mem[65552]
store  r3 => r4 
add    r0, r3  => r3          // vr6, vr8 => vr4
loadI  65556 => r4            // spill pr3 (vr4) => Mem[65556]
store  r3 => r4 
add    r3, r0  => r3          // vr4, vr6 => vr1
loadI  65560 => r4            // spill pr3 (vr1) => Mem[65560]
store  r3 => r4 
loadI  0 => r4                // rematerialize vr22 => pr4
loadI  2000 => r3             // rematerialize vr21 => pr3
store  r4 => r3               // vr22 => Mem[vr21]
loadI  4 => r4                // rematerialize vr3 => pr4
add    r3, r4  => r3          // vr21, vr3 => vr19
store  r1 => r3               // vr20 => Mem[vr19]
loadI  4 => r1                // rematerialize vr3 => pr1
add    r3, r1  => r3          // vr19, vr3 => vr17
store  r2 => r3               // vr18 => Mem[vr17]
add    r3, r1  => r3          // vr17, vr3 => vr15
loadI  65536 => r2            // restore  Mem[65536] (vr16) => pr 2
load   r2 => r2 
store  r2 => r3               // vr16 => Mem[vr15]
add    r3, r1  => r3          // vr15, vr3 => vr13
loadI  65540 => r2            // restore  Mem[65540] (vr14) => pr 2
load   r2 => r2 
store  r2 => r3               // vr14 => Mem[vr13]
add    r3, r1  => r3          // vr13, vr3 => vr11
loadI  65544 => r2            // restore  Mem[65544] (vr12) => pr 2
load   r2 => r2 
store  r2 => r3               // vr12 => Mem[vr11]
add    r3, r1  => r3          // vr11, vr3 => vr9
loadI  65548 => r2            // restore  Mem[65548] (vr10) => pr 2
load   r2 => r2 
store  r2 => r3               // vr10 => Mem[vr9]
add    r3, r1  => r3          // vr9, vr3 => vr7
loadI  65552 => r2            // restore  Mem[65552] (vr8) => pr 2
load   r2 => r2 
store  r2 => r3               // vr8 => Mem[vr7]
add    r3, r1  => r3          // vr7, vr3 => vr5
store  r0 => r3               // vr6 => Mem[vr5]
add    r3, r1  => r3          // vr5, vr3 => vr2
loadI  65556 => r0            // restore  Mem[65556] (vr4) => pr 0
load   r0 => r0 
store  r0 => r3               // vr4 => Mem[vr2]
add    r3, r1  => r1          // vr2, vr3 => vr0
loadI  65560 => r3            // restore  Mem[65560] (vr1) => pr 3
load   r3 => r3 
store  r3 => r1               // vr1 => Mem[vr0]
output 2000                   // as in the input
output 2004                   // as in the input
output 2008                   // as in the input
output 2012                   // as in the input
output 2016                   // as in the input
output 2020                   // as in the input
output 2024                   // as in the input
output 2028                   // as in the input
output 2032                   // as in the input
output 2036                   // as in the input
output 2040                   // as in the input