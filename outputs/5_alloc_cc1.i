// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  1024 => r0             // from input block
loadI  128 => r1              // from input block
loadI  32 => r2               // from input block
loadI  1028 => r3             // from input block
loadI  65536 => r4            // 🤮🤮🤮🤮spill pr0 (vr0) => Mem[65536]
store  r0 => r4 
mult   r2, r2  => r0          // vr6, vr6 => vr10
rshift r2, r0  => r0          // vr6, vr10 => vr9
loadI  65540 => r4            // 🤮🤮🤮🤮spill pr1 (vr3) => Mem[65540]
store  r1 => r4 
lshift r2, r0  => r1          // vr6, vr9 => vr8
add    r1, r0  => r0          // vr8, vr9 => vr7
sub    r2, r0  => r0          // vr6, vr7 => vr5
store  r0 => r3               // vr5 => Mem[vr4]
load   r3 => r3               // Mem[vr4] => vr2
loadI  65540 => r0            // 😎😎😎😎restore  Mem[65540] (vr3) => pr 0
load   r0 => r0 
add    r3, r0  => r0          // vr2, vr3 => vr1
nop      
loadI  65536 => r3            // restore  Mem[65536] (vr0) => pr 3
load   r3 => r3 
store  r0 => r3               // vr1 => Mem[vr0]
output 1024                   // as in the input