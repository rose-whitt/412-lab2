// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  1 => r0                // rematerialize vr5 => pr0
lshift r0, r0  => r1          // vr5, vr5 => vr38
lshift r1, r0  => r2          // vr38, vr5 => vr36
lshift r2, r0  => r3          // vr36, vr5 => vr37
loadI  65536 => r4            // spill pr2 (vr36) => Mem[65536]
store  r2 => r4 
lshift r3, r0  => r2          // vr37, vr5 => vr7
loadI  65540 => r4            // spill pr2 (vr7) => Mem[65540]
store  r2 => r4 
lshift r2, r0  => r2          // vr7, vr5 => vr35
lshift r2, r0  => r0          // vr35, vr5 => vr33
loadI  65544 => r4            // spill pr0 (vr33) => Mem[65544]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr33, vr5 => vr34
loadI  65548 => r4            // spill pr0 (vr34) => Mem[65548]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr34, vr5 => vr31
loadI  65552 => r4            // spill pr0 (vr31) => Mem[65552]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr31, vr5 => vr32
loadI  65556 => r4            // spill pr0 (vr32) => Mem[65556]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr32, vr5 => vr29
loadI  65560 => r4            // spill pr0 (vr29) => Mem[65560]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr29, vr5 => vr30
loadI  65564 => r4            // spill pr0 (vr30) => Mem[65564]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr30, vr5 => vr27
loadI  65568 => r4            // spill pr0 (vr27) => Mem[65568]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr27, vr5 => vr28
loadI  65572 => r4            // spill pr0 (vr28) => Mem[65572]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr28, vr5 => vr25
loadI  65576 => r4            // spill pr0 (vr25) => Mem[65576]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr25, vr5 => vr26
loadI  65580 => r4            // spill pr0 (vr26) => Mem[65580]
store  r0 => r4 
loadI  1 => r4                // rematerialize vr5 => pr4
lshift r0, r4  => r0          // vr26, vr5 => vr10
loadI  1 => r4                // rematerialize vr5 => pr4
add    r4, r1  => r1          // vr5, vr38 => vr23
loadI  65584 => r4            // spill pr0 (vr10) => Mem[65584]
store  r0 => r4 
loadI  65536 => r0            // restore  Mem[65536] (vr36) => pr 0
load   r0 => r0 
add    r0, r3  => r3          // vr36, vr37 => vr24
loadI  65540 => r0            // restore  Mem[65540] (vr7) => pr 0
load   r0 => r0 
add    r0, r2  => r2          // vr7, vr35 => vr21
loadI  65544 => r0            // restore  Mem[65544] (vr33) => pr 0
load   r0 => r0 
loadI  65588 => r4            // spill pr2 (vr21) => Mem[65588]
store  r2 => r4 
loadI  65548 => r2            // restore  Mem[65548] (vr34) => pr 2
load   r2 => r2 
add    r0, r2  => r2          // vr33, vr34 => vr22
loadI  65552 => r0            // restore  Mem[65552] (vr31) => pr 0
load   r0 => r0 
loadI  65592 => r4            // spill pr2 (vr22) => Mem[65592]
store  r2 => r4 
loadI  65556 => r2            // restore  Mem[65556] (vr32) => pr 2
load   r2 => r2 
add    r0, r2  => r2          // vr31, vr32 => vr19
loadI  65560 => r0            // restore  Mem[65560] (vr29) => pr 0
load   r0 => r0 
loadI  65596 => r4            // spill pr2 (vr19) => Mem[65596]
store  r2 => r4 
loadI  65564 => r2            // restore  Mem[65564] (vr30) => pr 2
load   r2 => r2 
add    r0, r2  => r2          // vr29, vr30 => vr20
loadI  65568 => r0            // restore  Mem[65568] (vr27) => pr 0
load   r0 => r0 
loadI  65600 => r4            // spill pr2 (vr20) => Mem[65600]
store  r2 => r4 
loadI  65572 => r2            // restore  Mem[65572] (vr28) => pr 2
load   r2 => r2 
add    r0, r2  => r2          // vr27, vr28 => vr17
loadI  65576 => r0            // restore  Mem[65576] (vr25) => pr 0
load   r0 => r0 
loadI  65604 => r4            // spill pr2 (vr17) => Mem[65604]
store  r2 => r4 
loadI  65580 => r2            // restore  Mem[65580] (vr26) => pr 2
load   r2 => r2 
add    r0, r2  => r2          // vr25, vr26 => vr18
add    r1, r3  => r3          // vr23, vr24 => vr15
loadI  65588 => r1            // restore  Mem[65588] (vr21) => pr 1
load   r1 => r1 
loadI  65592 => r0            // restore  Mem[65592] (vr22) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr21, vr22 => vr16
loadI  65596 => r1            // restore  Mem[65596] (vr19) => pr 1
load   r1 => r1 
loadI  65608 => r4            // spill pr0 (vr16) => Mem[65608]
store  r0 => r4 
loadI  65600 => r0            // restore  Mem[65600] (vr20) => pr 0
load   r0 => r0 
add    r1, r0  => r0          // vr19, vr20 => vr13
loadI  65604 => r1            // restore  Mem[65604] (vr17) => pr 1
load   r1 => r1 
add    r1, r2  => r2          // vr17, vr18 => vr14
loadI  65608 => r1            // restore  Mem[65608] (vr16) => pr 1
load   r1 => r1 
add    r3, r1  => r1          // vr15, vr16 => vr12
add    r0, r2  => r2          // vr13, vr14 => vr11
add    r2, r1  => r1          // vr11, vr12 => vr9
loadI  65584 => r2            // restore  Mem[65584] (vr10) => pr 2
load   r2 => r2 
add    r1, r2  => r2          // vr9, vr10 => vr8
loadI  1024 => r1             // rematerialize vr2 => pr1
store  r2 => r1               // vr8 => Mem[vr2]
loadI  65540 => r2            // restore  Mem[65540] (vr7) => pr 2
load   r2 => r2 
loadI  1 => r0                // rematerialize vr5 => pr0
add    r2, r0  => r2          // vr7, vr5 => vr6
lshift r0, r2  => r2          // vr5, vr6 => vr4
sub    r2, r0  => r0          // vr4, vr5 => vr1
loadI  4 => r2                // rematerialize vr3 => pr2
add    r1, r2  => r2          // vr2, vr3 => vr0
store  r0 => r2               // vr1 => Mem[vr0]
output 1024                   // as in the input
output 1028                   // as in the input