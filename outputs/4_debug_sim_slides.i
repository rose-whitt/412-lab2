ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 128 => r0 (128)]
1:      [load r0 (addr: 128) => r1 (1)]
2:      [loadI 132 => r2 (132)]
3:      [load r2 (addr: 132) => r2 (2)] *1
4:      [loadI 32768 => r3 (32768)]
5:      [store r0 (128) => r3 (addr: 32768)] *3
6:      [loadI 136 => r0 (136)]
7:      [load r0 (addr: 136) => r0 (3)] *5
8:      [ stall ]
9:      [ stall ] *7
10:     [mult r2 (2), r0 (3) => r0 (6)]
11:     [add r1 (1), r0 (6) => r0 (7)]
12:     [loadI 32768 => r1 (32768)]
13:     [load r1 (addr: 32768) => r1 (128)]
14:     [ stall ]
15:     [ stall ] *13
16:     [store r0 (7) => r1 (addr: 128)]
 *16
Executed 13 instructions and 13 operations in 19 cycles.