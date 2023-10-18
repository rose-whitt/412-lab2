loadI   0  =>   r0
loadI   4  =>   r1
load    r0  =>   r2
add     r0, r1  =>   r0
load    r0  =>   r3
add     r0, r1  =>   r0
loadI   32768  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r0
loadI   32772  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r0
loadI   32776  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r0
loadI   32780  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r0
loadI   32784  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r0
loadI   32788  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r0
loadI   32792  =>   r4
store   r2  =>   r4
load    r0  =>   r2
add     r0, r1  =>   r1
load    r1  =>   r1
loadI   32768  =>   r0
load    r0  =>   r0
add     r0, r3  =>   r3
loadI   32772  =>   r0
load    r0  =>   r0
loadI   32796  =>   r4
store   r3  =>   r4
loadI   32776  =>   r3
load    r3  =>   r3
add     r0, r3  =>   r3
loadI   32780  =>   r0
load    r0  =>   r0
loadI   32800  =>   r4
store   r3  =>   r4
loadI   32784  =>   r3
load    r3  =>   r3
add     r0, r3  =>   r3
loadI   32788  =>   r0
load    r0  =>   r0
loadI   32804  =>   r4
store   r3  =>   r4
loadI   32792  =>   r3
load    r3  =>   r3
add     r0, r3  =>   r3
add     r2, r1  =>   r1
loadI   32796  =>   r2
load    r2  =>   r2
loadI   32800  =>   r0
load    r0  =>   r0
add     r2, r0  =>   r0
loadI   32804  =>   r2
load    r2  =>   r2
add     r2, r3  =>   r3
add     r0, r1  =>   r1
add     r1, r3  =>   r3
loadI   0  =>   r1
store   r3  =>   r1
output  0

// IS REMATERIALIZABLE:
//79       loadI      | 0     -1    -1    inf   | -1    -1    -1    inf   | 0     1     1     31   
//7        loadI      | 4     -1    -1    inf   | -1    -1    -1    inf   | 1     22    1     3    
//6        loadI      | 0     -1    -1    inf   | -1    -1    -1    inf   | 0     30    0     2    

// FIRST USE:
//8        load       | 0     30    0     3     | -1    -1    -1    inf   | 10    18    2     21   
//9        add        | 0     30    0     inf   | 1     22    1     5     | 0     29    0     4    // adds this one twice (below) bc i dont break out of rematerializable loop when found and this add contains two of the remat values
//9        add        | 0     30    0     inf   | 1     22    1     5     | 0     29    0     4    // ^
//11       add        | 0     29    0     inf   | 1     22    1     7     | 0     28    0     6    // shouldnt be here bc the remat VR is defined before (aka on the right side) as well as other reg
//15       add        | 0     28    0     inf   | 1     22    1     9     | 0     27    0     8    // shouldnt be here bc the remat VR is defined before (aka on the right side) as well as other reg
//19       add        | 0     27    0     inf   | 1     22    1     11    | 0     26    0     10   
//23       add        | 0     26    0     inf   | 1     22    1     13    | 0     25    0     12   
//27       add        | 0     25    0     inf   | 1     22    1     15    | 0     24    0     14   
//31       add        | 0     24    0     inf   | 1     22    1     17    | 0     23    0     16   
//35       add        | 0     23    0     inf   | 1     22    1     19    | 0     21    0     18   
//39       add        | 0     21    0     inf   | 1     22    1     inf   | 0     20    1     20   
//80       store      | 20    0     3     inf   | -1    -1    -1    inf   | 0     1     1     inf

// after rename:
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        6        loadI      | 0     -1    -1    inf   | -1    -1    -1    inf   | 0     30    -1    2     | 0               
//1        7        loadI      | 4     -1    -1    inf   | -1    -1    -1    inf   | 1     22    -1    3     | 1               
//2        8        load       | 0     30    -1    3     | -1    -1    -1    inf   | 10    18    -1    21    | 2               
//3        9        add        | 0     30    -1    inf   | 1     22    -1    5     | 0     29    -1    4     | 3               
//4        10       load       | 0     29    -1    5     | -1    -1    -1    inf   | 11    19    -1    21    | 4               
//5        11       add        | 0     29    -1    inf   | 1     22    -1    7     | 0     28    -1    6     | 5               
//6        12       load       | 0     28    -1    7     | -1    -1    -1    inf   | 12    16    -1    22    | 6               
//7        13       add        | 0     28    -1    inf   | 1     22    -1    9     | 0     27    -1    8     | 7               
//8        14       load       | 0     27    -1    9     | -1    -1    -1    inf   | 13    17    -1    22    | 8               
//9        15       add        | 0     27    -1    inf   | 1     22    -1    11    | 0     26    -1    10    | 9               
//10       16       load       | 0     26    -1    11    | -1    -1    -1    inf   | 14    14    -1    23    | 10              
//11       17       add        | 0     26    -1    inf   | 1     22    -1    13    | 0     25    -1    12    | 11              
//12       18       load       | 0     25    -1    13    | -1    -1    -1    inf   | 15    15    -1    23    | 12              
//13       19       add        | 0     25    -1    inf   | 1     22    -1    15    | 0     24    -1    14    | 13              
//14       20       load       | 0     24    -1    15    | -1    -1    -1    inf   | 16    12    -1    24    | 14              
//15       21       add        | 0     24    -1    inf   | 1     22    -1    17    | 0     23    -1    16    | 15              
//16       22       load       | 0     23    -1    17    | -1    -1    -1    inf   | 17    13    -1    24    | 16              
//17       23       add        | 0     23    -1    inf   | 1     22    -1    19    | 0     21    -1    18    | 17              
//18       24       load       | 0     21    -1    19    | -1    -1    -1    inf   | 18    10    -1    25    | 18              
//19       25       add        | 0     21    -1    inf   | 1     22    -1    inf   | 0     20    -1    20    | 19              
//20       26       load       | 0     20    -1    inf   | -1    -1    -1    inf   | 19    11    -1    25    | 20              
//21       28       add        | 10    18    -1    inf   | 11    19    -1    inf   | 20    8     -1    26    | 21              
//22       29       add        | 12    16    -1    inf   | 13    17    -1    inf   | 21    9     -1    26    | 22              
//23       30       add        | 14    14    -1    inf   | 15    15    -1    inf   | 22    6     -1    27    | 23              
//24       31       add        | 16    12    -1    inf   | 17    13    -1    inf   | 23    7     -1    27    | 24              
//25       32       add        | 18    10    -1    inf   | 19    11    -1    inf   | 24    5     -1    28    | 25              
//26       34       add        | 20    8     -1    inf   | 21    9     -1    inf   | 20    4     -1    28    | 26              
//27       35       add        | 22    6     -1    inf   | 23    7     -1    inf   | 21    3     -1    29    | 27              
//28       36       add        | 20    4     -1    inf   | 24    5     -1    inf   | 20    2     -1    29    | 28              
//29       37       add        | 20    2     -1    inf   | 21    3     -1    inf   | 20    0     -1    31    | 29              
//30       39       loadI      | 0     -1    -1    inf   | -1    -1    -1    inf   | 0     1     -1    31    | 30              
//31       40       store      | 20    0     -1    inf   | -1    -1    -1    inf   | 0     1     -1    inf   | 31              
//32       41       output     | 0     -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 32



// after alloc:
//index    line     OPCODE     | SR    VR    PR    NU    | SR    VR    PR    NU    | SR    VR    PR    NU    | NEXT OP         
//0        6        loadI      | 0     -1    -1    inf   | -1    -1    -1    inf   | 0     30    0     2     | 0               
//1        7        loadI      | 4     -1    -1    inf   | -1    -1    -1    inf   | 1     22    1     3     | 1               
//2        8        load       | 0     30    0     3     | -1    -1    -1    inf   | 10    18    2     21    | 2               
//3        9        add        | 0     30    0     inf   | 1     22    1     5     | 0     29    0     4     | 3               
//4        10       load       | 0     29    0     5     | -1    -1    -1    inf   | 11    19    3     21    | 4               
//5        11       add        | 0     29    0     inf   | 1     22    1     7     | 0     28    0     6     | 5               
//6        12       loadI      | 32768 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 6               
//7        13       store      | -1    18    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 7               
//8        14       load       | 0     28    0     7     | -1    -1    -1    inf   | 12    16    2     22    | 8               
//9        15       add        | 0     28    0     inf   | 1     22    1     9     | 0     27    0     8     | 9               
//10       16       loadI      | 32772 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 10              
//11       17       store      | -1    16    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 11              
//12       18       load       | 0     27    0     9     | -1    -1    -1    inf   | 13    17    2     22    | 12              
//13       19       add        | 0     27    0     inf   | 1     22    1     11    | 0     26    0     10    | 13              
//14       20       loadI      | 32776 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 14              
//15       21       store      | -1    17    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 15              
//16       22       load       | 0     26    0     11    | -1    -1    -1    inf   | 14    14    2     23    | 16              
//17       23       add        | 0     26    0     inf   | 1     22    1     13    | 0     25    0     12    | 17              
//18       24       loadI      | 32780 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 18              
//19       25       store      | -1    14    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 19              
//20       26       load       | 0     25    0     13    | -1    -1    -1    inf   | 15    15    2     23    | 20              
//21       27       add        | 0     25    0     inf   | 1     22    1     15    | 0     24    0     14    | 21              
//22       28       loadI      | 32784 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 22              
//23       29       store      | -1    15    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 23              
//24       30       load       | 0     24    0     15    | -1    -1    -1    inf   | 16    12    2     24    | 24              
//25       31       add        | 0     24    0     inf   | 1     22    1     17    | 0     23    0     16    | 25              
//26       32       loadI      | 32788 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 26              
//27       33       store      | -1    12    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 27              
//28       34       load       | 0     23    0     17    | -1    -1    -1    inf   | 17    13    2     24    | 28              
//29       35       add        | 0     23    0     inf   | 1     22    1     19    | 0     21    0     18    | 29              
//30       36       loadI      | 32792 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 30              
//31       37       store      | -1    13    2     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 31              
//32       38       load       | 0     21    0     19    | -1    -1    -1    inf   | 18    10    2     25    | 32              
//33       39       add        | 0     21    0     inf   | 1     22    1     inf   | 0     20    1     20    | 33              
//34       40       load       | 0     20    1     inf   | -1    -1    -1    inf   | 19    11    1     25    | 34              
//35       42       loadI      | 32768 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    0     inf   | 35              
//36       43       load       | -1    -1    0     inf   | -1    -1    -1    inf   | -1    18    0     inf   | 36              
//37       44       add        | 10    18    0     inf   | 11    19    3     inf   | 20    8     3     26    | 37              
//38       45       loadI      | 32772 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    0     inf   | 38              
//39       46       load       | -1    -1    0     inf   | -1    -1    -1    inf   | -1    16    0     inf   | 39              
//40       47       loadI      | 32796 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 40              
//41       48       store      | -1    8     3     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 41              
//42       49       loadI      | 32776 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    3     inf   | 42              
//43       50       load       | -1    -1    3     inf   | -1    -1    -1    inf   | -1    17    3     inf   | 43              
//44       51       add        | 12    16    0     inf   | 13    17    3     inf   | 21    9     3     26    | 44              
//45       52       loadI      | 32780 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    0     inf   | 45              
//46       53       load       | -1    -1    0     inf   | -1    -1    -1    inf   | -1    14    0     inf   | 46              
//47       54       loadI      | 32800 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 47              
//48       55       store      | -1    9     3     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 48              
//49       56       loadI      | 32784 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    3     inf   | 49              
//50       57       load       | -1    -1    3     inf   | -1    -1    -1    inf   | -1    15    3     inf   | 50              
//51       58       add        | 14    14    0     inf   | 15    15    3     inf   | 22    6     3     27    | 51              
//52       59       loadI      | 32788 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    0     inf   | 52              
//53       60       load       | -1    -1    0     inf   | -1    -1    -1    inf   | -1    12    0     inf   | 53              
//54       61       loadI      | 32804 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 54              
//55       62       store      | -1    6     3     inf   | -1    -1    -1    inf   | -1    -1    4     inf   | 55              
//56       63       loadI      | 32792 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    3     inf   | 56              
//57       64       load       | -1    -1    3     inf   | -1    -1    -1    inf   | -1    13    3     inf   | 57              
//58       65       add        | 16    12    0     inf   | 17    13    3     inf   | 23    7     3     27    | 58              
//59       66       add        | 18    10    2     inf   | 19    11    1     inf   | 24    5     1     28    | 59              
//60       68       loadI      | 32796 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    2     inf   | 60              
//61       69       load       | -1    -1    2     inf   | -1    -1    -1    inf   | -1    8     2     inf   | 61              
//62       70       loadI      | 32800 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    0     inf   | 62              
//63       71       load       | -1    -1    0     inf   | -1    -1    -1    inf   | -1    9     0     inf   | 63              
//64       72       add        | 20    8     2     inf   | 21    9     0     inf   | 20    4     0     28    | 64              
//65       73       loadI      | 32804 -1    -1    inf   | -1    -1    -1    inf   | -1    -1    2     inf   | 65              
//66       74       load       | -1    -1    2     inf   | -1    -1    -1    inf   | -1    6     2     inf   | 66              
//67       75       add        | 22    6     2     inf   | 23    7     3     inf   | 21    3     3     29    | 67              
//68       76       add        | 20    4     0     inf   | 24    5     1     inf   | 20    2     1     29    | 68              
//69       77       add        | 20    2     1     inf   | 21    3     3     inf   | 20    0     3     31    | 69              
//70       79       loadI      | 0     -1    -1    inf   | -1    -1    -1    inf   | 0     1     1     31    | 70              
//71       80       store      | 20    0     3     inf   | -1    -1    -1    inf   | 0     1     1     inf   | 71              
//72       81       output     | 0     -1    -1    inf   | -1    -1    -1    inf   | -1    -1    -1    inf   | 72