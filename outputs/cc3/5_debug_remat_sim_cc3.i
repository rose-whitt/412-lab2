ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [add r0 (0), r0 (0) => r1 (0)]
2:      [loadI 4 => r2 (4)]
3:      [load r1 (addr: 0) => r3 (2)]
4:      [add r1 (0), r2 (4) => r1 (4)]
5:      [loadI 32772 => r4 (32772)] *3
6:      [store r3 (2) => r4 (addr: 32772)]
7:      [load r1 (addr: 4) => r3 (4)]
8:      [add r1 (4), r2 (4) => r2 (8)] *6
9:      [load r2 (addr: 8) => r2 (0)] *7
10:     [loadI 32776 => r4 (32776)]
11:     [store r1 (4) => r4 (addr: 32776)] *9
12:     [loadI 32772 => r1 (32772)]
13:     [load r1 (addr: 32772) => r1 (2)] *11
14:     [ stall ]
15:     [ stall ] *13
16:     [add r1 (2), r3 (4) => r1 (6)]
17:     [add r2 (0), r3 (4) => r3 (4)]
18:     [add r1 (6), r3 (4) => r1 (10)]
19:     [add r1 (10), r3 (4) => r2 (14)]
20:     [loadI 32780 => r4 (32780)]
21:     [store r3 (4) => r4 (addr: 32780)]
22:     [loadI 32768 => r3 (32768)]
23:     [load r3 (addr: 32768) => r3 (0)] *21
24:     [ stall ]
25:     [ stall ] *23
26:     [store r2 (14) => r3 (addr: 0)]
27:     [loadI 32776 => r2 (32776)]
28:     [load r2 (addr: 32776) => r2 (4)] *26
29:     [loadI 32784 => r4 (32784)]
30:     [ stall ] *28
31:     [store r2 (4) => r4 (addr: 32784)]
32:     [load r2 (addr: 4) => r2 (4)]
33:     [ stall ] *31
34:     [ stall ] *32
35:     [add r1 (10), r2 (4) => r1 (14)]
36:     [loadI 32788 => r4 (32788)]
37:     [store r3 (0) => r4 (addr: 32788)]
38:     [loadI 32780 => r3 (32780)]
39:     [load r3 (addr: 32780) => r3 (4)] *37
40:     [ stall ]
41:     [ stall ] *39
42:     [add r3 (4), r2 (4) => r2 (8)]
43:     [add r1 (14), r2 (8) => r1 (22)]
44:     [add r1 (22), r2 (8) => r3 (30)]
45:     [loadI 32792 => r4 (32792)]
46:     [store r2 (8) => r4 (addr: 32792)]
47:     [loadI 32788 => r2 (32788)]
48:     [load r2 (addr: 32788) => r2 (0)] *46
49:     [ stall ]
50:     [ stall ] *48
51:     [store r3 (30) => r2 (addr: 0)]
52:     [loadI 32784 => r3 (32784)]
53:     [load r3 (addr: 32784) => r3 (4)] *51
54:     [ stall ]
55:     [ stall ] *53
56:     [load r3 (addr: 4) => r3 (4)]
57:     [ stall ]
58:     [ stall ] *56
59:     [add r1 (22), r3 (4) => r1 (26)]
60:     [loadI 32796 => r4 (32796)]
61:     [store r2 (0) => r4 (addr: 32796)]
62:     [loadI 32792 => r2 (32792)]
63:     [load r2 (addr: 32792) => r2 (8)] *61
64:     [ stall ]
65:     [ stall ] *63
66:     [add r2 (8), r3 (4) => r3 (12)]
67:     [add r1 (26), r3 (12) => r1 (38)]
68:     [add r1 (38), r3 (12) => r3 (50)]
69:     [loadI 32796 => r1 (32796)]
70:     [load r1 (addr: 32796) => r1 (0)]
71:     [ stall ]
72:     [ stall ] *70
73:     [store r3 (50) => r1 (addr: 0)]
74:     [store r3 (50) => r0 (addr: 0)]
75:     [ stall ] *73
76:     [ stall ] *74
77:     [output 0 (50)]
output generates => 50

Executed 57 instructions and 57 operations in 78 cycles.