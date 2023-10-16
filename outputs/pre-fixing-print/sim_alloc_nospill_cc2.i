ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 4 => r1 (4)]
2:      [load r0 (addr: 0) => r2 (1)]
3:      [add r0 (0), r1 (4) => r0 (4)]
4:      [load r0 (addr: 4) => r3 (2)] *2
5:      [add r0 (4), r1 (4) => r0 (8)]
6:      [load r0 (addr: 8) => r4 (3)] *4
7:      [add r0 (8), r1 (4) => r0 (12)]
8:      [load r0 (addr: 12) => r5 (4)] *6
9:      [add r0 (12), r1 (4) => r0 (16)]
10:     [load r0 (addr: 16) => r6 (5)] *8
11:     [add r0 (16), r1 (4) => r0 (20)]
12:     [load r0 (addr: 20) => r7 (6)] *10
13:     [add r0 (20), r1 (4) => r0 (24)]
14:     [load r0 (addr: 24) => r8 (7)] *12
15:     [add r0 (24), r1 (4) => r0 (28)]
16:     [load r0 (addr: 28) => r9 (8)] *14
17:     [add r0 (28), r1 (4) => r0 (32)]
18:     [load r0 (addr: 32) => r10 (9)] *16
19:     [add r0 (32), r1 (4) => r1 (36)]
20:     [load r1 (addr: 36) => r1 (10)] *18
21:     [add r2 (1), r3 (2) => r3 (3)]
22:     [add r4 (3), r5 (4) => r5 (7)] *20
23:     [add r6 (5), r7 (6) => r7 (11)]
24:     [add r8 (7), r9 (8) => r9 (15)]
25:     [add r10 (9), r1 (10) => r1 (19)]
26:     [add r3 (3), r5 (7) => r5 (10)]
27:     [add r7 (11), r9 (15) => r9 (26)]
28:     [add r5 (10), r1 (19) => r1 (29)]
29:     [add r1 (29), r9 (26) => r9 (55)]
30:     [loadI 0 => r1 (0)]
31:     [store r9 (55) => r1 (addr: 0)]
32:     [ stall ]
33:     [ stall ] *31
34:     [output 0 (55)]
output generates => 55

Executed 33 instructions and 33 operations in 35 cycles.