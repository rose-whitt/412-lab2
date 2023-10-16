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
//allocating done
// MaxLive is 4
//HERE
loadI 128 => r1
load r1 => r2
loadI 132 => r7
load r7 => r4
loadI 136 => r6
load r6 => r5
mult r4,r5 => r3
add r2,r3 => r0
store r0 => r1