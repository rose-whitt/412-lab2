ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 1024 => r1 (1024)]
1:      [loadI 128 => r3 (128)]
2:      [loadI 32 => r6 (32)]
3:      [loadI 1028 => r4 (1028)]
4:      [mult r6 (32), r6 (32) => r10 (1024)]
5:      [rshift r6 (32), r10 (1024) => r9 (32)]
6:      [lshift r6 (32), r9 (32) => r8 (32)]
7:      [add r8 (32), r9 (32) => r7 (64)]
8:      [sub r6 (32), r7 (64) => r5 (-32)]
9:      [store r5 (-32) => r4 (addr: 1028)]
10:     [ stall ]
11:     [ stall ] *9
12:     [load r4 (addr: 1028) => r2 (-32)]
13:     [ stall ]
14:     [ stall ] *12
15:     [add r2 (-32), r3 (128) => r0 (96)]
16:     [store r0 (96) => r1 (addr: 1024)]
17:     [ stall ]
18:     [ stall ] *16
19:     [output 1024 (96)]
output generates => 96

Executed 14 instructions and 14 operations in 20 cycles.