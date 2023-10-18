ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 1 => r1 (1)]
2:      [add r0 (0), r1 (1) => r1 (1)]
3:      [add r1 (1), r0 (0) => r2 (1)]
4:      [add r2 (1), r1 (1) => r3 (2)]
5:      [add r3 (2), r2 (1) => r0 (3)]
6:      [loadI 65536 => r4 (65536)]
7:      [store r3 (2) => r4 (addr: 65536)]
8:      [add r0 (3), r3 (2) => r3 (5)]
9:      [loadI 65540 => r4 (65540)] *7
10:     [store r0 (3) => r4 (addr: 65540)]
11:     [add r3 (5), r0 (3) => r0 (8)]
12:     [loadI 65544 => r4 (65544)] *10
13:     [store r3 (5) => r4 (addr: 65544)]
14:     [add r0 (8), r3 (5) => r3 (13)]
15:     [loadI 65548 => r4 (65548)] *13
16:     [store r0 (8) => r4 (addr: 65548)]
17:     [add r3 (13), r0 (8) => r0 (21)]
18:     [loadI 65552 => r4 (65552)] *16
19:     [store r3 (13) => r4 (addr: 65552)]
20:     [add r0 (21), r3 (13) => r3 (34)]
21:     [loadI 65556 => r4 (65556)] *19
22:     [store r3 (34) => r4 (addr: 65556)]
23:     [add r3 (34), r0 (21) => r3 (55)]
24:     [loadI 65560 => r4 (65560)] *22
25:     [store r3 (55) => r4 (addr: 65560)]
26:     [loadI 0 => r4 (0)]
27:     [loadI 2000 => r3 (2000)] *25
28:     [store r4 (0) => r3 (addr: 2000)]
29:     [loadI 4 => r4 (4)]
30:     [add r3 (2000), r4 (4) => r3 (2004)] *28
31:     [store r1 (1) => r3 (addr: 2004)]
32:     [loadI 4 => r1 (4)]
33:     [add r3 (2004), r1 (4) => r3 (2008)] *31
34:     [store r2 (1) => r3 (addr: 2008)]
35:     [add r3 (2008), r1 (4) => r3 (2012)]
36:     [loadI 65536 => r2 (65536)] *34
37:     [load r2 (addr: 65536) => r2 (2)]
38:     [ stall ]
39:     [ stall ] *37
40:     [store r2 (2) => r3 (addr: 2012)]
41:     [add r3 (2012), r1 (4) => r3 (2016)]
42:     [loadI 65540 => r2 (65540)] *40
43:     [load r2 (addr: 65540) => r2 (3)]
44:     [ stall ]
45:     [ stall ] *43
46:     [store r2 (3) => r3 (addr: 2016)]
47:     [add r3 (2016), r1 (4) => r3 (2020)]
48:     [loadI 65544 => r2 (65544)] *46
49:     [load r2 (addr: 65544) => r2 (5)]
50:     [ stall ]
51:     [ stall ] *49
52:     [store r2 (5) => r3 (addr: 2020)]
53:     [add r3 (2020), r1 (4) => r3 (2024)]
54:     [loadI 65548 => r2 (65548)] *52
55:     [load r2 (addr: 65548) => r2 (8)]
56:     [ stall ]
57:     [ stall ] *55
58:     [store r2 (8) => r3 (addr: 2024)]
59:     [add r3 (2024), r1 (4) => r3 (2028)]
60:     [loadI 65552 => r2 (65552)] *58
61:     [load r2 (addr: 65552) => r2 (13)]
62:     [ stall ]
63:     [ stall ] *61
64:     [store r2 (13) => r3 (addr: 2028)]
65:     [add r3 (2028), r1 (4) => r3 (2032)]
66:     [store r0 (21) => r3 (addr: 2032)] *64
67:     [add r3 (2032), r1 (4) => r3 (2036)]
68:     [loadI 65556 => r0 (65556)] *66
69:     [load r0 (addr: 65556) => r0 (34)]
70:     [ stall ]
71:     [ stall ] *69
72:     [store r0 (34) => r3 (addr: 2036)]
73:     [add r3 (2036), r1 (4) => r1 (2040)]
74:     [loadI 65560 => r3 (65560)] *72
75:     [load r3 (addr: 65560) => r3 (55)]
76:     [ stall ]
77:     [ stall ] *75
78:     [store r3 (55) => r1 (addr: 2040)]
79:     [output 2000 (0)]
output generates => 0
80:     [output 2004 (1)] *78
output generates => 1
81:     [output 2008 (1)]
output generates => 1
82:     [output 2012 (2)]
output generates => 2
83:     [output 2016 (3)]
output generates => 3
84:     [output 2020 (5)]
output generates => 5
85:     [output 2024 (8)]
output generates => 8
86:     [output 2028 (13)]
output generates => 13
87:     [output 2032 (21)]
output generates => 21
88:     [output 2036 (34)]
output generates => 34
89:     [output 2040 (55)]
output generates => 55

Executed 76 instructions and 76 operations in 90 cycles.