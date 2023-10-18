ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 128 => r0 (128)]
1:      [load r0 (addr: 128) => r1 (1)]
2:      [loadI 132 => r2 (132)]
3:      [load r2 (addr: 132) => r2 (2)] *1
4:      [loadI 136 => r3 (136)]
5:      [load r3 (addr: 136) => r0 (3)] *3
6:      [ stall ]
7:      [ stall ] *5
8:      [mult r2 (2), r0 (3) => r0 (6)]
9:      [add r1 (1), r0 (6) => r0 (7)]
10:     [loadI 128 => r1 (128)]
11:     [store r0 (7) => r1 (addr: 128)]
 *11
Executed 10 instructions and 10 operations in 14 cycles.