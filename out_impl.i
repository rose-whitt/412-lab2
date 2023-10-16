//in main
//done with lab 1 init
//Parse succeeded, finding 25 ILOC operations.
//done with lab 1 main
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        19       loadI      | 2000  None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 0               
//1        20       loadI      | 2000  None  None  inf   | None  None  None  inf   | 10    None  None  inf   | 1               
//2        21       load       | 0     None  None  inf   | None  None  None  inf   | 1     None  None  inf   | 2               
//3        22       load       | 10    None  None  inf   | None  None  None  inf   | 11    None  None  inf   | 3               
//4        25       loadI      | 2004  None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 4               
//5        26       loadI      | 2008  None  None  inf   | None  None  None  inf   | 12    None  None  inf   | 5               
//6        29       loadI      | 1     None  None  inf   | None  None  None  inf   | 21    None  None  inf   | 6               
//7        32       add        | 1     None  None  inf   | 1     None  None  inf   | 4     None  None  inf   | 7               
//8        33       add        | 11    None  None  inf   | 21    None  None  inf   | 14    None  None  inf   | 8               
//9        34       store      | 4     None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 9               
//10       35       store      | 14    None  None  inf   | None  None  None  inf   | 12    None  None  inf   | 10              
//11       38       add        | 1     None  None  inf   | 4     None  None  inf   | 5     None  None  inf   | 11              
//12       39       add        | 11    None  None  inf   | 14    None  None  inf   | 15    None  None  inf   | 12              
//13       40       store      | 5     None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 13              
//14       41       store      | 15    None  None  inf   | None  None  None  inf   | 12    None  None  inf   | 14              
//15       44       add        | 1     None  None  inf   | 5     None  None  inf   | 6     None  None  inf   | 15              
//16       45       add        | 14    None  None  inf   | 15    None  None  inf   | 16    None  None  inf   | 16              
//17       46       store      | 6     None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 17              
//18       47       store      | 16    None  None  inf   | None  None  None  inf   | 12    None  None  inf   | 18              
//19       50       add        | 1     None  None  inf   | 6     None  None  inf   | 7     None  None  inf   | 19              
//20       51       add        | 15    None  None  inf   | 16    None  None  inf   | 17    None  None  inf   | 20              
//21       52       store      | 7     None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 21              
//22       53       store      | 17    None  None  inf   | None  None  None  inf   | 12    None  None  inf   | 22              
//23       56       output     | 2004  None  None  inf   | None  None  None  inf   | None  None  None  inf   | 23              
//24       57       output     | 2008  None  None  inf   | None  None  None  inf   | None  None  None  inf   | 24              
//max reg num: 21
//num srs filled: 56
//done with lab 2 init
//in rename
//num srs filled: 56
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        19       loadI      | 2000  None  None  inf   | None  None  None  inf   | 0     14    None  2     | 0               
//1        20       loadI      | 2000  None  None  inf   | None  None  None  inf   | 10    13    None  3     | 1               
//2        21       load       | 0     14    None  inf   | None  None  None  inf   | 1     6     None  7     | 2               
//3        22       load       | 10    13    None  inf   | None  None  None  inf   | 11    10    None  8     | 3               
//4        25       loadI      | 2004  None  None  inf   | None  None  None  inf   | 2     3     None  9     | 4               
//5        26       loadI      | 2008  None  None  inf   | None  None  None  inf   | 12    1     None  10    | 5               
//6        29       loadI      | 1     None  None  inf   | None  None  None  inf   | 21    12    None  8     | 6               
//7        32       add        | 1     6     None  11    | 1     6     None  7     | 4     11    None  9     | 7               
//8        33       add        | 11    10    None  12    | 21    12    None  inf   | 14    8     None  10    | 8               
//9        34       store      | 4     11    None  11    | None  None  None  inf   | 2     3     None  13    | 9               
//10       35       store      | 14    8     None  12    | None  None  None  inf   | 12    1     None  14    | 10              
//11       38       add        | 1     6     None  15    | 4     11    None  inf   | 5     9     None  13    | 11              
//12       39       add        | 11    10    None  inf   | 14    8     None  16    | 15    4     None  14    | 12              
//13       40       store      | 5     9     None  15    | None  None  None  inf   | 2     3     None  17    | 13              
//14       41       store      | 15    4     None  16    | None  None  None  inf   | 12    1     None  18    | 14              
//15       44       add        | 1     6     None  19    | 5     9     None  inf   | 6     7     None  17    | 15              
//16       45       add        | 14    8     None  inf   | 15    4     None  20    | 16    5     None  18    | 16              
//17       46       store      | 6     7     None  19    | None  None  None  inf   | 2     3     None  21    | 17              
//18       47       store      | 16    5     None  20    | None  None  None  inf   | 12    1     None  22    | 18              
//19       50       add        | 1     6     None  inf   | 6     7     None  inf   | 7     2     None  21    | 19              
//20       51       add        | 15    4     None  inf   | 16    5     None  inf   | 17    0     None  22    | 20              
//21       52       store      | 7     2     None  inf   | None  None  None  inf   | 2     3     None  inf   | 21              
//22       53       store      | 17    0     None  inf   | None  None  None  inf   | 12    1     None  inf   | 22              
//23       56       output     | 2004  None  None  inf   | None  None  None  inf   | None  None  None  inf   | 23              
//24       57       output     | 2008  None  None  inf   | None  None  None  inf   | None  None  None  inf   | 24              
//renaming done
//START OF DIF_ALLOC
//MAX VR NUM: 14
//k: 7
// LEN OF PRSTACK: 7
// PRSTACK: [6, 5, 4, 3, 2, 1, 0]
// MAX LIVE: 6
// SPILL_k: -1
// k after: 7
//allocate use
//free use
//allocate use
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
//allocate use
//free use
//free use
//allocate use
//allocate use
//free use
//free use
//allocating done
// MaxLive is 6
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
