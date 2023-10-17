// ERROR 14:       Definition of source register r0 has no uses.
// COMP 412 Reference Allocator (2023-1-1), k = 5
loadI  0 => r0                // from input block
loadI  4 => r0                // from input block
loadI  1024 => r1             // from input block
load   r1 => r1               // Mem[vr26] => vr24
loadI  1028 => r2             // from input block
load   r2 => r2               // Mem[vr25] => vr22
loadI  2000 => r3             // from input block
store  r1 => r3               // vr24 => Mem[vr23]
add    r1, r2  => r1          // vr24, vr22 => vr20
add    r3, r0  => r3          // vr23, vr3 => vr21
store  r2 => r3               // vr22 => Mem[vr21]
add    r1, r2  => r2          // vr20, vr22 => vr18
add    r3, r0  => r3          // vr21, vr3 => vr19
store  r1 => r3               // vr20 => Mem[vr19]
add    r2, r1  => r1          // vr18, vr20 => vr16
add    r3, r0  => r3          // vr19, vr3 => vr17
store  r2 => r3               // vr18 => Mem[vr17]
add    r1, r2  => r2          // vr16, vr18 => vr14
add    r3, r0  => r3          // vr17, vr3 => vr15
store  r1 => r3               // vr16 => Mem[vr15]
add    r2, r1  => r1          // vr14, vr16 => vr12
add    r3, r0  => r3          // vr15, vr3 => vr13
store  r2 => r3               // vr14 => Mem[vr13]
add    r1, r2  => r2          // vr12, vr14 => vr10
add    r3, r0  => r3          // vr13, vr3 => vr11
store  r1 => r3               // vr12 => Mem[vr11]
add    r2, r1  => r1          // vr10, vr12 => vr8
add    r3, r0  => r3          // vr11, vr3 => vr9
store  r2 => r3               // vr10 => Mem[vr9]
add    r1, r2  => r2          // vr8, vr10 => vr6
add    r3, r0  => r3          // vr9, vr3 => vr7
store  r1 => r3               // vr8 => Mem[vr7]
add    r2, r1  => r1          // vr6, vr8 => vr4
add    r3, r0  => r3          // vr7, vr3 => vr5
store  r2 => r3               // vr6 => Mem[vr5]
add    r1, r2  => r2          // vr4, vr6 => vr1
add    r3, r0  => r3          // vr5, vr3 => vr2
store  r1 => r3               // vr4 => Mem[vr2]
add    r3, r0  => r0          // vr2, vr3 => vr0
store  r2 => r0               // vr1 => Mem[vr0]
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
output 2044                   // as in the input