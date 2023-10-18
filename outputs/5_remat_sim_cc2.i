ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [load r0 (addr: 0) => r1 (1)]
2:      [loadI 4 => r2 (4)]
3:      [add r0 (0), r2 (4) => r0 (4)] *1
4:      [load r0 (addr: 4) => r3 (2)]
5:      [add r0 (4), r2 (4) => r0 (8)]
6:      [loadI 65536 => r4 (65536)] *4
7:      [store r1 (1) => r4 (addr: 65536)]
8:      [load r0 (addr: 8) => r1 (3)]
9:      [add r0 (8), r2 (4) => r0 (12)] *7
10:     [load r0 (addr: 12) => r2 (4)] *8
11:     [loadI 4 => r4 (4)]
12:     [add r0 (12), r4 (4) => r0 (16)] *10
13:     [loadI 65540 => r4 (65540)]
14:     [store r1 (3) => r4 (addr: 65540)]
15:     [load r0 (addr: 16) => r1 (5)]
16:     [loadI 4 => r4 (4)] *14
17:     [add r0 (16), r4 (4) => r0 (20)] *15
18:     [loadI 65544 => r4 (65544)]
19:     [store r1 (5) => r4 (addr: 65544)]
20:     [load r0 (addr: 20) => r1 (6)]
21:     [loadI 4 => r4 (4)] *19
22:     [add r0 (20), r4 (4) => r0 (24)] *20
23:     [loadI 65548 => r4 (65548)]
24:     [store r1 (6) => r4 (addr: 65548)]
25:     [load r0 (addr: 24) => r1 (7)]
26:     [loadI 4 => r4 (4)] *24
27:     [add r0 (24), r4 (4) => r0 (28)] *25
28:     [loadI 65552 => r4 (65552)]
29:     [store r1 (7) => r4 (addr: 65552)]
30:     [load r0 (addr: 28) => r1 (8)]
31:     [loadI 4 => r4 (4)] *29
32:     [add r0 (28), r4 (4) => r0 (32)] *30
33:     [loadI 65556 => r4 (65556)]
34:     [store r1 (8) => r4 (addr: 65556)]
35:     [load r0 (addr: 32) => r1 (9)]
36:     [loadI 4 => r4 (4)] *34
37:     [add r0 (32), r4 (4) => r0 (36)] *35
38:     [load r0 (addr: 36) => r0 (10)]
39:     [loadI 65560 => r4 (65560)]
40:     [ stall ] *38
41:     [store r0 (10) => r4 (addr: 65560)]
42:     [loadI 65536 => r0 (65536)]
43:     [load r0 (addr: 65536) => r0 (1)] *41
44:     [ stall ]
45:     [ stall ] *43
46:     [add r0 (1), r3 (2) => r3 (3)]
47:     [loadI 65540 => r0 (65540)]
48:     [load r0 (addr: 65540) => r0 (3)]
49:     [ stall ]
50:     [ stall ] *48
51:     [add r0 (3), r2 (4) => r2 (7)]
52:     [loadI 65544 => r0 (65544)]
53:     [load r0 (addr: 65544) => r0 (5)]
54:     [loadI 65564 => r4 (65564)]
55:     [store r2 (7) => r4 (addr: 65564)] *53
56:     [loadI 65548 => r2 (65548)]
57:     [load r2 (addr: 65548) => r2 (6)] *55
58:     [ stall ]
59:     [ stall ] *57
60:     [add r0 (5), r2 (6) => r2 (11)]
61:     [loadI 65552 => r0 (65552)]
62:     [load r0 (addr: 65552) => r0 (7)]
63:     [loadI 65568 => r4 (65568)]
64:     [store r2 (11) => r4 (addr: 65568)] *62
65:     [loadI 65556 => r2 (65556)]
66:     [load r2 (addr: 65556) => r2 (8)] *64
67:     [ stall ]
68:     [ stall ] *66
69:     [add r0 (7), r2 (8) => r2 (15)]
70:     [loadI 65560 => r0 (65560)]
71:     [load r0 (addr: 65560) => r0 (10)]
72:     [ stall ]
73:     [ stall ] *71
74:     [add r1 (9), r0 (10) => r0 (19)]
75:     [loadI 65564 => r1 (65564)]
76:     [load r1 (addr: 65564) => r1 (7)]
77:     [ stall ]
78:     [ stall ] *76
79:     [add r3 (3), r1 (7) => r1 (10)]
80:     [loadI 65568 => r3 (65568)]
81:     [load r3 (addr: 65568) => r3 (11)]
82:     [ stall ]
83:     [ stall ] *81
84:     [add r3 (11), r2 (15) => r2 (26)]
85:     [add r1 (10), r0 (19) => r0 (29)]
86:     [add r0 (29), r2 (26) => r2 (55)]
87:     [loadI 0 => r0 (0)]
88:     [store r2 (55) => r0 (addr: 0)]
89:     [ stall ]
90:     [ stall ] *88
91:     [output 0 (55)]
output generates => 55

Executed 75 instructions and 75 operations in 92 cycles.