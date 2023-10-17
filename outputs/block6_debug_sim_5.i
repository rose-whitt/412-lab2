ILOC Simulator, Version 412-2015-2
Interlock settings: memory registers branches 

0:      [loadI 0 => r0 (0)]
1:      [loadI 4 => r1 (4)]
2:      [loadI 1024 => r2 (1024)]
3:      [load r2 (addr: 1024) => r2 (0)]
4:      [loadI 1028 => r3 (1028)]
5:      [load r3 (addr: 1028) => r3 (1)] *3
6:      [loadI 32768 => r4 (32768)]
7:      [store r0 (0) => r4 (addr: 32768)] *5
8:      [loadI 2000 => r0 (2000)]
9:      [store r2 (0) => r0 (addr: 2000)] *7
10:     [add r2 (0), r3 (1) => r2 (1)]
11:     [add r0 (2000), r1 (4) => r0 (2004)] *9
12:     [store r3 (1) => r0 (addr: 2004)]
13:     [add r2 (1), r3 (1) => r3 (2)]
14:     [add r0 (2004), r1 (4) => r0 (2008)] *12
15:     [store r2 (1) => r0 (addr: 2008)]
16:     [add r3 (2), r2 (1) => r2 (3)]
17:     [add r0 (2008), r1 (4) => r0 (2012)] *15
18:     [store r3 (2) => r0 (addr: 2012)]
19:     [add r2 (3), r3 (2) => r3 (5)]
20:     [add r0 (2012), r1 (4) => r0 (2016)] *18
21:     [store r2 (3) => r0 (addr: 2016)]
22:     [add r3 (5), r2 (3) => r2 (8)]
23:     [add r0 (2016), r1 (4) => r0 (2020)] *21
24:     [store r3 (5) => r0 (addr: 2020)]
25:     [add r2 (8), r3 (5) => r3 (13)]
26:     [add r0 (2020), r1 (4) => r0 (2024)] *24
27:     [store r2 (8) => r0 (addr: 2024)]
28:     [add r3 (13), r2 (8) => r2 (21)]
29:     [add r0 (2024), r1 (4) => r0 (2028)] *27
30:     [store r3 (13) => r0 (addr: 2028)]
31:     [add r2 (21), r3 (13) => r3 (34)]
32:     [add r0 (2028), r1 (4) => r0 (2032)] *30
33:     [store r2 (21) => r0 (addr: 2032)]
34:     [add r3 (34), r2 (21) => r2 (55)]
35:     [add r0 (2032), r1 (4) => r0 (2036)] *33
36:     [store r3 (34) => r0 (addr: 2036)]
37:     [add r2 (55), r3 (34) => r3 (89)]
38:     [add r0 (2036), r1 (4) => r0 (2040)] *36
39:     [store r2 (55) => r0 (addr: 2040)]
40:     [add r0 (2040), r1 (4) => r1 (2044)]
41:     [store r3 (89) => r1 (addr: 2044)] *39
42:     [output 2000 (0)]
output generates => 0
43:     [output 2004 (1)] *41
output generates => 1
44:     [output 2008 (1)]
output generates => 1
45:     [output 2012 (2)]
output generates => 2
46:     [output 2016 (3)]
output generates => 3
47:     [output 2020 (5)]
output generates => 5
48:     [output 2024 (8)]
output generates => 8
49:     [output 2028 (13)]
output generates => 13
50:     [output 2032 (21)]
output generates => 21
51:     [output 2036 (34)]
output generates => 34
52:     [output 2040 (55)]
output generates => 55
53:     [output 2044 (89)]
output generates => 89

Executed 54 instructions and 54 operations in 54 cycles.