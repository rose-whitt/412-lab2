
loadI   0  =>   r0
loadI   4  =>   r1
load    r0  =>   r2
add     r0, r1  =>   r0
load    r0  =>   r3
add     r0, r1  =>   r0
loadI   32768  =>   r4  // loadI  65536 => r4            // spill pr2 (vr18) => Mem[65536]
store   r4  =>   r4     // store  r2 => r4      pr_freed is r4 but should be r2, should never be r4
load    r0  =>   r4
add     r0, r1  =>   r0
loadI   32772  =>   r4  // loadI  65540 => r4            // spill pr2 (vr16) => Mem[65540]
store   r4  =>   r4     // store  r2 => r4 
load    r0  =>   r4     // load   r0 => r2               // Mem[vr27] => vr17
add     r0, r1  =>   r0
loadI   32776  =>   r4  // loadI  65544 => r4            // spill pr2 (vr17) => Mem[65544]
store   r4  =>   r4     // store  r2 => r4 
load    r0  =>   r4     // load   r0 => r2               // Mem[vr25] => vr15
add     r0, r1  =>   r0 // add    r0, r1  => r0          // vr25, vr22 => vr24
loadI   32780  =>   r4  // loadI  65552 => r4            // spill pr2 (vr15) => Mem[65552]
store   r4  =>   r4     // store  r2 => r4 
load    r0  =>   r4
add     r0, r1  =>   r0
loadI   32784  =>   r4
store   r4  =>   r4
load    r0  =>   r4
add     r0, r1  =>   r0
loadI   32788  =>   r4
store   r4  =>   r4
load    r0  =>   r4
add     r0, r1  =>   r0
loadI   32792  =>   r4
store   r4  =>   r4
load    r0  =>   r4
add     r0, r1  =>   r1
load    r1  =>   r1
add     r2, r3  =>   r3
loadI   32772  =>   r2
load    r2  =>   r2
loadI   32776  =>   r0
load    r0  =>   r0
add     r2, r0  =>   r0
loadI   32780  =>   r2
load    r2  =>   r2
loadI   32796  =>   r4
store   r0  =>   r4
loadI   32784  =>   r0
load    r0  =>   r0
add     r2, r0  =>   r0
loadI   32788  =>   r2
load    r2  =>   r2
loadI   32800  =>   r4
store   r0  =>   r4
loadI   32792  =>   r0
load    r0  =>   r0
add     r2, r0  =>   r0
add     r4, r1  =>   r1
loadI   32796  =>   r4
load    r4  =>   r4
add     r3, r4  =>   r4
loadI   32800  =>   r3
load    r3  =>   r3
add     r3, r0  =>   r0
add     r4, r1  =>   r1
add     r1, r0  =>   r0
loadI   0  =>   r1
store   r0  =>   r1
output  0