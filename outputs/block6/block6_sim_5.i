ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 4 => r0 (4)]
2:      [loadI 1024 => r1 (1024)]
3:      [load r1 (addr: 1024) => r1 (0)]
4:      [loadI 1028 => r2 (1028)]
5:      [load r2 (addr: 1028) => r2 (1)] *3
6:      [loadI 2000 => r3 (2000)]
7:      [store r1 (0) => r3 (addr: 2000)] *5
8:      [add r1 (0), r2 (1) => r1 (1)]
9:      [add r3 (2000), r0 (4) => r3 (2004)] *7
10:     [store r2 (1) => r3 (addr: 2004)]
11:     [add r1 (1), r2 (1) => r2 (2)]
12:     [add r3 (2004), r0 (4) => r3 (2008)] *10
13:     [store r1 (1) => r3 (addr: 2008)]
14:     [add r2 (2), r1 (1) => r1 (3)]
15:     [add r3 (2008), r0 (4) => r3 (2012)] *13
16:     [store r2 (2) => r3 (addr: 2012)]
17:     [add r1 (3), r2 (2) => r2 (5)]
18:     [add r3 (2012), r0 (4) => r3 (2016)] *16
19:     [store r1 (3) => r3 (addr: 2016)]
20:     [add r2 (5), r1 (3) => r1 (8)]
21:     [add r3 (2016), r0 (4) => r3 (2020)] *19
22:     [store r2 (5) => r3 (addr: 2020)]
23:     [add r1 (8), r2 (5) => r2 (13)]
24:     [add r3 (2020), r0 (4) => r3 (2024)] *22
25:     [store r1 (8) => r3 (addr: 2024)]
26:     [add r2 (13), r1 (8) => r1 (21)]
27:     [add r3 (2024), r0 (4) => r3 (2028)] *25
28:     [store r2 (13) => r3 (addr: 2028)]
29:     [add r1 (21), r2 (13) => r2 (34)]
30:     [add r3 (2028), r0 (4) => r3 (2032)] *28
31:     [store r1 (21) => r3 (addr: 2032)]
32:     [add r2 (34), r1 (21) => r1 (55)]
33:     [add r3 (2032), r0 (4) => r3 (2036)] *31
34:     [store r2 (34) => r3 (addr: 2036)]
35:     [add r1 (55), r2 (34) => r2 (89)]
36:     [add r3 (2036), r0 (4) => r3 (2040)] *34
37:     [store r1 (55) => r3 (addr: 2040)]
38:     [add r3 (2040), r0 (4) => r0 (2044)]
39:     [store r2 (89) => r0 (addr: 2044)] *37
40:     [output 2000 (0)]
output generates => 0
41:     [output 2004 (1)] *39
output generates => 1
42:     [output 2008 (1)]
output generates => 1
43:     [output 2012 (2)]
output generates => 2
44:     [output 2016 (3)]
output generates => 3
45:     [output 2020 (5)]
output generates => 5
46:     [output 2024 (8)]
output generates => 8
47:     [output 2028 (13)]
output generates => 13
48:     [output 2032 (21)]
output generates => 21
49:     [output 2036 (34)]
output generates => 34
50:     [output 2040 (55)]
output generates => 55
51:     [output 2044 (89)]
output generates => 89

Executed 52 instructions and 52 operations in 52 cycles.