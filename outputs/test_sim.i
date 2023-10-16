ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 128 => r0 (128)]
1:      [load r0 (addr: 128) => r1 (0)]
2:      [loadI 132 => r2 (132)]
3:      [load r2 (addr: 132) => r2 (0)] *1
4:      [loadI 136 => r3 (136)]
5:      [load r3 (addr: 136) => r3 (0)] *3
6:      [ stall ]
7:      [ stall ] *5
8:      [mult r2 (0), r3 (0) => r3 (0)]
9:      [add r1 (0), r3 (0) => r3 (0)]
10:     [store r3 (0) => r0 (addr: 128)]
 *10
Executed 9 instructions and 9 operations in 13 cycles.