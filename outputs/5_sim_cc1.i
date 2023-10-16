ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 1024 => r0 (1024)]
1:      [loadI 128 => r1 (128)]
2:      [loadI 32 => r2 (32)]
3:      [loadI 1028 => r3 (1028)]
4:      [loadI 65536 => r4 (65536)]
5:      [store r0 (1024) => r4 (addr: 65536)]
6:      [mult r2 (32), r2 (32) => r0 (1024)]
7:      [rshift r2 (32), r0 (1024) => r0 (32)] *5
8:      [loadI 65540 => r4 (65540)]
9:      [store r1 (128) => r4 (addr: 65540)]
10:     [lshift r2 (32), r0 (32) => r1 (32)]
11:     [add r1 (32), r0 (32) => r0 (64)] *9
12:     [sub r2 (32), r0 (64) => r0 (-32)]
13:     [store r0 (-32) => r3 (addr: 1028)]
14:     [ stall ]
15:     [ stall ] *13
16:     [load r3 (addr: 1028) => r3 (-32)]
17:     [loadI 65540 => r0 (65540)]
18:     [load r0 (addr: 65540) => r0 (128)] *16
19:     [ stall ]
20:     [ stall ] *18
21:     [add r3 (-32), r0 (128) => r0 (96)]
22:     [nop ]
23:     [loadI 65536 => r3 (65536)]
24:     [load r3 (addr: 65536) => r3 (1024)]
25:     [ stall ]
26:     [ stall ] *24
27:     [store r0 (96) => r3 (addr: 1024)]
28:     [ stall ]
29:     [ stall ] *27
30:     [output 1024 (96)]
output generates => 96

Executed 23 instructions and 23 operations in 31 cycles.