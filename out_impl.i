//Parse succeeded, finding 25 ILOC operations.
19 : loadI : [ val 2000 ] , [  ], [ sr0 ]

loadI 2000 => r14
20 : loadI : [ val 2000 ] , [  ], [ sr10 ]

loadI 2000 => r13
21 : load : [ sr0 ] , [  ], [ sr1 ]

load r14 => r6
22 : load : [ sr10 ] , [  ], [ sr11 ]

load r13 => r10
25 : loadI : [ val 2004 ] , [  ], [ sr2 ]

loadI 2004 => r3
26 : loadI : [ val 2008 ] , [  ], [ sr12 ]

loadI 2008 => r1
29 : loadI : [ val 1 ] , [  ], [ sr21 ]

loadI 1 => r12
32 : add : [ sr1 ] , [ sr1 ], [ sr4 ]

add r6,r6 => r11
33 : add : [ sr11 ] , [ sr21 ], [ sr14 ]

add r10,r12 => r8
34 : store : [ sr4 ] , [  ], [ sr2 ]

store r11 => r3
35 : store : [ sr14 ] , [  ], [ sr12 ]

store r8 => r1
38 : add : [ sr1 ] , [ sr4 ], [ sr5 ]

add r6,r11 => r9
39 : add : [ sr11 ] , [ sr14 ], [ sr15 ]

add r10,r8 => r4
40 : store : [ sr5 ] , [  ], [ sr2 ]

store r9 => r3
41 : store : [ sr15 ] , [  ], [ sr12 ]

store r4 => r1
44 : add : [ sr1 ] , [ sr5 ], [ sr6 ]

add r6,r9 => r7
45 : add : [ sr14 ] , [ sr15 ], [ sr16 ]

add r8,r4 => r5
46 : store : [ sr6 ] , [  ], [ sr2 ]

store r7 => r3
47 : store : [ sr16 ] , [  ], [ sr12 ]

store r5 => r1
50 : add : [ sr1 ] , [ sr6 ], [ sr7 ]

add r6,r7 => r2
51 : add : [ sr15 ] , [ sr16 ], [ sr17 ]

add r4,r5 => r0
52 : store : [ sr7 ] , [  ], [ sr2 ]

store r2 => r3
53 : store : [ sr17 ] , [  ], [ sr12 ]

store r0 => r1
56 : output : [ val 2004 ] , [  ], [  ]

output 2004 
57 : output : [ val 2008 ] , [  ], [  ]

output 2008 
loadI   2000  =>   r0
loadI   2000  =>   r1
load    r0  =>   r0
load    r1  =>   r1
loadI   2004  =>   r2
loadI   2008  =>   r3
loadI   1  =>   r4
add     r0, r0  =>   r5
add     r1, r4  =>   r4
store   r5  =>   r2
store   r4  =>   r3
add     r0, r5  =>   r5
add     r1, r4  =>   r1
store   r5  =>   r2
store   r1  =>   r3
add     r0, r5  =>   r5
add     r4, r1  =>   r4
store   r5  =>   r2
store   r4  =>   r3
add     r0, r5  =>   r5
add     r1, r4  =>   r4
store   r5  =>   r2
store   r4  =>   r3
output  2004
output  2008
