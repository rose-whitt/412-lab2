// COMP 412 Reference Allocator (2023-1-1), k = 4
loadI  128 => r0              // rematerialize vr0 => pr0
load   r0 => r1               // Mem[vr0] => vr2
loadI  132 => r2              // rematerialize vr7 => pr2
load   r2 => r2               // Mem[vr7] => vr4
loadI  136 => r3              // rematerialize vr6 => pr3
load   r3 => r0               // Mem[vr6] => vr5
mult   r2, r0  => r0          // vr4, vr5 => vr3
add    r1, r0  => r0          // vr2, vr3 => vr1
loadI  128 => r1              // rematerialize vr0 => pr1   // no-remat would restore right here
store  r0 => r1               // vr1 => Mem[vr0]