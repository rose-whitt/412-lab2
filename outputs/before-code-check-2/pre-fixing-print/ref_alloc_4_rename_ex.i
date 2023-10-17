loadI  128 => r0              // from input block
load   r0 => r1               // Mem[vr0] => vr2
loadI  132 => r2              // from input block
load   r2 => r2               // Mem[vr7] => vr4
loadI  65536 => r3            // spill pr0 (vr0) => Mem[65536]
store  r0 => r3 
loadI  136 => r0              // from input block
load   r0 => r0               // Mem[vr6] => vr5
mult   r2, r0  => r0          // vr4, vr5 => vr3
add    r1, r0  => r0          // vr2, vr3 => vr1
loadI  65536 => r1            // restore  Mem[65536] (vr0) => pr 1
load   r1 => r1 
store  r0 => r1               // vr1 => Mem[vr0]