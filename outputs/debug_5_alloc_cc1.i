//in main
//done with lab 1 init
//Parse succeeded, finding 15 ILOC operations.
//done with lab 1 main
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        16       loadI      | 1024  None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 0               
//1        17       loadI      | 128   None  None  inf   | None  None  None  inf   | 1     None  None  inf   | 1               
//2        18       loadI      | 32    None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 2               
//3        19       loadI      | 1028  None  None  inf   | None  None  None  inf   | 3     None  None  inf   | 3               
//4        20       mult       | 2     None  None  inf   | 2     None  None  inf   | 4     None  None  inf   | 4               
//5        21       rshift     | 2     None  None  inf   | 4     None  None  inf   | 4     None  None  inf   | 5               
//6        22       lshift     | 2     None  None  inf   | 4     None  None  inf   | 5     None  None  inf   | 6               
//7        23       add        | 5     None  None  inf   | 4     None  None  inf   | 5     None  None  inf   | 7               
//8        24       sub        | 2     None  None  inf   | 5     None  None  inf   | 6     None  None  inf   | 8               
//9        25       store      | 6     None  None  inf   | None  None  None  inf   | 3     None  None  inf   | 9               
//10       26       load       | 3     None  None  inf   | None  None  None  inf   | 6     None  None  inf   | 10              
//11       27       add        | 6     None  None  inf   | 1     None  None  inf   | 7     None  None  inf   | 11              
//12       29       store      | 7     None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 12              
//13       30       output     | 1024  None  None  inf   | None  None  None  inf   | None  None  None  inf   | 13              
//max reg num: 7
//num srs filled: 33
//done with lab 2 init
//in rename
//num srs filled: 33
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        16       loadI      | 1024  None  None  inf   | None  None  None  inf   | 0     1     None  12    | 0               
//1        17       loadI      | 128   None  None  inf   | None  None  None  inf   | 1     3     None  11    | 1               
//2        18       loadI      | 32    None  None  inf   | None  None  None  inf   | 2     6     None  4     | 2               
//3        19       loadI      | 1028  None  None  inf   | None  None  None  inf   | 3     4     None  9     | 3               
//4        20       mult       | 2     6     None  5     | 2     6     None  4     | 4     10    None  5     | 4               
//5        21       rshift     | 2     6     None  6     | 4     10    None  inf   | 4     9     None  6     | 5               
//6        22       lshift     | 2     6     None  8     | 4     9     None  7     | 5     8     None  7     | 6               
//7        23       add        | 5     8     None  inf   | 4     9     None  inf   | 5     7     None  8     | 7               
//8        24       sub        | 2     6     None  inf   | 5     7     None  inf   | 6     5     None  9     | 8               
//9        25       store      | 6     5     None  inf   | None  None  None  inf   | 3     4     None  10    | 9               
//10       26       load       | 3     4     None  inf   | None  None  None  inf   | 6     2     None  11    | 10              
//11       27       add        | 6     2     None  inf   | 1     3     None  inf   | 7     0     None  12    | 11              
//12       29       store      | 7     0     None  inf   | None  None  None  inf   | 0     1     None  inf   | 12              
//13       30       output     | 1024  None  None  inf   | None  None  None  inf   | None  None  None  inf   | 13              
//renaming done
//START OF DIF_ALLOC
//MAX VR NUM: 10
//k: 5
// LEN OF PRSTACK: 5
// PRSTACK: [4, 3, 2, 1, 0]
// MAX LIVE: 6
// SPILL_k: 4
// k after: 4
//allocate use
//allocate use
//free use
//free use
//allocate use
//allocate use
//free use
//free use
//allocate use
//allocate use
//free use
//free use
//handle spill
//[SPILL]IR LEN BEFORE: 14
//[SPILL]loadi node:
// None : loadI : [ val 32768 ] , [  ], [ srNone ]
//[SPILL]IR LEN AFTER: 15
//[SPILL]IR LEN BEFORE: 15
//[SPILL]store node:
//None : store : [ srNone ] , [  ], [ srNone ]
//[SPILL]IR LEN AFTER: 16
//allocate use
//allocate use
//free use
//free use
//allocate use
//allocate use
//free use
//free use
//allocate use
//allocate use
//free use
//free use
//allocate use
//free use
//allocate use
//allocate use
//free use
//free use
//allocate use
//allocate use
//handle restore
//[RESTORE]IR LEN BEFORE: 16
//[RESTORE]loadi node:
//[RESTORE]IR LEN AFTER: 17
//[RESTORE]IR LEN BEFORE: 17
//[REST0RE]loadnode:
//None : load : [ srNone ] , [  ], [ srNone ]
//[RESTORE]IR LEN AFTER: 18
//free use
//free use
//allocating done
// MaxLive is 6
loadI   1024  =>   r0
loadI   128  =>   r1
loadI   32  =>   r2
loadI   1028  =>   r3
mult    r2, r2  =>   r4 // should be adding a loadI and store before this
rshift  r2, r4  =>   r4
loadI   32768  =>   r4  // 🌈t his should be after line 105 (loadI   1028  =>   r3) and should be 65536 not 32768, which is half
store   r0  =>   r4 // 🌈 this should be after loadI after line 105
lshift  r2, r4  =>   r0 // should be a loadI and store before this
add     r0, r4  =>   r4
sub     r2, r4  =>   r4
store   r4  =>   r3
load    r3  =>   r3 // should be a load and loadi after this
add     r3, r1  =>   r1
loadI   32768  =>   r3  // 🌈 right place wrong num
load    r3  =>   r3  // 🌈  rightplace
store   r1  =>   r3  // 🌈 right place wrong store reg
output  1024