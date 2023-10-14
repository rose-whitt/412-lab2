// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  0 => r0                // from input block
loadI  4 => r1                // from input block
load   r0 => r2               // Mem[vr30] => vr18
add    r0, r1  => r0          // vr30, vr22 => vr29
load   r0 => r3               // Mem[vr29] => vr19
add    r0, r1  => r0          // vr29, vr22 => vr28
loadI  65536 => r4            // spill pr2 (vr18) => Mem[65536]
store  r2 => r4 
load   r0 => r2               // Mem[vr28] => vr16
add    r0, r1  => r0          // vr28, vr22 => vr27
loadI  65540 => r4            // spill pr2 (vr16) => Mem[65540]
store  r2 => r4 
load   r0 => r2               // Mem[vr27] => vr17
add    r0, r1  => r0          // vr27, vr22 => vr26
loadI  65544 => r4            // spill pr2 (vr17) => Mem[65544]
store  r2 => r4 
load   r0 => r2               // Mem[vr26] => vr14
add    r0, r1  => r0          // vr26, vr22 => vr25
loadI  65548 => r4            // spill pr2 (vr14) => Mem[65548]
store  r2 => r4 
load   r0 => r2               // Mem[vr25] => vr15
add    r0, r1  => r0          // vr25, vr22 => vr24
loadI  65552 => r4            // spill pr2 (vr15) => Mem[65552]
store  r2 => r4 
load   r0 => r2               // Mem[vr24] => vr12
add    r0, r1  => r0          // vr24, vr22 => vr23
loadI  65556 => r4            // spill pr2 (vr12) => Mem[65556]
store  r2 => r4 
load   r0 => r2               // Mem[vr23] => vr13
add    r0, r1  => r0          // vr23, vr22 => vr21
loadI  65560 => r4            // spill pr2 (vr13) => Mem[65560]
store  r2 => r4 
load   r0 => r2               // Mem[vr21] => vr10
add    r0, r1  => r1          // vr21, vr22 => vr20
load   r1 => r1               // Mem[vr20] => vr11
loadI  65536 => r0            // restore  Mem[65536] (vr18) => pr 0
load   r0 => r0 
add    r0, r3  => r3          // vr18, vr19 => vr8
loadI  65540 => r0            // restore  Mem[65540] (vr16) => pr 0
load   r0 => r0 
loadI  65564 => r4            // spill pr3 (vr8) => Mem[65564]
store  r3 => r4 
loadI  65544 => r3            // restore  Mem[65544] (vr17) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr16, vr17 => vr9
loadI  65548 => r0            // restore  Mem[65548] (vr14) => pr 0
load   r0 => r0 
loadI  65568 => r4            // spill pr3 (vr9) => Mem[65568]
store  r3 => r4 
loadI  65552 => r3            // restore  Mem[65552] (vr15) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr14, vr15 => vr6
loadI  65556 => r0            // restore  Mem[65556] (vr12) => pr 0
load   r0 => r0 
loadI  65572 => r4            // spill pr3 (vr6) => Mem[65572]
store  r3 => r4 
loadI  65560 => r3            // restore  Mem[65560] (vr13) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr12, vr13 => vr7
add    r2, r1  => r1          // vr10, vr11 => vr5
loadI  65564 => r2            // restore  Mem[65564] (vr8) => pr 2
load   r2 => r2 
loadI  65568 => r0            // restore  Mem[65568] (vr9) => pr 0
load   r0 => r0 
add    r2, r0  => r0          // vr8, vr9 => vr4
loadI  65572 => r2            // restore  Mem[65572] (vr6) => pr 2
load   r2 => r2 
add    r2, r3  => r3          // vr6, vr7 => vr3
add    r0, r1  => r1          // vr4, vr5 => vr2
add    r1, r3  => r3          // vr2, vr3 => vr1
loadI  0 => r1                // from input block
store  r3 => r1               // vr1 => Mem[vr0]
output 0                      // as in the input