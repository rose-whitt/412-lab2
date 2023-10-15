ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r30 (0)]
1:      [loadI 4 => r22 (4)]
2:      [load r30 (addr: 0) => r18 (1)]
3:      [add r30 (0), r22 (4) => r29 (4)]
4:      [load r29 (addr: 4) => r19 (2)] *2
5:      [add r29 (4), r22 (4) => r28 (8)]
6:      [load r28 (addr: 8) => r16 (3)] *4
7:      [add r28 (8), r22 (4) => r27 (12)]
8:      [load r27 (addr: 12) => r17 (4)] *6
9:      [add r27 (12), r22 (4) => r26 (16)]
10:     [load r26 (addr: 16) => r14 (5)] *8
11:     [add r26 (16), r22 (4) => r25 (20)]
12:     [load r25 (addr: 20) => r15 (6)] *10
13:     [add r25 (20), r22 (4) => r24 (24)]
14:     [load r24 (addr: 24) => r12 (7)] *12
15:     [add r24 (24), r22 (4) => r23 (28)]
16:     [load r23 (addr: 28) => r13 (8)] *14
17:     [add r23 (28), r22 (4) => r21 (32)]
18:     [load r21 (addr: 32) => r10 (9)] *16
19:     [add r21 (32), r22 (4) => r20 (36)]
20:     [load r20 (addr: 36) => r11 (10)] *18
21:     [add r18 (1), r19 (2) => r8 (3)]
22:     [add r16 (3), r17 (4) => r9 (7)] *20
23:     [add r14 (5), r15 (6) => r6 (11)]
24:     [add r12 (7), r13 (8) => r7 (15)]
25:     [add r10 (9), r11 (10) => r5 (19)]
26:     [add r8 (3), r9 (7) => r4 (10)]
27:     [add r6 (11), r7 (15) => r3 (26)]
28:     [add r4 (10), r5 (19) => r2 (29)]
29:     [add r2 (29), r3 (26) => r0 (55)]
30:     [loadI 0 => r1 (0)]
31:     [store r0 (55) => r1 (addr: 0)]
32:     [ stall ]
33:     [ stall ] *31
34:     [output 0 (55)]
output generates => 55

Executed 33 instructions and 33 operations in 35 cycles.