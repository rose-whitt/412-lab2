ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 4 => r1 (4)]
2:      [load r0 (addr: 0) => r2 (1)]
3:      [add r0 (0), r1 (4) => r0 (4)]
4:      [load r0 (addr: 4) => r3 (2)] *2
5:      [add r0 (4), r1 (4) => r0 (8)]
6:      [loadI 65536 => r4 (65536)] *4
7:      [store r2 (1) => r4 (addr: 65536)]
8:      [load r0 (addr: 8) => r2 (3)]
9:      [add r0 (8), r1 (4) => r0 (12)] *7
10:     [loadI 65540 => r4 (65540)] *8
11:     [store r2 (3) => r4 (addr: 65540)]
12:     [load r0 (addr: 12) => r2 (4)]
13:     [add r0 (12), r1 (4) => r0 (16)] *11
14:     [loadI 65544 => r4 (65544)] *12
15:     [store r2 (4) => r4 (addr: 65544)]
16:     [load r0 (addr: 16) => r2 (5)]
17:     [add r0 (16), r1 (4) => r0 (20)] *15
18:     [loadI 65548 => r4 (65548)] *16
19:     [store r2 (5) => r4 (addr: 65548)]
20:     [load r0 (addr: 20) => r2 (6)]
21:     [add r0 (20), r1 (4) => r0 (24)] *19
22:     [loadI 65552 => r4 (65552)] *20
23:     [store r2 (6) => r4 (addr: 65552)]
24:     [load r0 (addr: 24) => r2 (7)]
25:     [add r0 (24), r1 (4) => r0 (28)] *23
26:     [loadI 65556 => r4 (65556)] *24
27:     [store r2 (7) => r4 (addr: 65556)]
28:     [load r0 (addr: 28) => r2 (8)]
29:     [add r0 (28), r1 (4) => r0 (32)] *27
30:     [loadI 65560 => r4 (65560)] *28
31:     [store r2 (8) => r4 (addr: 65560)]
32:     [load r0 (addr: 32) => r2 (9)]
33:     [add r0 (32), r1 (4) => r1 (36)] *31
34:     [load r1 (addr: 36) => r1 (10)] *32
35:     [loadI 65536 => r0 (65536)]
36:     [load r0 (addr: 65536) => r0 (1)] *34
37:     [ stall ]
38:     [ stall ] *36
39:     [add r0 (1), r3 (2) => r3 (3)]
40:     [loadI 65540 => r0 (65540)]
41:     [load r0 (addr: 65540) => r0 (3)]
42:     [loadI 65564 => r4 (65564)]
43:     [store r3 (3) => r4 (addr: 65564)] *41
44:     [loadI 65544 => r3 (65544)]
45:     [load r3 (addr: 65544) => r3 (4)] *43
46:     [ stall ]
47:     [ stall ] *45
48:     [add r0 (3), r3 (4) => r3 (7)]
49:     [loadI 65548 => r0 (65548)]
50:     [load r0 (addr: 65548) => r0 (5)]
51:     [loadI 65568 => r4 (65568)]
52:     [store r3 (7) => r4 (addr: 65568)] *50
53:     [loadI 65552 => r3 (65552)]
54:     [load r3 (addr: 65552) => r3 (6)] *52
55:     [ stall ]
56:     [ stall ] *54
57:     [add r0 (5), r3 (6) => r3 (11)]
58:     [loadI 65556 => r0 (65556)]
59:     [load r0 (addr: 65556) => r0 (7)]
60:     [loadI 65572 => r4 (65572)]
61:     [store r3 (11) => r4 (addr: 65572)] *59
62:     [loadI 65560 => r3 (65560)]
63:     [load r3 (addr: 65560) => r3 (8)] *61
64:     [ stall ]
65:     [ stall ] *63
66:     [add r0 (7), r3 (8) => r3 (15)]
67:     [add r2 (9), r1 (10) => r1 (19)]
68:     [loadI 65564 => r2 (65564)]
69:     [load r2 (addr: 65564) => r2 (3)]
70:     [loadI 65568 => r0 (65568)]
71:     [load r0 (addr: 65568) => r0 (7)] *69
72:     [ stall ]
73:     [ stall ] *71
74:     [add r2 (3), r0 (7) => r0 (10)]
75:     [loadI 65572 => r2 (65572)]
76:     [load r2 (addr: 65572) => r2 (11)]
77:     [ stall ]
78:     [ stall ] *76
79:     [add r2 (11), r3 (15) => r3 (26)]
80:     [add r0 (10), r1 (19) => r1 (29)]
81:     [add r1 (29), r3 (26) => r3 (55)]
82:     [loadI 0 => r1 (0)]
83:     [store r3 (55) => r1 (addr: 0)]
84:     [ stall ]
85:     [ stall ] *83
86:     [output 0 (55)]
output generates => 55

Executed 73 instructions and 73 operations in 87 cycles.