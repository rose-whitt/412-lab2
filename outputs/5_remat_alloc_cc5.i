ERROR 42:       Definition of source register r13 has no uses.
ERROR 40:       Definition of source register r14 has no uses.
// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  204 => r0              // rematerialize vr57 => pr0
load   r0 => r0               // Mem[vr57] => vr3
loadI  200 => r1              // rematerialize vr56 => pr1
load   r1 => r1               // Mem[vr56] => vr5
loadI  196 => r2              // rematerialize vr55 => pr2
load   r2 => r2               // Mem[vr55] => vr7
loadI  192 => r3              // rematerialize vr54 => pr3
load   r3 => r3               // Mem[vr54] => vr9
loadI  65536 => r4            // spill pr0 (vr3) => Mem[65536]
store  r0 => r4 
loadI  188 => r4              // rematerialize vr53 => pr4
load   r4 => r0               // Mem[vr53] => vr11
loadI  65540 => r4            // spill pr1 (vr5) => Mem[65540]
store  r1 => r4 
loadI  184 => r4              // rematerialize vr52 => pr4
load   r4 => r1               // Mem[vr52] => vr13
loadI  65544 => r4            // spill pr2 (vr7) => Mem[65544]
store  r2 => r4 
loadI  180 => r4              // rematerialize vr51 => pr4
load   r4 => r2               // Mem[vr51] => vr50
loadI  164 => r2              // rematerialize vr45 => pr2
loadI  176 => r4              // rematerialize vr49 => pr4
store  r2 => r4               // vr45 => Mem[vr49]
loadI  65548 => r4            // spill pr3 (vr9) => Mem[65548]
store  r3 => r4 
loadI  176 => r4              // rematerialize vr49 => pr4
load   r4 => r3               // Mem[vr49] => vr48
loadI  172 => r3              // rematerialize vr47 => pr3
load   r3 => r3               // Mem[vr47] => vr15
loadI  65552 => r4            // spill pr0 (vr11) => Mem[65552]
store  r0 => r4 
loadI  168 => r4              // rematerialize vr46 => pr4
load   r4 => r0               // Mem[vr46] => vr17
load   r2 => r2               // Mem[vr45] => vr19
loadI  65556 => r4            // spill pr1 (vr13) => Mem[65556]
store  r1 => r4 
loadI  160 => r4              // rematerialize vr44 => pr4
load   r4 => r1               // Mem[vr44] => vr21
loadI  65560 => r4            // spill pr3 (vr15) => Mem[65560]
store  r3 => r4 
loadI  156 => r4              // rematerialize vr43 => pr4
load   r4 => r3               // Mem[vr43] => vr23
loadI  65564 => r4            // spill pr0 (vr17) => Mem[65564]
store  r0 => r4 
loadI  152 => r4              // rematerialize vr42 => pr4
load   r4 => r0               // Mem[vr42] => vr25
loadI  65568 => r4            // spill pr2 (vr19) => Mem[65568]
store  r2 => r4 
loadI  148 => r4              // rematerialize vr41 => pr4
load   r4 => r2               // Mem[vr41] => vr27
loadI  65572 => r4            // spill pr1 (vr21) => Mem[65572]
store  r1 => r4 
loadI  144 => r4              // rematerialize vr40 => pr4
load   r4 => r1               // Mem[vr40] => vr29
loadI  65576 => r4            // spill pr3 (vr23) => Mem[65576]
store  r3 => r4 
loadI  140 => r4              // rematerialize vr39 => pr4
load   r4 => r3               // Mem[vr39] => vr31
loadI  65580 => r4            // spill pr0 (vr25) => Mem[65580]
store  r0 => r4 
loadI  136 => r4              // rematerialize vr38 => pr4
load   r4 => r0               // Mem[vr38] => vr33
loadI  65584 => r4            // spill pr2 (vr27) => Mem[65584]
store  r2 => r4 
loadI  132 => r4              // rematerialize vr37 => pr4
load   r4 => r2               // Mem[vr37] => vr35
loadI  65588 => r4            // spill pr1 (vr29) => Mem[65588]
store  r1 => r4 
loadI  128 => r4              // rematerialize vr36 => pr4
load   r4 => r1               // Mem[vr36] => vr34
add    r1, r2  => r2          // vr34, vr35 => vr32
add    r2, r0  => r0          // vr32, vr33 => vr30
add    r0, r3  => r3          // vr30, vr31 => vr28
loadI  65588 => r0            // restore  Mem[65588] (vr29) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr28, vr29 => vr26
loadI  65584 => r3            // restore  Mem[65584] (vr27) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr26, vr27 => vr24
loadI  65580 => r0            // restore  Mem[65580] (vr25) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr24, vr25 => vr22
loadI  65576 => r3            // restore  Mem[65576] (vr23) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr22, vr23 => vr20
loadI  65572 => r0            // restore  Mem[65572] (vr21) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr20, vr21 => vr18
loadI  65568 => r3            // restore  Mem[65568] (vr19) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr18, vr19 => vr16
loadI  65564 => r0            // restore  Mem[65564] (vr17) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr16, vr17 => vr14
loadI  65560 => r3            // restore  Mem[65560] (vr15) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr14, vr15 => vr12
loadI  65556 => r0            // restore  Mem[65556] (vr13) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr12, vr13 => vr10
loadI  65552 => r3            // restore  Mem[65552] (vr11) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr10, vr11 => vr8
loadI  65548 => r0            // restore  Mem[65548] (vr9) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr8, vr9 => vr6
loadI  65544 => r3            // restore  Mem[65544] (vr7) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr6, vr7 => vr4
loadI  65540 => r0            // restore  Mem[65540] (vr5) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr4, vr5 => vr2
loadI  65536 => r3            // restore  Mem[65536] (vr3) => pr 3
load   r3 => r3 
add    r0, r3  => r3          // vr2, vr3 => vr1
loadI  1024 => r0             // rematerialize vr0 => pr0
store  r3 => r0               // vr1 => Mem[vr0]
output 1024                   // as in the input
output 176                    // as in the input