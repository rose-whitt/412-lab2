ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 1024 => r0 (1024)]
1:      [loadI 128 => r1 (128)]
2:      [loadI 32 => r2 (32)]
3:      [loadI 1028 => r3 (1028)]
4:      [mult r2 (32), r2 (32) => r4 (1024)]
5:      [rshift r2 (32), r4 (1024) => r4 (32)]
6:      [lshift r2 (32), r4 (32) => r5 (32)]
7:      [add r5 (32), r4 (32) => r4 (64)]
8:      [sub r2 (32), r4 (64) => r4 (-32)]
9:      [store r4 (-32) => r3 (addr: 1028)]
10:     [ stall ]
11:     [ stall ] *9
12:     [load r3 (addr: 1028) => r3 (-32)]
13:     [ stall ]
14:     [ stall ] *12
15:     [add r3 (-32), r1 (128) => r1 (96)]
16:     [store r1 (96) => r0 (addr: 1024)]
17:     [ stall ]
18:     [ stall ] *16
19:     [output 1024 (96)]
output generates => 96

Executed 14 instructions and 14 operations in 20 cycles.