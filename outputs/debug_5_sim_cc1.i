ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 1024 => r0 (1024)]
1:      [loadI 128 => r1 (128)]
2:      [loadI 32 => r2 (32)]
3:      [loadI 1028 => r3 (1028)]
4:      [loadI 32768 => r4 (32768)]
5:      [store r0 (1024) => r4 (addr: 32768)]
6:      [mult r2 (32), r2 (32) => r0 (1024)]
7:      [rshift r2 (32), r0 (1024) => r0 (32)] *5
8:      [loadI 32772 => r4 (32772)]
9:      [store r1 (128) => r4 (addr: 32772)]
10:     [lshift r2 (32), r0 (32) => r1 (32)]
11:     [add r1 (32), r0 (32) => r0 (64)] *9
12:     [sub r2 (32), r0 (64) => r0 (-32)]
13:     [store r0 (-32) => r3 (addr: 1028)]
14:     [ stall ]
15:     [ stall ] *13
16:     [load r3 (addr: 1028) => r3 (-32)]
17:     [loadI 32772 => r0 (32772)]
18:     [load r0 (addr: 32772) => r0 (128)] *16
19:     [ stall ]
20:     [ stall ] *18
21:     [add r3 (-32), r0 (128) => r0 (96)]
22:     [loadI 32768 => r3 (32768)]
23:     [load r3 (addr: 32768) => r3 (1024)]
24:     [ stall ]
25:     [ stall ] *23
26:     [store r0 (96) => r3 (addr: 1024)]
27:     [ stall ]
28:     [ stall ] *26
29:     [output 1024 (96)]
output generates => 96

Executed 22 instructions and 22 operations in 30 cycles.