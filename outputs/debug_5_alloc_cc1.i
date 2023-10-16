loadI   1024  =>   r0
loadI   128  =>   r1
loadI   32  =>   r2
loadI   1028  =>   r3
loadI   32768  =>   r4  // loadI  65536 => r4            // 🤮🤮🤮🤮spill pr0 (vr0) => Mem[65536]
store   r4  =>   r4     // store  r0 => r4 
mult    r2, r2  =>   r4 // mult   r2, r2  => r0          // vr6, vr6 => vr10
rshift  r2, r4  =>   r4 // rshift r2, r0  => r0          // vr6, vr10 => vr9
loadI   32772  =>   r4  // loadI  65540 => r4            // 🤮🤮🤮🤮spill pr1 (vr3) => Mem[65540]
store   r0  =>   r4     // store  r1 => r4 
lshift  r2, r4  =>   r0 // lshift r2, r0  => r1          // vr6, vr9 => vr8
add     r0, r4  =>   r4 // add    r1, r0  => r0          // vr8, vr9 => vr7
sub     r2, r4  =>   r4 // sub    r2, r0  => r0          // vr6, vr7 => vr5
store   r4  =>   r3 // store  r0 => r3               // vr5 => Mem[vr4]
load    r3  =>   r3 // load   r3 => r3               // Mem[vr4] => vr2
add     r3, r1  =>   r1 // after loadI and load? add    r3, r0  => r0          // vr2, vr3 => vr1
loadI   32772  =>   r3  // loadI  65540 => r0            // 😎😎😎😎restore  Mem[65540] (vr3) => pr 0
load    r3  =>   r3
store   r1  =>   r3
output  1024