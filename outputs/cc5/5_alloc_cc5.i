ERROR 42:       Definition of source register r13 has no uses.
ERROR 40:       Definition of source register r14 has no uses.
// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  128 => r0              // from input block
loadI  132 => r1              // from input block
loadI  136 => r2              // from input block
loadI  140 => r3              // from input block
loadI  65536 => r4            // spill pr0 (vr36) => Mem[65536]
store  r0 => r4 
loadI  144 => r0              // from input block
loadI  65540 => r4            // spill pr1 (vr37) => Mem[65540]
store  r1 => r4 
loadI  148 => r1              // from input block
loadI  65544 => r4            // spill pr2 (vr38) => Mem[65544]
store  r2 => r4 
loadI  152 => r2              // from input block
loadI  65548 => r4            // spill pr3 (vr39) => Mem[65548]
store  r3 => r4 
loadI  156 => r3              // from input block
loadI  65552 => r4            // spill pr0 (vr40) => Mem[65552]
store  r0 => r4 
loadI  160 => r0              // from input block
loadI  65556 => r4            // spill pr1 (vr41) => Mem[65556]
store  r1 => r4 
loadI  164 => r1              // from input block
loadI  65560 => r4            // spill pr2 (vr42) => Mem[65560]
store  r2 => r4 
loadI  168 => r2              // from input block
loadI  65564 => r4            // spill pr3 (vr43) => Mem[65564]
store  r3 => r4 
loadI  172 => r3              // from input block
loadI  65568 => r4            // spill pr0 (vr44) => Mem[65568]
store  r0 => r4 
loadI  176 => r0              // from input block
loadI  65572 => r4            // spill pr2 (vr46) => Mem[65572]
store  r2 => r4 
loadI  180 => r2              // from input block
loadI  65576 => r4            // spill pr3 (vr47) => Mem[65576]
store  r3 => r4 
loadI  184 => r3              // from input block
loadI  65580 => r4            // spill pr0 (vr49) => Mem[65580]
store  r0 => r4 
loadI  188 => r0              // from input block
loadI  65584 => r4            // spill pr1 (vr45) => Mem[65584]
store  r1 => r4 
loadI  192 => r1              // from input block
loadI  65588 => r4            // spill pr2 (vr51) => Mem[65588]
store  r2 => r4 
loadI  196 => r2              // from input block
loadI  65592 => r4            // spill pr3 (vr52) => Mem[65592]
store  r3 => r4 
loadI  200 => r3              // from input block
loadI  65596 => r4            // spill pr0 (vr53) => Mem[65596]
store  r0 => r4 
loadI  204 => r0              // from input block
load   r0 => r0               // Mem[vr57] => vr3
load   r3 => r3               // Mem[vr56] => vr5
load   r2 => r2               // Mem[vr55] => vr7
load   r1 => r1               // Mem[vr54] => vr9
loadI  65600 => r4            // spill pr0 (vr3) => Mem[65600]
store  r0 => r4 
loadI  65596 => r0            // restore  Mem[65596] (vr53) => pr 0
load   r0 => r0 
load   r0 => r0               // Mem[vr53] => vr11
loadI  65604 => r4            // spill pr3 (vr5) => Mem[65604]
store  r3 => r4 
loadI  65592 => r3            // restore  Mem[65592] (vr52) => pr 3
load   r3 => r3 
load   r3 => r3               // Mem[vr52] => vr13
loadI  65608 => r4            // spill pr2 (vr7) => Mem[65608]
store  r2 => r4 
loadI  65588 => r2            // restore  Mem[65588] (vr51) => pr 2
load   r2 => r2 
load   r2 => r2               // Mem[vr51] => vr50
loadI  65584 => r2            // restore  Mem[65584] (vr45) => pr 2
load   r2 => r2 
loadI  65612 => r4            // spill pr1 (vr9) => Mem[65612]
store  r1 => r4 
loadI  65580 => r1            // restore  Mem[65580] (vr49) => pr 1
load   r1 => r1 
store  r2 => r1               // vr45 => Mem[vr49]
load   r1 => r1               // Mem[vr49] => vr48
loadI  65576 => r1            // restore  Mem[65576] (vr47) => pr 1
load   r1 => r1 
load   r1 => r1               // Mem[vr47] => vr15
loadI  65616 => r4            // spill pr0 (vr11) => Mem[65616]
store  r0 => r4 
loadI  65572 => r0            // restore  Mem[65572] (vr46) => pr 0
load   r0 => r0 
load   r0 => r0               // Mem[vr46] => vr17
load   r2 => r2               // Mem[vr45] => vr19
loadI  65620 => r4            // spill pr3 (vr13) => Mem[65620]
store  r3 => r4 
loadI  65568 => r3            // restore  Mem[65568] (vr44) => pr 3
load   r3 => r3 
load   r3 => r3               // Mem[vr44] => vr21
loadI  65624 => r4            // spill pr1 (vr15) => Mem[65624]
store  r1 => r4 
loadI  65564 => r1            // restore  Mem[65564] (vr43) => pr 1
load   r1 => r1 
load   r1 => r1               // Mem[vr43] => vr23
loadI  65628 => r4            // spill pr0 (vr17) => Mem[65628]
store  r0 => r4 
loadI  65560 => r0            // restore  Mem[65560] (vr42) => pr 0
load   r0 => r0 
load   r0 => r0               // Mem[vr42] => vr25
loadI  65632 => r4            // spill pr2 (vr19) => Mem[65632]
store  r2 => r4 
loadI  65556 => r2            // restore  Mem[65556] (vr41) => pr 2
load   r2 => r2 
load   r2 => r2               // Mem[vr41] => vr27
loadI  65636 => r4            // spill pr3 (vr21) => Mem[65636]
store  r3 => r4 
loadI  65552 => r3            // restore  Mem[65552] (vr40) => pr 3
load   r3 => r3 
load   r3 => r3               // Mem[vr40] => vr29
loadI  65640 => r4            // spill pr1 (vr23) => Mem[65640]
store  r1 => r4 
loadI  65548 => r1            // restore  Mem[65548] (vr39) => pr 1
load   r1 => r1 
load   r1 => r1               // Mem[vr39] => vr31
loadI  65644 => r4            // spill pr0 (vr25) => Mem[65644]
store  r0 => r4 
loadI  65544 => r0            // restore  Mem[65544] (vr38) => pr 0
load   r0 => r0 
load   r0 => r0               // Mem[vr38] => vr33
loadI  65648 => r4            // spill pr2 (vr27) => Mem[65648]
store  r2 => r4 
loadI  65540 => r2            // restore  Mem[65540] (vr37) => pr 2
load   r2 => r2 
load   r2 => r2               // Mem[vr37] => vr35
loadI  65652 => r4            // spill pr3 (vr29) => Mem[65652]
store  r3 => r4 
loadI  65536 => r3            // restore  Mem[65536] (vr36) => pr 3
load   r3 => r3 
load   r3 => r3               // Mem[vr36] => vr34
add    r3, r2  => r2          // vr34, vr35 => vr32
add    r2, r0  => r0          // vr32, vr33 => vr30
add    r0, r1  => r1          // vr30, vr31 => vr28
loadI  65652 => r0            // restore  Mem[65652] (vr29) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr28, vr29 => vr26
loadI  65648 => r1            // restore  Mem[65648] (vr27) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr26, vr27 => vr24
loadI  65644 => r0            // restore  Mem[65644] (vr25) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr24, vr25 => vr22
loadI  65640 => r1            // restore  Mem[65640] (vr23) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr22, vr23 => vr20
loadI  65636 => r0            // restore  Mem[65636] (vr21) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr20, vr21 => vr18
loadI  65632 => r1            // restore  Mem[65632] (vr19) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr18, vr19 => vr16
loadI  65628 => r0            // restore  Mem[65628] (vr17) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr16, vr17 => vr14
loadI  65624 => r1            // restore  Mem[65624] (vr15) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr14, vr15 => vr12
loadI  65620 => r0            // restore  Mem[65620] (vr13) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr12, vr13 => vr10
loadI  65616 => r1            // restore  Mem[65616] (vr11) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr10, vr11 => vr8
loadI  65612 => r0            // restore  Mem[65612] (vr9) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr8, vr9 => vr6
loadI  65608 => r1            // restore  Mem[65608] (vr7) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr6, vr7 => vr4
loadI  65604 => r0            // restore  Mem[65604] (vr5) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr4, vr5 => vr2
loadI  65600 => r1            // restore  Mem[65600] (vr3) => pr 1
load   r1 => r1 
add    r0, r1  => r1          // vr2, vr3 => vr1
loadI  1024 => r0             // from input block
store  r1 => r0               // vr1 => Mem[vr0]
output 1024                   // as in the input
output 176                    // as in the input