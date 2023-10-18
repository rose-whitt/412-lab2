loadI   1024  =>   r0
loadI   128  =>   r1
loadI   32  =>   r2
loadI   1028  =>   r3
loadI   32768  =>   r4
store   r0  =>   r4
mult    r2, r2  =>   r0
rshift  r2, r0  =>   r0
loadI   32772  =>   r4
store   r1  =>   r4
lshift  r2, r0  =>   r1
add     r1, r0  =>   r0
sub     r2, r0  =>   r0
store   r0  =>   r3
load    r3  =>   r3
loadI   32772  =>   r0
load    r0  =>   r0
add     r3, r0  =>   r0
loadI   32768  =>   r3
load    r3  =>   r3
store   r0  =>   r3
output  1024

// after rename:
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        16       loadI      | 1024  -1    -1    inf   | -1    -1    -1    inf   | 0     1     -1    12    | 0               
//1        17       loadI      | 128   -1    -1    inf   | -1    -1    -1    inf   | 1     3     -1    11    | 1               
//2        18       loadI      | 32    -1    -1    inf   | -1    -1    -1    inf   | 2     6     -1    4     | 2               
//3        19       loadI      | 1028  -1    -1    inf   | -1    -1    -1    inf   | 3     4     -1    9     | 3               
//4        20       mult       | 2     6     -1    5     | 2     6     -1    4     | 4     10    -1    5     | 4               
//5        21       rshift     | 2     6     -1    6     | 4     10    -1    inf   | 4     9     -1    6     | 5               
//6        22       lshift     | 2     6     -1    8     | 4     9     -1    7     | 5     8     -1    7     | 6               
//7        23       add        | 5     8     -1    inf   | 4     9     -1    inf   | 5     7     -1    8     | 7               
//8        24       sub        | 2     6     -1    inf   | 5     7     -1    inf   | 6     5     -1    9     | 8               
//9        25       store      | 6     5     -1    inf   | -1    -1    -1    inf   | 3     4     -1    10    | 9               
//10       26       load       | 3     4     -1    inf   | -1    -1    -1    inf   | 6     2     -1    11    | 10              
//11       27       add        | 6     2     -1    inf   | 1     3     -1    inf   | 7     0     -1    12    | 11              
//12       29       store      | 7     0     -1    inf   | -1    -1    -1    inf   | 0     1     -1    inf   | 12              
//13       30       output     | 1024  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 13


// after alloc:
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        16       loadI      | 1024  -1    -1    inf   | -1    -1    -1    inf   | 0     1     0     12    | 0               
//1        17       loadI      | 128   -1    -1    inf   | -1    -1    -1    inf   | 1     3     1     11    | 1               
//2        18       loadI      | 32    -1    -1    inf   | -1    -1    -1    inf   | 2     6     2     4     | 2               
//3        19       loadI      | 1028  -1    -1    inf   | -1    -1    -1    inf   | 3     4     3     9     | 3               
//4        20       loadI      | 32768 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 4               
//5        21       store      | -1    1     0     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 5               
//6        22       mult       | 2     6     2     5     | 2     6     2     4     | 4     10    0     5     | 6               
//7        23       rshift     | 2     6     2     6     | 4     10    0     inf   | 4     9     0     6     | 7               
//8        24       loadI      | 32772 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 8               
//9        25       store      | -1    3     1     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 9               
//10       26       lshift     | 2     6     2     8     | 4     9     0     7     | 5     8     1     7     | 10              
//11       27       add        | 5     8     1     inf   | 4     9     0     inf   | 5     7     0     8     | 11              
//12       28       sub        | 2     6     2     inf   | 5     7     0     inf   | 6     5     0     9     | 12              
//13       29       store      | 6     5     0     inf   | -1    -1    -1    inf   | 3     4     3     10    | 13              
//14       30       load       | 3     4     3     inf   | -1    -1    -1    inf   | 6     2     3     11    | 14              
//15       31       loadI      | 32772 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    0     inf   | 15              
//16       32       load       | -1    -1    0     inf   | -1    -1    -1    inf   | -1    3     0     inf   | 16              
//17       33       add        | 6     2     3     inf   | 1     3     0     inf   | 7     0     0     12    | 17              
//18       35       loadI      | 32768 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    3     inf   | 18              
//19       36       load       | -1    -1    3     inf   | -1    -1    -1    inf   | -1    1     3     inf   | 19              
//20       37       store      | 7     0     0     inf   | -1    -1    -1    inf   | 0     1     3     inf   | 20              
//21       38       output     | 1024  -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 21