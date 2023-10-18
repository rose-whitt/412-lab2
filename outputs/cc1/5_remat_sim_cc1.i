ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 32 => r0 (32)]
1:      [mult r0 (32), r0 (32) => r1 (1024)]
2:      [rshift r0 (32), r1 (1024) => r1 (32)]
3:      [lshift r0 (32), r1 (32) => r2 (32)]
4:      [add r2 (32), r1 (32) => r1 (64)]
5:      [sub r0 (32), r1 (64) => r1 (-32)]
6:      [loadI 1028 => r0 (1028)]
7:      [store r1 (-32) => r0 (addr: 1028)]
8:      [ stall ]
9:      [ stall ] *7
10:     [load r0 (addr: 1028) => r0 (-32)]
11:     [loadI 128 => r1 (128)]
12:     [ stall ] *10
13:     [add r0 (-32), r1 (128) => r1 (96)]
14:     [nop ]
15:     [loadI 1024 => r0 (1024)]
16:     [store r1 (96) => r0 (addr: 1024)]
17:     [ stall ]
18:     [ stall ] *16
19:     [output 1024 (96)]
output generates => 96

Executed 15 instructions and 15 operations in 20 cycles.