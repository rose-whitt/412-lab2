//in main
//done with lab 1 init
//Parse succeeded, finding 25 ILOC operations.
//done with lab 1 main
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        19       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 0     -1    -1    inf   | 0               
//1        20       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 10    -1    -1    inf   | 1               
//2        21       load       | 0     -1    -1    inf   | -1    -1    -1    inf   | 1     -1    -1    inf   | 2               
//3        22       load       | 10    -1    -1    inf   | -1    -1    -1    inf   | 11    -1    -1    inf   | 3               
//4        25       loadI      | 2004  -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 4               
//5        26       loadI      | 2008  -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 5               
//6        29       loadI      | 1     -1    -1    inf   | -1    -1    -1    inf   | 21    -1    -1    inf   | 6               
//7        32       add        | 1     -1    -1    inf   | 1     -1    -1    inf   | 4     -1    -1    inf   | 7               
//8        33       add        | 11    -1    -1    inf   | 21    -1    -1    inf   | 14    -1    -1    inf   | 8               
//9        34       store      | 4     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 9               
//10       35       store      | 14    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 10              
//11       38       add        | 1     -1    -1    inf   | 4     -1    -1    inf   | 5     -1    -1    inf   | 11              
//12       39       add        | 11    -1    -1    inf   | 14    -1    -1    inf   | 15    -1    -1    inf   | 12              
//13       40       store      | 5     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 13              
//14       41       store      | 15    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 14              
//15       44       add        | 1     -1    -1    inf   | 5     -1    -1    inf   | 6     -1    -1    inf   | 15              
//16       45       add        | 14    -1    -1    inf   | 15    -1    -1    inf   | 16    -1    -1    inf   | 16              
//17       46       store      | 6     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 17              
//18       47       store      | 16    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 18              
//19       50       add        | 1     -1    -1    inf   | 6     -1    -1    inf   | 7     -1    -1    inf   | 19              
//20       51       add        | 15    -1    -1    inf   | 16    -1    -1    inf   | 17    -1    -1    inf   | 20              
//21       52       store      | 7     -1    -1    inf   | -1    -1    -1    inf   | 2     -1    -1    inf   | 21              
//22       53       store      | 17    -1    -1    inf   | -1    -1    -1    inf   | 12    -1    -1    inf   | 22              
//23       56       output     | 2004  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 23              
//24       57       output     | 2008  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 24              
//max reg num: 21
//num srs filled: 56
//done with lab 2 init
//in rename
//num srs filled: 56
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        19       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 0     14    -1    2     | 0               
//1        20       loadI      | 2000  -1    -1    inf   | -1    -1    -1    inf   | 10    13    -1    3     | 1               
//2        21       load       | 0     14    -1    inf   | -1    -1    -1    inf   | 1     6     -1    7     | 2               
//3        22       load       | 10    13    -1    inf   | -1    -1    -1    inf   | 11    10    -1    8     | 3               
//4        25       loadI      | 2004  -1    -1    inf   | -1    -1    -1    inf   | 2     3     -1    9     | 4               
//5        26       loadI      | 2008  -1    -1    inf   | -1    -1    -1    inf   | 12    1     -1    10    | 5               
//6        29       loadI      | 1     -1    -1    inf   | -1    -1    -1    inf   | 21    12    -1    8     | 6               
//7        32       add        | 1     6     -1    11    | 1     6     -1    7     | 4     11    -1    9     | 7               
//8        33       add        | 11    10    -1    12    | 21    12    -1    inf   | 14    8     -1    10    | 8               
//9        34       store      | 4     11    -1    11    | -1    -1    -1    inf   | 2     3     -1    13    | 9               
//10       35       store      | 14    8     -1    12    | -1    -1    -1    inf   | 12    1     -1    14    | 10              
//11       38       add        | 1     6     -1    15    | 4     11    -1    inf   | 5     9     -1    13    | 11              
//12       39       add        | 11    10    -1    inf   | 14    8     -1    16    | 15    4     -1    14    | 12              
//13       40       store      | 5     9     -1    15    | -1    -1    -1    inf   | 2     3     -1    17    | 13              
//14       41       store      | 15    4     -1    16    | -1    -1    -1    inf   | 12    1     -1    18    | 14              
//15       44       add        | 1     6     -1    19    | 5     9     -1    inf   | 6     7     -1    17    | 15              
//16       45       add        | 14    8     -1    inf   | 15    4     -1    20    | 16    5     -1    18    | 16              
//17       46       store      | 6     7     -1    19    | -1    -1    -1    inf   | 2     3     -1    21    | 17              
//18       47       store      | 16    5     -1    20    | -1    -1    -1    inf   | 12    1     -1    22    | 18              
//19       50       add        | 1     6     -1    inf   | 6     7     -1    inf   | 7     2     -1    21    | 19              
//20       51       add        | 15    4     -1    inf   | 16    5     -1    inf   | 17    0     -1    22    | 20              
//21       52       store      | 7     2     -1    inf   | -1    -1    -1    inf   | 2     3     -1    inf   | 21              
//22       53       store      | 17    0     -1    inf   | -1    -1    -1    inf   | 12    1     -1    inf   | 22              
//23       56       output     | 2004  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 23              
//24       57       output     | 2008  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 24              
//renaming done
//START OF DIF_ALLOC
//MAX VR NUM: 14
//k: 7
// LEN OF PRSTACK: 6
// PRSTACK: [5, 4, 3, 2, 1, 0]
// MAX LIVE: 6
// RESERVED REG: 6
// k after: 7
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
