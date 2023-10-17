ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 128 => r0 (128)]
1:      [load r0 (addr: 128) => r1 (0)]
2:      [loadI 132 => r2 (132)]
3:      [load r2 (addr: 132) => r2 (0)] *1
4:      [loadI 65536 => r3 (65536)]
5:      [store r0 (128) => r3 (addr: 65536)] *3
6:      [loadI 136 => r0 (136)]
7:      [load r0 (addr: 136) => r0 (0)] *5
8:      [ stall ]
9:      [ stall ] *7
10:     [mult r2 (0), r0 (0) => r0 (0)]
11:     [add r1 (0), r0 (0) => r0 (0)]
12:     [loadI 65536 => r1 (65536)]
13:     [load r1 (addr: 65536) => r1 (128)]
14:     [ stall ]
15:     [ stall ] *13
16:     [store r0 (0) => r1 (addr: 128)]
 *16
Executed 13 instructions and 13 operations in 19 cycles.