// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  128 => r0              // from input block
load   r0 => r1               // Mem[vr0] => vr2
loadI  132 => r2              // from input block
load   r2 => r2               // Mem[vr7] => vr4
loadI  136 => r3              // from input block
load   r3 => r3               // Mem[vr6] => vr5
mult   r2, r3  => r3          // vr4, vr5 => vr3
add    r1, r3  => r3          // vr2, vr3 => vr1
store  r3 => r0               // vr1 => Mem[vr0]