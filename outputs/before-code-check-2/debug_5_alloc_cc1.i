
loadI   1024  =>   r0
loadI   128  =>   r1
loadI   32  =>   r2
loadI   1028  =>   r3
loadI   32768  =>   r4  // loadI  65536 => r4            // 🤮🤮🤮🤮spill pr0 (vr0) => Mem[65536]
store   r0  =>   r4 //store  r0 => r4 
mult    r2, r2  =>   r0
rshift  r2, r0  =>   r0
loadI   32772  =>   r4  // loadI  65540 => r4            // 🤮🤮🤮🤮spill pr1 (vr3) => Mem[65540]
store   r1  =>   r4     // store  r1 => r4 
lshift  r2, r0  =>   r1
add     r1, r0  =>   r0
sub     r2, r0  =>   r0
store   r0  =>   r3
load    r3  =>   r3
loadI   32772  =>   r0  // loadI  65540 => r0            // 😎😎😎😎restore  Mem[65540] (vr3) => pr 0
load    r0  =>   r0     // load   r0 => r0 
add     r3, r0  =>   r0
loadI   32768  =>   r3  // loadI  65536 => r3            // restore  Mem[65536] (vr0) => pr 3
load    r3  =>   r3     // load   r3 => r3 
store   r0  =>   r3
output  1024