ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 4 => r1 (4)]
2:      [load r0 (addr: 0) => r2 (1)]
3:      [add r0 (0), r1 (4) => r0 (4)]
4:      [load r0 (addr: 4) => r3 (2)] *2
5:      [add r0 (4), r1 (4) => r0 (8)]
6:      [loadI 32768 => r4 (32768)] *4
7:      [store r4 (32768) => r4 (addr: 32768)]
8:      [load r0 (addr: 8) => r4 (3)]
9:      [add r0 (8), r1 (4) => r0 (12)] *7
10:     [ stall ] *8
11:     [loadI 32772 => r4 (32772)]
12:     [store r4 (32772) => r4 (addr: 32772)]
13:     [load r0 (addr: 12) => r4 (4)]
14:     [add r0 (12), r1 (4) => r0 (16)] *12
15:     [ stall ] *13
16:     [loadI 32776 => r4 (32776)]
17:     [store r4 (32776) => r4 (addr: 32776)]
18:     [load r0 (addr: 16) => r4 (5)]
19:     [add r0 (16), r1 (4) => r0 (20)] *17
20:     [ stall ] *18
21:     [loadI 32780 => r4 (32780)]
22:     [store r4 (32780) => r4 (addr: 32780)]
23:     [load r0 (addr: 20) => r4 (6)]
24:     [add r0 (20), r1 (4) => r0 (24)] *22
25:     [ stall ] *23
26:     [loadI 32784 => r4 (32784)]
27:     [store r4 (32784) => r4 (addr: 32784)]
28:     [load r0 (addr: 24) => r4 (7)]
29:     [add r0 (24), r1 (4) => r0 (28)] *27
30:     [ stall ] *28
31:     [loadI 32788 => r4 (32788)]
32:     [store r4 (32788) => r4 (addr: 32788)]
33:     [load r0 (addr: 28) => r4 (8)]
34:     [add r0 (28), r1 (4) => r0 (32)] *32
35:     [ stall ] *33
36:     [loadI 32792 => r4 (32792)]
37:     [store r4 (32792) => r4 (addr: 32792)]
38:     [load r0 (addr: 32) => r4 (9)]
39:     [add r0 (32), r1 (4) => r1 (36)] *37
40:     [load r1 (addr: 36) => r1 (10)] *38
41:     [add r2 (1), r3 (2) => r3 (3)]
42:     [loadI 32772 => r2 (32772)] *40
43:     [load r2 (addr: 32772) => r2 (32772)]
44:     [loadI 32776 => r0 (32776)]
45:     [load r0 (addr: 32776) => r0 (32776)] *43
46:     [ stall ]
47:     [ stall ] *45
48:     [add r2 (32772), r0 (32776) => r0 (65548)]
49:     [loadI 32780 => r2 (32780)]
50:     [load r2 (addr: 32780) => r2 (32780)]
51:     [loadI 32796 => r4 (32796)]
52:     [store r0 (65548) => r4 (addr: 32796)] *50
53:     [loadI 32784 => r0 (32784)]
54:     [load r0 (addr: 32784) => r0 (32784)] *52
55:     [ stall ]
56:     [ stall ] *54
57:     [add r2 (32780), r0 (32784) => r0 (65564)]
58:     [loadI 32788 => r2 (32788)]
59:     [load r2 (addr: 32788) => r2 (32788)]
60:     [loadI 32800 => r4 (32800)]
61:     [store r0 (65564) => r4 (addr: 32800)] *59
62:     [loadI 32792 => r0 (32792)]
63:     [load r0 (addr: 32792) => r0 (32792)] *61
64:     [ stall ]
65:     [ stall ] *63
66:     [add r2 (32788), r0 (32792) => r0 (65580)]
67:     [add r4 (32800), r1 (10) => r1 (32810)]
68:     [loadI 32796 => r4 (32796)]
69:     [load r4 (addr: 32796) => r4 (65548)]
70:     [ stall ]
71:     [ stall ] *69
72:     [add r3 (3), r4 (65548) => r4 (65551)]
73:     [loadI 32800 => r3 (32800)]
74:     [load r3 (addr: 32800) => r3 (65564)]
75:     [ stall ]
76:     [ stall ] *74
77:     [add r3 (65564), r0 (65580) => r0 (131144)]
78:     [add r4 (65551), r1 (32810) => r1 (98361)]
79:     [add r1 (98361), r0 (131144) => r0 (229505)]
80:     [loadI 0 => r1 (0)]
81:     [store r0 (229505) => r1 (addr: 0)]
82:     [ stall ]
83:     [ stall ] *81
84:     [output 0 (229505)]
output generates => 229505

Executed 67 instructions and 67 operations in 85 cycles.