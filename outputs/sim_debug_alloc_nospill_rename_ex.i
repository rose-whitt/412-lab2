ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 128 => r1 (128)]
1:      [load r1 (addr: 128) => r2 (0)]
2:      [loadI 132 => r7 (132)]
3:      [load r7 (addr: 132) => r4 (0)] *1
4:      [loadI 136 => r6 (136)]
5:      [load r6 (addr: 136) => r5 (0)] *3
6:      [ stall ]
7:      [ stall ] *5
8:      [mult r4 (0), r5 (0) => r3 (0)]
9:      [add r2 (0), r3 (0) => r0 (0)]
10:     [store r0 (0) => r1 (addr: 128)]
 *10
Executed 9 instructions and 9 operations in 13 cycles.