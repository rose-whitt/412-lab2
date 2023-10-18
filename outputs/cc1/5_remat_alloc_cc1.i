// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  32 => r0               // rematerialize vr6 => pr0
mult   r0, r0  => r1          // vr6, vr6 => vr10
rshift r0, r1  => r1          // vr6, vr10 => vr9
lshift r0, r1  => r2          // vr6, vr9 => vr8
add    r2, r1  => r1          // vr8, vr9 => vr7
sub    r0, r1  => r1          // vr6, vr7 => vr5
loadI  1028 => r0             // rematerialize vr4 => pr0 (RR)
store  r1 => r0               // vr5 => Mem[vr4]
load   r0 => r0               // Mem[vr4] => vr2
loadI  128 => r1              // rematerialize vr3 => pr1
add    r0, r1  => r1          // vr2, vr3 => vr1
nop      
loadI  1024 => r0             // rematerialize vr0 => pr0
store  r1 => r0               // vr1 => Mem[vr0]
output 1024                   // as in the input