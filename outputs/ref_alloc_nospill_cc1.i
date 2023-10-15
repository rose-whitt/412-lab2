// COMP 412 Reference Allocator (2023-1-1), k = 64
loadI  1024 => r0             // from input block
loadI  128 => r1              // from input block
loadI  32 => r2               // from input block
loadI  1028 => r3             // from input block
mult   r2, r2  => r4          // vr6, vr6 => vr10
rshift r2, r4  => r4          // vr6, vr10 => vr9
lshift r2, r4  => r5          // vr6, vr9 => vr8
add    r5, r4  => r4          // vr8, vr9 => vr7
sub    r2, r4  => r4          // vr6, vr7 => vr5
store  r4 => r3               // vr5 => Mem[vr4]
load   r3 => r3               // Mem[vr4] => vr2
add    r3, r1  => r1          // vr2, vr3 => vr1
nop      
store  r1 => r0               // vr1 => Mem[vr0]
output 1024                   // as in the input