ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 1024 => r0 (1024)]
1:      [loadI 128 => r1 (128)]
2:      [loadI 32 => r2 (32)]
3:      [loadI 1028 => r3 (1028)]
4:      [mult r2 (32), r2 (32) => r4 (1024)]
5:      [rshift r2 (32), r4 (1024) => r4 (32)]
6:      [loadI 32768 => r4 (32768)]
7:      [store r0 (1024) => r4 (addr: 32768)]
8:      [lshift r2 (32), r4 (32768) => r0 (32)]
9:      [add r0 (32), r4 (32768) => r4 (32800)] *7
10:     [sub r2 (32), r4 (32800) => r4 (-32768)]
11:     [store r4 (-32768) => r3 (addr: 1028)]
12:     [ stall ]
13:     [ stall ] *11
14:     [load r3 (addr: 1028) => r3 (-32768)]
15:     [ stall ]
16:     [ stall ] *14
17:     [add r3 (-32768), r1 (128) => r1 (-32640)]
18:     [loadI 32768 => r3 (32768)]
19:     [load r3 (addr: 32768) => r3 (1024)]
20:     [ stall ]
21:     [ stall ] *19
22:     [store r1 (-32640) => r3 (addr: 1024)]
23:     [ stall ]
24:     [ stall ] *22
25:     [output 1024 (-32640)]
output generates => -32640

Executed 18 instructions and 18 operations in 26 cycles.