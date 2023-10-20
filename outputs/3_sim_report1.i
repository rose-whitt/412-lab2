ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 1 => r0 (1)]
1:      [loadI 2 => r1 (2)]
2:      [loadI 4 => r2 (4)]
3:      [loadI 1 => r3 (1)]
4:      [loadI 2048 => r2 (2048)]
5:      [add r3 (1), r1 (2) => r2 (3)]
6:      [add r0 (1), r1 (2) => r1 (3)]
7:      [loadI 32768 => r4 (32768)]
8:      [store r2 (3) => r4 (addr: 32768)]
9:      [add r2 (3), r1 (3) => r2 (6)]
10:     [add r0 (1), r1 (3) => r1 (4)] *8
11:     [loadI 32772 => r4 (32772)]
12:     [store r2 (6) => r4 (addr: 32772)]
13:     [add r2 (6), r1 (4) => r2 (10)]
14:     [add r0 (1), r1 (4) => r1 (5)] *12
15:     [loadI 32776 => r4 (32776)]
16:     [store r2 (10) => r4 (addr: 32776)]
17:     [add r2 (10), r1 (5) => r2 (15)]
18:     [add r0 (1), r1 (5) => r1 (6)] *16
19:     [loadI 32780 => r4 (32780)]
20:     [store r2 (15) => r4 (addr: 32780)]
21:     [add r2 (15), r1 (6) => r2 (21)]
22:     [add r0 (1), r1 (6) => r1 (7)] *20
23:     [loadI 32784 => r4 (32784)]
24:     [store r2 (21) => r4 (addr: 32784)]
25:     [add r2 (21), r1 (7) => r2 (28)]
26:     [add r0 (1), r1 (7) => r1 (8)] *24
27:     [loadI 32788 => r4 (32788)]
28:     [store r2 (28) => r4 (addr: 32788)]
29:     [add r2 (28), r1 (8) => r2 (36)]
30:     [add r0 (1), r1 (8) => r1 (9)] *28
31:     [loadI 32792 => r4 (32792)]
32:     [store r2 (36) => r4 (addr: 32792)]
33:     [add r2 (36), r1 (9) => r2 (45)]
34:     [add r0 (1), r1 (9) => r1 (10)] *32
35:     [loadI 32796 => r4 (32796)]
36:     [store r2 (45) => r4 (addr: 32796)]
37:     [add r2 (45), r1 (10) => r2 (55)]
38:     [add r0 (1), r1 (10) => r1 (11)] *36
39:     [loadI 32800 => r4 (32800)]
40:     [store r2 (55) => r4 (addr: 32800)]
41:     [add r2 (55), r1 (11) => r2 (66)]
42:     [add r0 (1), r1 (11) => r1 (12)] *40
43:     [loadI 2048 => r0 (2048)]
44:     [store r3 (1) => r0 (addr: 2048)]
45:     [loadI 4 => r3 (4)]
46:     [add r0 (2048), r3 (4) => r0 (2052)] *44
47:     [loadI 32804 => r4 (32804)]
48:     [store r1 (12) => r4 (addr: 32804)]
49:     [loadI 32768 => r1 (32768)]
50:     [load r1 (addr: 32768) => r1 (3)] *48
51:     [ stall ]
52:     [ stall ] *50
53:     [store r1 (3) => r0 (addr: 2052)]
54:     [add r0 (2052), r3 (4) => r0 (2056)]
55:     [loadI 32772 => r1 (32772)] *53
56:     [load r1 (addr: 32772) => r1 (6)]
57:     [ stall ]
58:     [ stall ] *56
59:     [store r1 (6) => r0 (addr: 2056)]
60:     [add r0 (2056), r3 (4) => r0 (2060)]
61:     [loadI 32776 => r1 (32776)] *59
62:     [load r1 (addr: 32776) => r1 (10)]
63:     [ stall ]
64:     [ stall ] *62
65:     [store r1 (10) => r0 (addr: 2060)]
66:     [add r0 (2060), r3 (4) => r0 (2064)]
67:     [loadI 32780 => r1 (32780)] *65
68:     [load r1 (addr: 32780) => r1 (15)]
69:     [ stall ]
70:     [ stall ] *68
71:     [store r1 (15) => r0 (addr: 2064)]
72:     [add r0 (2064), r3 (4) => r0 (2068)]
73:     [loadI 32784 => r1 (32784)] *71
74:     [load r1 (addr: 32784) => r1 (21)]
75:     [ stall ]
76:     [ stall ] *74
77:     [store r1 (21) => r0 (addr: 2068)]
78:     [add r0 (2068), r3 (4) => r0 (2072)]
79:     [loadI 32788 => r1 (32788)] *77
80:     [load r1 (addr: 32788) => r1 (28)]
81:     [ stall ]
82:     [ stall ] *80
83:     [store r1 (28) => r0 (addr: 2072)]
84:     [add r0 (2072), r3 (4) => r0 (2076)]
85:     [loadI 32792 => r1 (32792)] *83
86:     [load r1 (addr: 32792) => r1 (36)]
87:     [ stall ]
88:     [ stall ] *86
89:     [store r1 (36) => r0 (addr: 2076)]
90:     [add r0 (2076), r3 (4) => r0 (2080)]
91:     [loadI 32796 => r1 (32796)] *89
92:     [load r1 (addr: 32796) => r1 (45)]
93:     [ stall ]
94:     [ stall ] *92
95:     [store r1 (45) => r0 (addr: 2080)]
96:     [add r0 (2080), r3 (4) => r0 (2084)]
97:     [loadI 32800 => r1 (32800)] *95
98:     [load r1 (addr: 32800) => r1 (55)]
99:     [ stall ]
100:    [ stall ] *98
101:    [store r1 (55) => r0 (addr: 2084)]
102:    [add r0 (2084), r3 (4) => r3 (2088)]
103:    [store r2 (66) => r3 (addr: 2088)] *101
104:    [output 2048 (1)]
output generates => 1
105:    [output 2052 (3)] *103
output generates => 3
106:    [output 2056 (6)]
output generates => 6
107:    [output 2060 (10)]
output generates => 10
108:    [output 2064 (15)]
output generates => 15
109:    [output 2068 (21)]
output generates => 21
110:    [output 2072 (28)]
output generates => 28
111:    [output 2076 (36)]
output generates => 36
112:    [output 2080 (45)]
output generates => 45
113:    [output 2084 (55)]
output generates => 55

Executed 96 instructions and 96 operations in 114 cycles.