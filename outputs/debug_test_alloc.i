//in main
//done with lab 1 init
//Parse succeeded, finding 9 ILOC operations.
//done with lab 1 main
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        1        loadI      | 128   None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 0               
//1        2        load       | 0     None  None  inf   | None  None  None  inf   | 1     None  None  inf   | 1               
//2        3        loadI      | 132   None  None  inf   | None  None  None  inf   | 2     None  None  inf   | 2               
//3        4        load       | 2     None  None  inf   | None  None  None  inf   | 3     None  None  inf   | 3               
//4        5        loadI      | 136   None  None  inf   | None  None  None  inf   | 4     None  None  inf   | 4               
//5        6        load       | 4     None  None  inf   | None  None  None  inf   | 5     None  None  inf   | 5               
//6        7        mult       | 3     None  None  inf   | 5     None  None  inf   | 3     None  None  inf   | 6               
//7        8        add        | 1     None  None  inf   | 3     None  None  inf   | 1     None  None  inf   | 7               
//8        9        store      | 1     None  None  inf   | None  None  None  inf   | 0     None  None  inf   | 8               
//max reg num: 5
//num srs filled: 20
//done with lab 2 init
//in rename
//num srs filled: 20
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        1        loadI      | 128   None  None  inf   | None  None  None  inf   | 0     1     None  1     | 0               
//1        2        load       | 0     1     None  8     | None  None  None  inf   | 1     2     None  7     | 1               
//2        3        loadI      | 132   None  None  inf   | None  None  None  inf   | 2     7     None  3     | 2               
//3        4        load       | 2     7     None  inf   | None  None  None  inf   | 3     4     None  6     | 3               
//4        5        loadI      | 136   None  None  inf   | None  None  None  inf   | 4     6     None  5     | 4               
//5        6        load       | 4     6     None  inf   | None  None  None  inf   | 5     5     None  6     | 5               
//6        7        mult       | 3     4     None  inf   | 5     5     None  inf   | 3     3     None  7     | 6               
//7        8        add        | 1     2     None  inf   | 3     3     None  inf   | 1     0     None  8     | 7               
//8        9        store      | 1     0     None  inf   | None  None  None  inf   | 0     1     None  inf   | 8               
//renaming done
//START OF DIF_ALLOC
//MAX VR NUM: 7
//k: 64
// LEN OF PRSTACK: 64
// PRSTACK: [63, 62, 61, 60, 59, 58, 57, 56, 55, 54, 53, 52, 51, 50, 49, 48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
// MAX LIVE: 4
// SPILL_k: -1
// k after: 64
//allocate use
//free use
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
//allocating done
// MaxLive is 4
loadI   128  =>   r0
load    r0  =>   r1
loadI   132  =>   r2
load    r2  =>   r2
loadI   136  =>   r3
load    r3  =>   r3
mult    r2, r3  =>   r3
add     r1, r3  =>   r3
store   r3  =>   r0