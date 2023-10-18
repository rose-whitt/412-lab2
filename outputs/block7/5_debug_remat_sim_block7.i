ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 4 => r1 (4)]
2:      [loadI 0 => r2 (0)]
3:      [loadI 1 => r3 (1)]
4:      [loadI 32768 => r4 (32768)]
5:      [store r0 (0) => r4 (addr: 32768)]
6:      [loadI 2000 => r0 (2000)]
7:      [add r0 (2000), r2 (0) => r0 (2000)] *5
8:      [loadI 32808 => r4 (32808)]
9:      [store r3 (1) => r4 (addr: 32808)]
10:     [loadI 32776 => r3 (32776)]
11:     [load r3 (addr: 32776) => r3 (0)] *9
12:     [ stall ]
13:     [ stall ] *11
14:     [store r3 (0) => r0 (addr: 2000)]
15:     [add r0 (2000), r2 (0) => r0 (2000)]
16:     [loadI 32780 => r3 (32780)] *14
17:     [load r3 (addr: 32780) => r3 (0)]
18:     [ stall ]
19:     [ stall ] *17
20:     [store r3 (0) => r0 (addr: 2000)]
21:     [add r0 (2000), r2 (0) => r0 (2000)]
22:     [loadI 32784 => r3 (32784)] *20
23:     [load r3 (addr: 32784) => r3 (0)]
24:     [ stall ]
25:     [ stall ] *23
26:     [store r3 (0) => r0 (addr: 2000)]
27:     [add r0 (2000), r2 (0) => r0 (2000)]
28:     [loadI 32788 => r3 (32788)] *26
29:     [load r3 (addr: 32788) => r3 (0)]
30:     [ stall ]
31:     [ stall ] *29
32:     [store r3 (0) => r0 (addr: 2000)]
33:     [add r0 (2000), r2 (0) => r0 (2000)]
34:     [loadI 32792 => r3 (32792)] *32
35:     [load r3 (addr: 32792) => r3 (0)]
36:     [ stall ]
37:     [ stall ] *35
38:     [store r3 (0) => r0 (addr: 2000)]
39:     [add r0 (2000), r2 (0) => r0 (2000)]
40:     [loadI 32796 => r3 (32796)] *38
41:     [load r3 (addr: 32796) => r3 (0)]
42:     [ stall ]
43:     [ stall ] *41
44:     [store r3 (0) => r0 (addr: 2000)]
45:     [add r0 (2000), r2 (0) => r0 (2000)]
46:     [loadI 32800 => r3 (32800)] *44
47:     [load r3 (addr: 32800) => r3 (0)]
48:     [ stall ]
49:     [ stall ] *47
50:     [store r3 (0) => r0 (addr: 2000)]
51:     [add r0 (2000), r2 (0) => r0 (2000)]
52:     [store r1 (4) => r0 (addr: 2000)] *50
53:     [add r0 (2000), r2 (0) => r0 (2000)]
54:     [loadI 32804 => r1 (32804)] *52
55:     [load r1 (addr: 32804) => r1 (0)]
56:     [ stall ]
57:     [ stall ] *55
58:     [store r1 (0) => r0 (addr: 2000)]
59:     [add r0 (2000), r2 (0) => r2 (2000)]
60:     [loadI 32808 => r0 (32808)] *58
61:     [load r0 (addr: 32808) => r0 (1)]
62:     [ stall ]
63:     [ stall ] *61
64:     [store r0 (1) => r2 (addr: 2000)]
65:     [ stall ]
66:     [ stall ] *64
67:     [output 2000 (1)]
output generates => 1
68:     [output 2004 (0)]
output generates => 0
69:     [output 2008 (0)]
output generates => 0
70:     [output 2012 (0)]
output generates => 0
71:     [output 2016 (0)]
output generates => 0
72:     [output 2020 (0)]
output generates => 0
73:     [output 2024 (0)]
output generates => 0
74:     [output 2028 (0)]
output generates => 0
75:     [output 2032 (0)]
output generates => 0
76:     [output 2036 (0)]
output generates => 0
77:     [output 2040 (0)]
output generates => 0

Executed 58 instructions and 58 operations in 78 cycles.